pacman -S fcitx5                    # 核心
pacman -S fcitx5-chinese-addons     # 中文支持，包含 拼音，双拼，五笔，等
pacman -S fcitx5-qt fcitx5-gtk      # 解决输入法挂死，输入法不跟随的情况
在 /etc/environment 中添加
   ```
   GTK_IM_MODULE=fcitx
   QT_IM_MODULE=fctix
   XMODIFIERS=@im=fcitx
   
   # 对于一些情况，比如 Dota2 的输入法问题需要加入这个变量
   SDL_IM_MODULE=fcitx
   ```
pacman -S fcitx5-configtool         # GUI配置工具

# 如果是桌面环境则输入法可以自启动，如果是 i3窗口管理器则需要执行 fcitx5 命令
