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
win 和 Linux 双系统时间同步解决方案
  - https://wiki.archlinux.org/index.php/System_time
  - 或者搜索 System time arch 搜索到详细文档
