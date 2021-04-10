pacman -S fcitx             # Core package
pacman -S fcitx-ui-light    # GUI package
pacman -S fcitx-table-extra # Support more language.(for example Wubi)
pacman -S fcitx-im          # In order to let the fcitx stable.

把 .pam_environment 放在家目录



# 如果是桌面环境，则输入法可以自启动，如果是 i3窗口管理器，需要加入 fcitx 的执行命令 
