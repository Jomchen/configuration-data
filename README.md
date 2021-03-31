# configuration-data
   * 一些个人计算机配置。


* 时间科普
   - GMT：Greenwich Mean Time，即格林尼治标准时间，也就是世界时。GMT 以地球自转为基础的时间计量系统，但由于地球自转不均匀，导致 GMT 不精确，现在已经不再作为世界标准时间使用。
   - UTC：Universal Time Coordinated，即协调世界时。UTC 是以原子时秒长为基础，在时刻上尽量接近于 GMT 的一种时间计量系统。为确保 UTC 与 GMT 相差不会超过 0.9 秒，在有需要的情况下会在 UTC 内加上正或负闰秒。UTC 现在作为世界标准时间使用。
   - RTC：Real-Time Clock，即实时时钟，在计算机领域作为硬件时钟的简称。
   - 世界上不同地区所在的时区是不同的，这些时区决定了当地的本地时间。比如北京处于东八区，即北京时间为 UTC + 8，如果 UTC 时间现在是上午 6 点整，那么北京时间为 14 点整。
   - Windows 与 Linux 看待硬件时间的方式不同。Windows 把电脑的硬件时钟（RTC）看成是本地时间，即 RTC = Local Time，Windows 会直接显示硬件时间；而 Linux 则是把电脑的硬件时钟看成 UTC 时间，即 RTC = UTC，那么 Linux 显示的时间就是硬件时间加上时区。






* 必装软件
   1. 在系统安装时必装
      - pacman -S dhcpcd
      - pacman -S wpa_supplicant
      - pacman -S NetworkManager
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
      - pacman -S i3-gaps           # 平铺窗口管理器
   4. 图形界面必须
      - fcitx5 方案（首选，推荐）
         - 查看 fcitx5 文件夹 readme.txt
      - fcitx 方案
         - 查看 fcitx 文件夹 readme.txt
* 其它安装
   1. step1
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

