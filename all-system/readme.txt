* 技术论坛
   - https://www.52pojie.cn/
* 在线屏幕检测
   - https://screen.bmcx.com/#welcome
* 一些重要的网址
   - Shadowsocks：https://shadowsocks.org/en/index.html
   - Tor Browser：https://www.torproject.org/download/
   - 检查域名ssl生效： https://www.ssllabs.com/ssltest/analyze.html
   - 测试IP健康： http://ping.chinaz.com/104.168.211.218
   - 检查ip是否被墙 
      - https://www.vps234.com/ipchecker/
      - http://ping.pe/

* 域名厂商
   - godaydy www.godaddy.com
   - namesilo www.namesilo.com
      - https://www.namesilo.com/register.php?rid=775dd38gf

* VPS 主机厂商介绍
   - http://www.367783.net/bandwagonhost/2051.html

* across-GFW
   - TEACHING WEBSITE => https://www.v2rayssr.com/tag/trojan
   - GSOU CLOUD # Ji Chang
   - Quantumult X
   - v2ray
      - 是一个系统体系
   - wireguard
      - 官方地址 www.WireGuard.com www.wireguard.com
      - 国内教程地址 http://www.lixh.cn/archives/2134.html
      - 基于 udp 协议传输
   - Trojan（在 v2ray 的官方文档有提到使用方法）（本身定位于加密为 https, tls 1.3）
      - www.trojan-gfw.github.io/trojan
      - 基于伪装为 https 协议传输
   - Tor 洋葱路由器，匿名通信的Free软件
   - Brook
   - ssr
   - [ BBR 可以为代理服务器提速 ]

* across-GFW-server
   - 一批
      - iGuge
      - bywave
      - Gson cloud
      - 棱角
   - 二批
      - 薯条
      - RixCloud
      - 魅影
      - BlinkLoad
      - 海豚湾
      - 佩奇
      - Boslife(Abc, AAEX)


* proxy-tool
   - 介绍网址
      - https://ahuigo.github.io/b/net/net-proxy-tool#/
      - 网址介绍系列
   - 基本的软件
      - cow
      - graftcp
         - 可以把任何指定程序（应用程序，脚本，shell等）的TCP连接重定向到SOCKS5或HTTP代理
         - graftcp 不使用 LD_PRELOAD 技巧劫持共享库的 connect(), getaddrinfo() 等系列函数
         - 达到重定向目的，这种方法只对使用动态链接编译的程序有效，对于表态链接编译的程序
         - 例如黑夜选项编译的 Go 程序，proxychains-ng就无效了。graftcp 使用 ptrace(2)系统调
         - 用跟踪或修改任意指定程序的 connect 信息，对任何程序都有效。
      - proxychains-ng（是 proxychains 的新一代）
      - tsocks（这个具说没有 proxychains 好用）
      - privoxy
      - Surge # 貌似是 Mac 上的软件
      - charles # windows（默认自带） 与 Mac（不清楚是否自带） 都有
      - Clash # 可以在 Linux 上使用

* Win 和 Linux 双系统时间同步解决方案
   - win 和 Linux 双系统时间同步解决方案
     - https://wiki.archlinux.org/index.php/System_time
     - 或者搜索 `System time arch` 搜索到双系统的时间解决方案

* Arch 上数据库视图工具不能记住密码的解决方案（此方案仍不能解决问题）
   - 解决 Arch 上 数据库视图工具不能记住密码的解决方案
      - pacman -S seahorse      # 参考 keyring Arch 维基文档
   - 解决 Arch 上 mysql-workbench 报 org.freedesktop.secrets was provided by any .service files 的异常
      - pacman -S gnome-keyring libsecret
   - 经测试，此操作仍然无效

* Linux 中用 wine 安装 qq 方案
  - https://wiki.archlinux.org/index.php/Tencent_QQ_

* git 解决每次拉取代码都需要用户名和密码的情况
   - git config --global credential.helper store
   - 执行完毕后会在 ~/.gitconfig 中生成一个文件，记录了你的相关信息

* yay 安装教程地址
   - https://lyzhang.me/post/archlinux_beginning/
   - https://zhuanlan.zhihu.com/p/102529503
   - https://www.jianshu.com/p/4444bb4f8452

* 安装 redis 因为访问谷歌下载地址失败的处理方案，让 git 走代理
   1. 方案择其一（经测试，第一种方案有效，第二种方案无效，第三种方案未测试，第四种方案未测试。建议用第一种方案）
      1. 设置 socks5 代理
         - git config --global http.proxy 'socks5://127.0.0.1:1080' && git config --global https.proxy 'socks5://127.0.0.1:1080'
      2. 设置 git@ 走代理
         - ~/.ssh/ssh_config
         - ProxyCommand nc -x 127.0.0.1:1080 %h %p
         - 如果不确定，或希望全部走代理，则添加第一行
      3. 设置 http/https 代理
         - git config --global https.proxy http://127.0.0.1:1080 && git config --global https.proxy https://127.0.0.1:1080
      4. 强制转换协议以使用代理
         - git config --global url."https://github".insteadOf git://github
         - git config --global url."git@github.com:".insteadOf "https://github.com/"
         - git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/
   2. 取消代理
      git config --global --unset http.proxy && git config --global --unset https.proxy

* lightdm 配置 vnc
   - lightdm 服务需要开机启动
   - 配置vnc服务端
   ```
   [VNCserver]
   enabled=true
   command=Xvnc -rfbauth /etc/vncpasswd
   port=5900
   listen-address=0.0.0.0
   width=1024
   height=768
   depth=24

   # 注意！！如果客户端远程连接出现 End of stream 的错误则可能是 depth 没有设为 24 的原因
   # 注意！！depth 具体是什么参数视情况而定，至少目前测试默认可能是 8，需要改为 24 可以正常工作
   ```

* Linux 中 disown, &, nohup 命令区别
   - https://blog.csdn.net/weixin_39833509/article/details/98893293

* 配置网卡的教程
   - https://www.cnblogs.com/w-s-y/p/9498115.html
