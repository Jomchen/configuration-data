* 说明
   #!/bin/bash
   # copy /etc/X11/xinit/xinitrc to ~/.xinitrc,
      # 根据官网说明，如果要自定义 ~/.xinitrc 时，
      # 一定要确保 /etc/X11/xinit/xinitrc 的最后一个 if 语句块要包含在 ~/.xinitrc 中以确保加载 /etc/X11/xinit/xinitrc.d 目录
      # 因为 startx 默认执行 /etc/X11/xinit/xinitrc（如果 ~/.xinitrc 不存在时），否则会执行 ~/.xinitrc
      # 建议长时间运行的任务命令加上 & 以在后台执行

   # 然后添加自己的配置文件,比如如下的启动选择
   # 注意 exec 命令之后行会无效，在 arch 官网 xinit 有讲到
   # 注意 /etc/X11/xinit/xinitrc 最后命令 xclock 和 xterm 没有安装需要注意
   # 注意 因为 i3 执行时有日志输出，所以需要手动创建对应的日志记录文件夹



# 内容
```
编辑 ~/.xinitrc

#!/bin/bash

... 省略号部分内容应该复制源于 /etc/X11/xinit/xinitrc 中的内容
# 但是也应该注意 复制的内容中有些指令应该注释掉，比如：xterm, xclock, twm
# 复制内容时注意 exec 命令行应该出现在最后，否则其它的资源加载可能不生效（参考 xorg, xinit, display manager, 的维基文档）

LANG=zh_CN.UTF-8
LC_LANG=und
deskTopChoice=${1:-xfce}

if [ ! -e ~/i3-logs ];then
   mkdir ~/i3-logs
fi
case $deskTopChoice in
	i3	) exec i3 -V >> ~/i3-logs/i3-$(date +%Y-%m-%d)-log.txt 2>&1;;
	xfce	) exec startxfce4;;
	*	) exec $1;;
esac
```
