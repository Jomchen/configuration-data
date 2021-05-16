如果用的是 lightdm 的 display manager，则注意 /etc/lightdm/lightdm.conf 中
需要如下配置
   ```
   [VNCserver]
   enabled=true
   command=Xvnc -rfbauth /etc/vncpasswd
   port=5900
   listen-address=0.0.0.0
   width=1024
   height=768
   depth=24
   ```
* 如果你在试图用 ssh 管道，导致 "end of steam" 最有可能是 ssh 不能连接到目标 vnc server，所以它记录日志错误并关闭ssh
   ```
   连接失败 End of stream 的原因解释原话
   https://vnc-tight-list.narkive.com/zCc8u6Xz/receiving-end-of-stream-upon-connection
   
   If you are trying to connect via an SSH tunnel then the most likely cause of
   "end of stream" is that the SSH server isn't able to connect out to the
   target VNC server, so it logs an error and the SSH client then closes the
   connection from the VNC viewer.
   ```

* 是否 服务端的 /etc/vncpasswd 没有相应的读取权限？
* sshd_config 的文件 #PasswordAuthentication yes 应该这样注释起来
* 可能是 /etc/lightdm/lightdm.conf 中 VNCServer 中 depth 应该改为 24
* ssh 的 -L 命令 详解 https://zhuanlan.zhihu.com/p/57630633
