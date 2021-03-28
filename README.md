# configuration-data

# Some configurations of personal computer.
   - 一些个人计算机配置。



pacman -S dhcpcd
pacman -S wpa_supplicant
pacman -S sudo
pacman -S gvim
pacman -S git
pacman -S i3-gaps
pacman -S xfce4
pacman -S xfce4-goodies（非必需，xfce4的额外组件）
pacman -S lightdm           # 安装登录界面
pacman -S fcitx             # 桌面环境
pacman -S fcitx-im          # fcitx组件，防止输入法窗口不跟随输入法窗口挂死
pacman -S fcitx-table-extra # 输入法的字符集扩展
pacman -S picom             # 窗口透明
pacman -S feh               # 图片查看器
pacman -S keynav            # 鼠标替代
pacman -S ranger            # 快速搜索
pacman -S tlp               # 电源管理
pacman -S alsa-utils # 安装音频工具
   - alsa 默认在内核所以只需安装调度工具
   - 包含 alsamixer, amixer 命令
   - 默认静音，解决方案
      - amixer sset Master unmute
      - amixer sset Speaker unmute
      - amixer sset Headphone unmute

win 和 Linux 双系统时间同步解决方案
  - https://wiki.archlinux.org/index.php/System_time
  - 或者搜索 System time arch 搜索到详细文档
