#!/bin/bash
# copy /etc/X11/xinit/xinitrc to ~/.xinitrc,
# 然后添加自己的配置文件,比如如下的启动选择
# 注意 exec 命令之后行会无效，在 arch 官网 xinit 有讲到
# 注意 /etc/X11/xinit/xinitrc 最后命令 xclock 和 xterm 没有安装需要注意

LANG=zh_CN.UTF-8
deskSession=${1:-xfce}
case $deskSession in
	i3	) 	exec i3 -V >> ~/i3-logs/i3-$(date +%Y-%m-%d)-log.txt 2>&1;;
	xfce	)	exec startxfce4;;
	*	)	exec $1;;
esac
