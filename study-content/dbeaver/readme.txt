* 安装 dbeaver 的方式
   1. 下载 解压版的jdk11或更高版本，解压版的dbeaver
   2. 解压两个文件，并配置 dbeaver 的dbeaver.ini
   ```
   -vm
   # jdk11解压后的bin目录所在路径
   /opt/jdk-11.0.12/bin
   -vmargs
   # 最小堆空间
   -Xms1024m
   # 最大堆空间
   -Xmx1024m
   # 客户端编码
   -Dfile.encoding=UTF-8
   ```

* 设置
   - 防止长时间不操作，再查询引起假死现象（以下各设置不一定有效）
      1. editConnection -> Connection settings -> Driver properties -> tcpKeepAlive 设置为 TRUE 或 YES
      2. mysql 本身保持连接
         - editConnection -> Connection settings
            - Initialization -> 连接保持 设置为 120
      3. 使用 SSH 登录服务器再登录 Mysql
         - editConnection -> Connection settings -> SSH -> 通道连接超时(ms) 设置为 10000
      4. 窗口 -> 首选项 -> Editors -> SQL编辑器 -> 执行查询时连接
         - 建议勾上此选项，否则长时间不使用，连接会断开，再次查询会假死

