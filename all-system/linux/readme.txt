* ps cpu占用排序查看进程
   - ps aux --sort=-pcpu # 按cpu使用率倒序排序
   - ps aux --sort=pcpu # 按cpu使用率升序排序

* top 命令查看是否有异常占用内存或cpu的进程
   - root 命令执行 ls -ilha /proc/进程号/exe
      - 这条指令发现病毒文件执行的所在位置，如果是引用文件则进入引用文件所在的位置
      - kill -9 进程号 # 杀掉进程
      - 删除刚刚发现的病毒文件所在位置
   - linux病毒查杀 https://www.cnblogs.com/iwalkman/p/10282291.html

* 重要的命令
   - xkill        # 执行后，鼠标点击某窗口，可以进行窗口所在进程强杀
   - xmodmap -pke # 对键盘的键位码和其对应的描述符输出打印到终端
      - xev       # 执行后，交互式地点击按键可以在终端输出键位码等信息
   - xprop        # 执行后，鼠标点击某窗口，可以得到窗口所在程序的名称

* 重要的软件或配置
   - jp2a # 转换 jpg 图像为 ascii 码图
   - zsh  # 一个更好用的终端（但是所有的配置需要自己重新配置）
      - oh-my-zsh # 整理了常用的 zsh 扩展和主题，所以先安装 oh-my-zsh
         - oh-my-zsh官网 https://ohmyz.sh/
         - oh-my-zsh github网址 https://github.com/robbyrussell/oh-my-zsh
         - 可以选择安装 agnoster 主题
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
   
   - 理性终端目录提示的颜色
      - 找到 oh-my-zsh 安装目录，进入主题文件夹，打开对应的主题文件，找到 prompt_dir() 方法中，找到对应的颜色更改之
         - 官方的颜色为：white black yellow cyan magenta blue grey green red
   - 如何使用配置 oh-my-zsh 的教程
      - https://www.zhihu.com/question/21418449
      - https://blog.csdn.net/qq_35753140/article/details/79551560
      - https://blog.csdn.net/it_male/article/details/83376965
      - https://www.jianshu.com/p/27c8088dc8f7
      - zsh 教程地址 https://www.jianshu.com/p/27c8088dc8f7

You have to execute 'cp /usr/share/oh-my-zsh/zshrc ~/.zshrc' to use it.
Optional dependencies for oh-my-zsh-git
    ruby: for some plugin functionality
    python: for some plugin functionality [installed]
    oh-my-zsh-powerline-theme-git: great theme
    bullet-train-oh-my-zsh-theme-git: better powerline theme
    git: most themes use git (highly recommended but still optional) [installed]
:: Running post-transaction hooks...
(1/1) Arming ConditionNeedsUpdate...

