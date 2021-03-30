# configuration-data
   - 一些个人计算机配置。


pacman -S dhcpcd
pacman -S wpa_supplicant
pacman -S NetworkManager
pacman -S sudo
pacman -S gvim
pacman -S git

pacman -S wqy-microhei      # 安装中文字体，文泉驿微米黑
pacman -S ttf-dejave        # 安装一个好看的英文字体
pacman -S xfce4
pacman -S xfce4-goodies（非必需，xfce4的额外组件）
pacman -S lightdm           # 安装登录界面
pacman -S i3-gaps           # 平铺窗口管理器


fcitx 方案
   - 查看 fcitx 文件夹 readme.txt
fcitx5 方案
   - 查看 fcitx5 文件夹 readme.txt

pacman -S picom             # 窗口透明
pacman -S feh               # 图片查看器
pacman -S keynav            # 鼠标替代
pacman -S ranger            # 快速搜索
pacman -S tlp               # 电源管理
pacman -S alsa-utils        # 安装音频工具
   - alsa 默认在内核所以只需安装调度工具
   - 包含 alsamixer, amixer 命令
   - 默认静音，解决方案
      - amixer sset Master unmute
      - amixer sset Speaker unmute
      - amixer sset Headphone unmute
安装 aur 和 谷歌浏览器
   - git clone https://aur.archlinux.org/yay.git
   - 解压相应的包
   - cd yay
   - makepkg -is            # 安装yay
   - yay -S google-chrome   # 安装谷歌浏览器
安装文件管理器,终端预览图片
   - pacman -S ranger # 命令行文件管理器
      - 把文件 /usr/share/doc/ranger/config/rc.conf 文件复制到 ~/.config/ranger/rc.conf 并修改点内容
      - 注意 /usr/share/doc/ranger/config/scope.h 文件包含了预览图片，文件，视频，pdf 等的方式，可以按之前方式复制后把相应注释打开
         ```
         set preview_images true
         set preview_images_method w3m
         ```
   - pacman -S w3m    # 终端浏览器，实际可在终端预览视频和图片
   - 如果还不能预览图片说明当前终端不支持预览图片，需要安装一个支持预览图片的终端

win 和 Linux 双系统时间同步解决方案
  - https://wiki.archlinux.org/index.php/System_time
  - 或者搜索 System time arch 搜索到详细文档

