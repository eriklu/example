import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.http.DefaultFullHttpRequest;
import io.netty.handler.codec.http.DefaultLastHttpContent;
import io.netty.handler.codec.http.FullHttpRequest;
import io.netty.handler.codec.http.HttpClientCodec;
import io.netty.handler.codec.http.HttpContent;
import io.netty.handler.codec.http.HttpMethod;
import io.netty.handler.codec.http.HttpResponse;
import io.netty.handler.codec.http.HttpVersion;

import java.io.FileOutputStream;
import java.net.URI;
import java.net.URISyntaxException;





public class NettyTest {

  /**
	 * @param args
	 * @throws Throwable 
	 */
	//http://adown.myaora.net:81/test/apkfile/72da6829117a7dcc5a7efd7cb7c34a99.apk
	public static void main(String[] args) throws Throwable {
		NioEventLoopGroup group = new NioEventLoopGroup();
		
		NettyDownloadTask task = new NettyDownloadTask(group);
		new Thread(task).start();
		System.in.read();
		//group.shutdownGracefully();
		task.stop();
	}

}

class NettyDownloadTask implements Runnable {
	String url = "http://adown.myaora.net:81/test/apkfile/72da6829117a7dcc5a7efd7cb7c34a99.apk";//"http://127.0.0.1:10000/test/apkfile/72da6829117a7dcc5a7efd7cb7c34a99.apk";//
	NioEventLoopGroup group;
	Channel ch;
	
	public NettyDownloadTask(NioEventLoopGroup group){
		this.group = group;
	}
	
	public void run() {
		try {
			URI uri = new URI(url);
			String host = uri.getHost();
			int port = uri.getPort();
			port = port<=0 ? 80 : port;
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioSocketChannel.class).handler(new NettyDownloadIntializer());
			
		    ch = b.connect(host, port).sync().channel();
			FullHttpRequest request =
			        new DefaultFullHttpRequest(HttpVersion.HTTP_1_1, HttpMethod.GET, uri.getPath());
			request.headers().set("Host", uri.getHost());
			ch.writeAndFlush(request).syncUninterruptibly();
			ch.closeFuture().sync();
			
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("run over");
	}
	
	public void stop(){
		ch.close().syncUninterruptibly();
	}
}

class NettyDownloadIntializer extends ChannelInitializer<SocketChannel> {

	@Override
	protected void initChannel(SocketChannel ch) throws Exception {
		ChannelPipeline pipeline = ch.pipeline();
		pipeline.addLast("codec", new HttpClientCodec());
		//pipeline.addLast("inflater", new HttpContentDecompressor());

		//pipeline.addLast("chunkedWriter", new ChunkedWriteHandler());
        pipeline.addLast("handler", new NettyDownloadhandler());
		
	}
	
}

class NettyDownloadhandler extends ChannelInboundHandlerAdapter{
	int contentlen = 0;
	int recv = 0;
	FileOutputStream out ;
	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg)
			throws Exception {
		//super.channelRead(ctx, msg);
		//System.out.println(msg.getClass() + "|" + (msg instanceof HttpContent));
		if(msg instanceof HttpResponse){
			HttpResponse resp = (HttpResponse)msg;
			System.out.println(resp.headers().entries());
			System.out.println(resp.getStatus().code());
			contentlen = Integer.parseInt(resp.headers().get("Content-Length"));
			out = new FileOutputStream("temp.jar");
		}else if(msg instanceof HttpContent){
			ByteBuf buf = ((HttpContent)msg).content();
			recv += buf.capacity();
			out.write(buf.array());
			if(msg instanceof DefaultLastHttpContent){
				out.close();
			}
			System.out.println(recv * 100 / contentlen +  "%");
		}
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		

		//super.channelReadComplete(ctx);
		//System.out.println("channelReadComplete!!!!!!");
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause)
			throws Exception {
		//super.exceptionCaught(ctx, cause);
		cause.printStackTrace();
		if(out != null){
			out.close();
		}
	} 
	
}

