* 本目录有个隐藏文件，是 .xinitrc 用于启动桌面的，到时候登录系统后可以在命令行窗口执行以下语句进行启动桌面
执行一条命令 startx ~/.xinitrc i3
   这会启动 i3-gaps 窗口管理器
执行一条命令 startx ~/.xinitrc xfce
   这会启动 xfce 桌面环境




Xorg 的定义 ------------------------------------------------------------------------------------------
Xorg 的定义
   Monitor: refers to a physical display device, such as an LCD panel.
   Screen: refers to an X-Window screen (that is: a monitor attached to a display).
   Display: refers to a collection of screens that are in use at the same time showing parts of a single desktop (you can drag windows among all screens in a single display).
   Monitor: 物理的显示设备
   Screen: 已经连接到整体画面的显示器
   Display: 显示画面（因为可以多屏组合显示的功能，组合后的整体画面为 Display）


xrandr 的设置 ------------------------------------------------------------------------------------------

lspci -v | grep -A1 -e VGA -e 3D         # 查看显卡
xdpyinfo | grep -B2 resolution           # 查询分辨率和使用的 dpi
xrandr --listmonitors                    # 查看已经显示的显示器

** /etc/X11/xorg.conf 修改分辨率的配置文件

** 屏幕输出的命令
   xrandr                                                   # 查看显示设备
   xrandr --output VGA1 --primary                           # 设置 VGA1 为主要输出
   xrandr --output VGA1 --mode 1920x1080                    # 设置 VGA1 分辨率为 1920x1080
   xrandr --output VGA1 --mode 1920x1080 --dpi 数字                    # 设置 VGA1 分辨率为 1920x1080，dpi为数字
   xrandr --output VGA1 --mode 1920x1080 --scale 数字                    # 设置 VGA1 分辨率为 1920x1080，并拉伸，数字比1大时字体越小，数字比1小时字体越大
   xrandr --output VGA1 --mode 1920x1080 相对输出方式 LVDS1 # 设置 VGA1 到 LVDS1 的指定侧，并且分辨率为 1920x1080
      - 相对输出方式为 --left-of # 在...左边
      - 相对输出方式为 --right-of # 在...右边
      - 相对输出方式为 --above # 在...上面
      - 相对输出方式为 --below # 在...下面
      - 相对输出方式为 --same-as # 与...同画面
   xrandr --output VGA1 --mode 1920x1080 --rate 90          # 设置 VGA1 分辨率为 1920x1080，刷新率为90
   xrandr --output VGA1 --mode 1920x1080 --rotate <normal/left/right/inverted> # 设置 VGA1 分辨率为 1920x1080，并按指定方向旋转


详情看高分辨率显示（i3wm 官网的最后一小节 High-resolution displays(aka HIDPI displays）
See https://wiki.archlinux.org/index.php/HiDPI for details on how to enable scaling in various parts of the Linux desktop. i3 will read the desired DPI from the Xft.dpi property. The property defaults to 96 DPI, so to achieve 200% scaling, you’d set Xft.dpi: 192 in ~/.Xresources.
If you are a long-time i3 user who just got a new monitor, double-check that:
You are using a scalable font (starting with “pango:”) in your i3 config.
You are using a terminal emulator which supports scaling. You could temporarily switch to gnome-terminal, which is known to support scaling out of the box, until you figure out how to adjust the font size in your favorite terminal emulator.


xorg 的配置 ------------------------------------------------------------------------------------------

参考 Xorg(5.2) -> Multihead

***************************************************案例1-Start

# 注意！！显卡配置需要先于 Monitor 被加载，
# 即显卡配置文件名的前缀数字应该小于显示器配置文件的前缀数字

# 显卡配置文件 05-device.conf
Section "Device"
    # 应该与实际视频设备品匹配；检查 /var/log/Xorg.0.log 确认这一点
    Identifier "radeon"
    # 驱动器名（显卡名）
    Driver "ati"
    # monitor-VGA-1 是检测到的显示器，通过 xrandr -q 查询
    # VGA 用来引用显示器的标识
    Option "monitor-VGA-1" "VGA"
    Option "monitor-DVI-0" "DVI"
EndSection

-------------------------------------------------------------------

# 显示器配置文件 10-monitor.conf
Section "Monitor"
    Identifier "VGA"
    Option "Rotate" "Left"
EndSection

Section "Monitor"
    Identifier "DVI"
    Option "Rotate" "Left"
    Option "RightOf" "VGA"
EndSection
***************************************************案例1-End

***************************************************案例2-Start

# 基本显示器配置

Section "Monitor"
    # 这是显示器的名字，可以通过 xrandr 查看
    Identifier "VGA1"
    # 设置此显示器为主要显示器
    Option "Primary" "true"
EndSection

Section "Monitor"
    # 这是显示器的名字，可以通过 xrandr 查看
    Identifier "HDMI1"
    # 将 HDMI1 设置显示为 VGA1 的左边
    Option "LeftOf" "VGA1"
    # 将最喜欢的分辨率设置为 "1920x1080"；
    # 也可以写为 "1920x1080_60.00"，但是这里的 60.00 不知道是什么意义
    Option "PreferredMode" "1920x1080"
    # 屏幕往左旋转90度
    Option "Rotate" "Left"
    # 色深 24
    DefaultDepth 24
EndSection
***************************************************案例2-End

***************************************************案例3-Start

# 这是组合屏案例

Section "Monitor"
    Identifier  "VGA1"
    Option      "PreferredMode" "1024x768"
    Option      "Position" "1920 312"
EndSection

Section "Monitor"
    Identifier  "HDMI1"
    Option      "PreferredMode" "1920x1080"
    Option      "Position" "0 0"
EndSection

(0,0)-----------------+
|                     |(1920,312)---+
|     1920 x 1080     ||            |
|        HDMI1        || 1024 x 768 |
|                     ||    VGA1    |
+---------------------++------------+
***************************************************案例3-End

***************************************************案例4-Start

# 显示设置（注意三项中名字的相互引用）

# 设置显示器
Section "Monitor"
    Identifier "VGA1"
    Modeline "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
    Option "PreferredMode" "1280x1024_60.00"
EndSection

# 显示设置案例
Section "Screen"
    Identifier "Screen0"
    Monitor "VGA1"
    DefaultDepth 24
    SubSection "Display"
        Modes "1280x1024_60.00"
    EndSubSection
EndSection

# 设置显卡设置
Section "Device"
    Identifier "Device0"
    Driver "intel"
EndSection
***************************************************案例4-End

