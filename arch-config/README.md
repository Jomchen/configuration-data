* configuration-data
   - 一些个人计算机配置。

* 在archlinux在安装intel驱动后，如果使用有问题建议回滚
   ```
   This driver(xf86-video-intel) now uses DRI3 as the default Direct Rendering
   Infrastructure. You can try falling back to DRI2 if you run into trouble.
   to do so, save a file with the following content as /etc/X11/xorg.conf.d/20-intel.conf:
   
   /etc/X11/xorg.conf.d/20-intel.conf
   Section "Device"
     Identifier "Intel Graphics"
     Driver     "intel"
     Option     "DRI" "2"            # DRI3 is now default
     #Option     "AccelMethod" "sna" # default
     #Option     "AccelMethod" "uxa" # fallback
   EndSection
   ```
* Some tools connectting directly to google store 
   - PP谷歌访问助手:https://chrome.zzzmh.cn/info?token=kahndhhhcnignmbbpiobmdlgjhgfkfil
   - 集装箱:https://chrome.zzzmh.cn/info?token=kbgigmcnifmaklccibmlepmahpfdhjch
   - 谷歌访问助手:https://chrome.zzzmh.cn/info?token=gocklaboggjfkolaknpbhddbaopcepfp
   - 谷歌学术助手:https://chrome.zzzmh.cn/info?token=jkicnibdkfemnfhojeajbldjgdddpajk
   - 谷歌服务助手:https://chrome.zzzmh.cn/info?token=cgncbhnhlkbdieckbbmeppcefokppagh
   - 谷歌上网助手:https://chrome.zzzmh.cn/info?token=nonmafimegllfoonjgplbabhmgfanaka


* 在 wine 上装 qq 的教程
   - Wine 完全中文博客教程 https://blog.csdn.net/gerald_jones/article/details/80781378
      - 2018-06-23 10:20:10 更新
   - Wine 安装+中文配置+使用总结帖 https://blog.csdn.net/zzxian/article/details/7166572
      - 2011-12-31 00:46:10 更新
   - http://www.360doc.com/content/17/0510/17/41615103_652744902.shtml
      - 2017-05-10 更新
   - https://www.ubuntukylin.com/ukylin/forum.php?mod=viewthread&tid=30511
      - 2017-05-08 22:51:38 更新


* 必装软件
   1. 在系统安装时必装
      - pacman -S dhcpcd            # 动态ip分配工具
      - pacman -S wpa_supplicant    # 无线网连接工具
      - pacman -S NetworkManager    # 网络管理工具
      - pacman -S iproute2          # 提供对 network interface, ipaddress, routing table 的管理，工具包中包含 ip, ss, 等命令
      - pacman -S gvim
   2. 在系统安装后必装
      - pacman -S sudo
      - pacman -S git
   3. 系统调整
      - pacman -S wqy-microhei      # 安装中文字体，文泉驿微米黑
      - pacman -S ttf-dejave        # 安装一个好看的英文字体
      - pacman -S xorg              # 图形界面支持
      - pacman -S xfce4
      - pacman -S xfce4-goodies（非必需，xfce4的额外组件）
      - pacman -S lightdm           # 安装登录界面
         - pacman -S lightdm-gtk-greeter
         - 为登录界面安装登录迎宾者，即 lightdm 默认的 lightdm-gtk-greeter
      - pacman -S i3-gaps           # 平铺窗口管理器
   4. 图形界面必须
      - fcitx5 方案（首选，推荐）
         - 查看 fcitx5 文件夹 readme.txt
      - fcitx 方案
         - 查看 fcitx 文件夹 readme.txt
* 其它安装
   1. step1
      - pacman -S neofetch          # 优雅显示系统信息
      - pacman -S w3m               # 终端浏览器，实际可在终端预览视频和图片
      - pacman -S picom             # 窗口透明
      - pacman -S feh               # 图片查看器
      - pacman -S keynav            # 鼠标替代
      - pacman -S ranger            # 快速搜索
      - pacman -S tlp               # 电源管理
      - pacman -S alsa-utils        # 安装音频工具
         - alsa 默认在内核所以只需安装调度工具
         - 包含 alsamixer, amixer 命令
         - 默认静音，解决方案
            - amixer sset Master unmute
            - amixer sset Speaker unmute
            - amixer sset Headphone unmute
      - pacman vlc                  # 视频播放器
      - pacman wine                 # windows 的虚拟容器
      - pacman wireshark-qt         # 视图化的抓包工具（与命令性质的择其一安装）
         - pacman wireshark-cli         # 命令性质的抓包工具
      - pacman zip                  # zip 压缩工具
      - pacman unzip                # zip 解压工具
      - pacman ntfs-3g              # 可以挂载 ntfs 的软件支持
      - pacman openssh              # openssh 工具
      - tigervnc                    # 远程视图工具（已包含客户端和服务端）
      - git                         # 版本控制工具

   2. step2
      1. 安装 aur 和 google-chrome
         - git clone https://aur.archlinux.org/yay.git
         - 解压相应的包
         - cd yay
         - makepkg -is            # 安装yay
         - yay -S google-chrome   # 安装谷歌浏览器
      2. 安装文件管理器,终端预览图片
         1. pacman -S w3m    # 终端浏览器，实际可在终端预览视频和图片
         2. pacman -S ranger # 命令行文件管理器
            - 把文件 /usr/share/doc/ranger/config/rc.conf 文件复制到 ~/.config/ranger/rc.conf 并修改点内容
            - 注意 /usr/share/doc/ranger/config/scope.h 文件包含了预览图片，文件，视频，pdf 等的方式，可以按之前方式复制后把相应注释打开
               ```
               set preview_images true
               set preview_images_method w3m
               ```
         3. 如果还不能预览图片说明当前终端不支持预览图片，需要安装一个支持预览图片的终端

* 注意事项
   1. win 和 Linux 双系统时间同步解决方案
     - https://wiki.archlinux.org/index.php/System_time
     - 或者搜索 `System time arch` 搜索到双系统的时间解决方案
   2. linux 中用 wine 安装 qq方案
     - https://wiki.archlinux.org/index.php/Tencent_QQ_

* 其它问题
   - 解决 Arch 上 mysql-workbench 报 org.freedesktop.secrets was provided by any .service files 的异常
      - pacman -S gnome-keyring libsecret


* 当前要做的事
   1. xorg 远程视图化连接
      - https://www.dazhuanlan.com/2020/01/18/5e230bf943ad6/
      - https://www.jianshu.com/p/24663f3491fa
   2. i3-gaps 上 polybar 的配置
      - 音量
      - 电量
      - 网络
      - 时间
      - 蓝牙
      - backlight
      - ipc
   3. 关于 Linux 上的系统字体（在没有桌面环境的情况下）
   4. bluetooth
   5. 关于网络的操作和静态ip地址配置
   6. openvpn

* ploybar 需要学习的网址
   - https://blog.csdn.net/qq_33215865/article/details/84720212
   - https://www.jianshu.com/p/fd07c3081493


