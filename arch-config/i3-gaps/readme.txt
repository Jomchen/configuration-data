** lspci -v | grep -A1 -e VGA -e 3D                         # 查看显卡

** /etc/X11/xorg.conf 修改分辨率的配置文件

** 屏幕输出的命令
   xrandr                                                   # 查看显示设备
   xrandr --output VGA1 --primary                           # 设置 VGA1 为主要输出
   xrandr --output VGA1 --mode 1920x1080                    # 设置 VGA1 分辨率为 1920x1080
   xrandr --output VGA1 --mode 1920x1080 相对输出方式 LVDS1 # 设置 VGA1 到 LVDS1 的指定侧，并且分辨率为 1920x1080
      - 相对输出方式为 --left-of # 在...左边
      - 相对输出方式为 --right-of # 在...右边
      - 相对输出方式为 --above # 在...上面
      - 相对输出方式为 --below # 在...下面
      - 相对输出方式为 --same-as # 与...同画面
   xrandr --output VGA1 --mode 1920x1080 --rate 90          # 设置 VGA1 分辨率为 1920x1080，刷新率为90
   xrandr --output VGA1 --mode 1920x1080 --rotate <normal/left/right/inverted> # 设置 VGA1 分辨率为 1920x1080，并按指定方向旋转

** DPI设置
   xdpyinfo | grep -B2 resolution # 查询分辨率和使用的 dpi

详情看高分辨率显示（i3wm 官网的最后一小节 High-resolution displays(aka HIDPI displays）
See https://wiki.archlinux.org/index.php/HiDPI for details on how to enable scaling in various parts of the Linux desktop. i3 will read the desired DPI from the Xft.dpi property. The property defaults to 96 DPI, so to achieve 200% scaling, you’d set Xft.dpi: 192 in ~/.Xresources.
If you are a long-time i3 user who just got a new monitor, double-check that:
You are using a scalable font (starting with “pango:”) in your i3 config.
You are using a terminal emulator which supports scaling. You could temporarily switch to gnome-terminal, which is known to support scaling out of the box, until you figure out how to adjust the font size in your favorite terminal emulator.



Place the file into ~/.config/i3

# switch wall paper for feh
```
   #!/bin/sh
   while true; do
   	find ~/图片 -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
   		shuf -n1 -z | xargs -0 feh --bg-scale
   	sleep 15m
   done
```

