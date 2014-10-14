.class Ldebug/Task;
.super Ljava/lang/Thread;
.source "DebugTool.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
  
    :try_start_0

        const-string v0, "BzWgKak+nXLh5tKmoUVvlA=="
        const-string v1, "KeyTools"
        invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

        invoke-static {}, Lcom/wifiin/jni/JNI;->a()Lcom/wifiin/jni/JNI;
        move-result-object v1
        
        invoke-virtual {v1, v0}, Lcom/wifiin/jni/JNI;->getDecrypt(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        const-string v1, "KeyTools"
        invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

        new-instance v0, Ljava/io/IOException;
        invoke-direct {v0}, Ljava/io/IOException;-><init>()V

        throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0


    :catch_0
    move-exception v0

    return-void
.end method
