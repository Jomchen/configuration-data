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
