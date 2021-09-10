安装 dbeaver 的方式
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
