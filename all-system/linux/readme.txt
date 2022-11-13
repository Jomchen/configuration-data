* 学习资料，学习工具大全览地址
   - https://www.r2coding.com/#/
* Linux终端中的字符串使用总结（截取，切片，查找替换，转换，变量赋值等）
https://www.cnblogs.com/oboth-zl/p/10314071.html

* IPLC IEPL 专线

* 抓包工具
   - Wireshark 功能强大，跨平台 Windows, Linux, MacOS 的抓包和分析工具，依赖 GUI 环境
   - Tcpdmp 功能强大的命令行抓包和分析工具；没有GUI，广泛用于服务器端的抓包和分析

* 远程让服务器执行命令的方式
   - https://www.jb51.net/article/171544.htm
* 远程桌面工具
   - https://www.likecs.com/show-175710.html

* 重要的软件或配置
   - jp2a # 转换 jpg 图像为 ascii 码图
   - zsh  # 一个更好用的终端（但是所有的配置需要自己重新配置）
      - oh-my-zsh # 整理了常用的 zsh 扩展和主题，所以先安装 oh-my-zsh
         - oh-my-zsh官网 https://ohmyz.sh/
         - oh-my-zsh github网址 https://github.com/robbyrussell/oh-my-zsh
         - 可以选择安装 agnoster 主题，目前 oh-my-zsh 在线安装已经在文件中下载好此主题
            - 安装之前需要 powerline font 字体，因为 agnoster 主题依赖于它
               - Ubuntu安装：apt-get install fonts-powerline
               - 其它系统根据情况查询 powerline
         - 建议安装 powerline，因为这可能提供多个程序或终端的提示
         - 检验该主题需要的特殊字符是否存在
            - echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
         - 配置文件 ~/.zshrc
            - ZSH_THEME="robbyrussell" # 这个是主题名（只改这里即可）
         - 打开 zsh 看看效果
         - 执行这条语句
            - chsh -s `which zsh` # 改变默认的登录系统
   - 安装自动补全插件
      - wget http://mimosa-pudica.net/src/incr-0.2.zsh
      - mkdir ~/.oh-my-zsh/plugins/incr
      - mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
      - echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc
      - source ~/.zshrc
   - 改变 用户名@主机名 的颜色 
      - 普通bash https://www.cnblogs.com/Rosen-Walk/p/11143325.html
      - zsh终端 https://www.jianshu.com/p/bf488bf22cba
   - 更改终端目录提示的颜色
      - 找到 oh-my-zsh 安装目录，进入主题文件夹，打开对应的主题文件，找到 prompt_dir() 方法中，找到对应的颜色更改之
         - 官方的颜色为：white black yellow cyan magenta blue grey green red
   - 如何使用配置 oh-my-zsh 的教程
      - https://www.zhihu.com/question/21418449
      - https://blog.csdn.net/qq_35753140/article/details/79551560
      - https://blog.csdn.net/it_male/article/details/83376965
      - https://www.jianshu.com/p/27c8088dc8f7
      - zsh 教程地址 https://www.jianshu.com/p/27c8088dc8f7
   - 安装 oh-my-zsh 后的提示
      ```
      You have to execute 'cp /usr/share/oh-my-zsh/zshrc ~/.zshrc' to use it.
      Optional dependencies for oh-my-zsh-git
          ruby: for some plugin functionality
          python: for some plugin functionality [installed]
          oh-my-zsh-powerline-theme-git: great theme
          bullet-train-oh-my-zsh-theme-git: better powerline theme
          git: most themes use git (highly recommended but still optional) [installed]
      :: Running post-transaction hooks...
      (1/1) Arming ConditionNeedsUpdate...
      ```

* 一些软件
   - dwm              # suckless开发的极简窗口管理器WM，本文的主人公
   - dmenu            # suckless开发的极简应用程序选择器
   - slock            # suckless开发的极简锁屏程序
   - alacritty        # 通过GPU渲染加速的终端，在dwm和i3wm用户中比较流行；但是编译rust的时间较长，请耐心等待
   - picom            # 用于窗口特效(透明、毛玻璃、阴影)的渲染，与美化有关
   - xbacklight       # 用于屏幕亮度的调节
   - sys-power/acpilight     #由于使用了mesa驱动(modesetting)的intel核显无法通过x11-apps/xbacklight调节屏幕亮度，所以用这个替代，应当作为首选
      - rc-update add acpilight boot
   - alsa-utils       # 用于系统音量的调节
   - habak            # 极简的屏幕壁纸切换程序，与美化有关
   - xsetroot         # 定制、显示简易的系统状态栏(电池电量、音量、日期、时间等)
   - acpi             # 用于显示笔记本电脑电池的电量
   - numlockx         # 用于进入dwm桌面后自动开启数字键盘
   - 特殊说明
      - 要想在 linux 上真正做到流畅地玩游戏，你还需要 Vulkan 作为游戏图形的渲染后端
      - Vulkan 是新一代的图形渲染 api，相比 openGL 有着质一般飞跃的性能，许多用 openGL
      - 运行卡顿的游戏，一旦换用 Vulkan 之后刽流畅很多。"Vulkan is the future"，Vulkan
      - 的出现让 linux 和 android 平台的用户实现了如同在 windows 下畅玩游戏的理想，这
      - 是 linux 开源世界近几年来最伟大的技术革新
      - 参考 https://zhuanlan.zhihu.com/p/183861786

* Linux 的消息通知软件
   - dbus 总线
   - deadd-notification-center
      - 可以到 github 下查找
         - https://github.com/phuhl/linux_notification_center


* About wall
   - wall remote proxy networking technology
      - https://pincong.rocks/article/5489
      - https://iyideng.net/black-technology/cgfw/vpn-ss-ssr-v2ray-trojan-wireguard-bypass-gfw.html
      - https://iyideng.net/black-technology/cgfw/vpn-ss-ssr-v2ray-trojan-wireguard-bypass-gfw.html

   - wall-mother
      ```
      # append following content to your hosts file to access wall-mother website.
      # Linux: /etc/hosts
      # Windows: C:\windows\System32\drivers\etc\hosts
      104.26.5.36 www.wallmama.com wallmama.com
      ```
