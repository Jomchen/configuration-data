#!/bin/bash
# the file should copy /etc/X11/xinit/xinitrc to ~/.xinitrc,
# then add your own configuration

LANG=zh_CN.UTF-8
deskSession=${1:-xfce}
case $deskSession in
	i3	) 	exec i3 -V >> ~/i3-logs/i3-$(date +%Y-%m-%d)-log.txt 2>&1;;
	xfce	)	exec startxfce4;;
	*	)	exec $1;;
esac
