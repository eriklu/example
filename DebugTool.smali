.class public Ldebug/DebugTool;
.super Ljava/lang/Object;
.source "DebugTool.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static format(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "msg"

    .prologue
    .line 15
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyymmdd HHMMss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 16
    .local v0, sdf:Ljava/text/SimpleDateFormat;
    const-string v1, "%s:%s\n"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static log2File(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 38
    const-string v0, "DebugTools.log"

    invoke-static {v0, p0}, Ldebug/DebugTool;->log2File(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public static log2File(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "logname"
    .parameter "msg"

    .prologue
    .line 23
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 24
    .local v3, sdCardDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .local v2, logFile:Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v4, 0x1

    invoke-direct {v1, v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 26
    .local v1, fout:Ljava/io/FileOutputStream;
    invoke-static {p1}, Ldebug/DebugTool;->format(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/FileOutputStream;->write([B)V

    .line 27
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 35
    .end local v1           #fout:Ljava/io/FileOutputStream;
    .end local v2           #logFile:Ljava/io/File;
    .end local v3           #sdCardDir:Ljava/io/File;
    :goto_0
    return-void

    .line 28
    :catch_0
    move-exception v0

    .line 30
    .local v0, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 31
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 33
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static log2File(Ljava/lang/String;[B)V
    .locals 7
    .parameter "logname"
    .parameter "msg"

    .prologue
    .line 43
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 44
    .local v3, sdCardDir:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    .local v2, logFile:Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v5, 0x1

    invoke-direct {v1, v2, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 46
    .local v1, fout:Ljava/io/FileOutputStream;
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyymmdd HHMMss"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 47
    .local v4, sdf:Ljava/text/SimpleDateFormat;
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 48
    const-string v5, ":"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 49
    invoke-virtual {v1, p1}, Ljava/io/FileOutputStream;->write([B)V

    .line 50
    const-string v5, "\n"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/io/FileOutputStream;->write([B)V

    .line 51
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 59
    .end local v1           #fout:Ljava/io/FileOutputStream;
    .end local v2           #logFile:Ljava/io/File;
    .end local v3           #sdCardDir:Ljava/io/File;
    .end local v4           #sdf:Ljava/text/SimpleDateFormat;
    :goto_0
    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 54
    .local v0, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 55
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 57
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public static log2File([B)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 62
    const-string v0, "DebugTools.log"

    invoke-static {v0, p0}, Ldebug/DebugTool;->log2File(Ljava/lang/String;[B)V

    .line 63
    return-void
.end method

.method public static startTask()V
    .locals 2

    const-string v0, "KeyTools"
    const-string v1, "startTask"
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .prologue
    .line 66
    new-instance v0, Ldebug/Task;

    invoke-direct {v0}, Ldebug/Task;-><init>()V

    .line 67
    .local v0, t:Ldebug/Task;
    invoke-virtual {v0}, Ldebug/Task;->start()V

    .line 68
    return-void
.end method
