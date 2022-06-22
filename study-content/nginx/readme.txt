# proxy_set_header Host $http_host;
# proxy_set_header X-Real-Ip $remote_addr;
# proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

- 默认 main 是最顶级的上下文，在main正只能有 http stream mail events
- http 模块下 可以有 server_name 域名，表明监听对这个域名对本机的访问
- 事件配置
  ```
    events {
      worker_connections 1024; // 每个 worker 进程支持的连接数
      use epoll; // 内核模型：select, poll, epoll（linux 下最好是 epoll）
    }
  ```
- 顶级上下文
  - worker_processes; // 工作进程，配置和 cpu 个数保持一致，否则会出现崩溃的情况
  - error_log /var/log/nginx/error.log warn; // 这里指警告的日志打印的日志目录文件，也可以是 error
  - access_log /var/log/nginx/access.log main; // 访问日志打印到指定的文件中 
  - pid /var/run/nginx.pid // 进程id记录地方
  - log_format main '格式'; // nginx 日志输出的格式，可以用以上的内部变量使用，支持多行

## nginx 一些注意的事项
  - = 进行普通字符精确匹配，完全匹配
  - ^~ 表示普通字符匹配，使用前缀匹配
  - ~ 表示区分大小写的正则匹配
  - !~ 表示区分大小写的正则不匹配
  - ~* 表示不区分大小写的正则
  - !~* 表示不区分大小写的正则不匹配

## nginx 的教程
301 永久移动,被请求的资源已被永久移动位置
302 请求的资源现在临时从不同的 URI 响应请求
305 使用代理，被请求的资源必须通过指定的代理才能被访问
307 临时中转，被请求的资源在临时从不同的 URL 响应请求
400 错误请求
402 需要付款，该状态码是为了将来可能的需求而预留的，用于一些数字货币或者是微支付
403 禁止访问，服务器已经理解请求，但是拒绝执行它
404 找不到对象。请求失败，资源不存在
406 不可接受的，请求的资源的内容我无法满足请求头中的条件，因而无法生成响应实体
408 请求超时
409 冲突，由于和被请求的资源的当前状态之间存在冲突，请求无法完成
410 遗失的，被请求的资源在服务器上已经不再可用，而且没有任何已知的转发地址
413 响应实体太大。服务器拒绝处理当前请求，请求超过服务器所能处理和允许的最大值
417 期望失败，在请求头 Expect 中指定的预期内容无法被服务器满足
418 我是一个茶壶，超文本咖啡罐控制协议，但是并没有被实际的 HTTP 服务器实现
420 方法失效
422 不可处理的实体，请求格式正确，但是由于含有语义错误，无法响应
500 服务器内部错误，服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理
502 请求后端失败，往往是nginx作正向代理时，nginx请求后端时失败了

# -----------------------------------------------------------------------------------------

## nginx 视频教程进度 49 集
  - 48 ~ 53 集 需要重看，讲缓存的使用和原理

# -----------------------------------------------------------------------------------------

nginx 的一些变量
$uri: 当前请求的 uri，不带参数
$request_uri: 请求的uri，带完整参数
$host: http请求报文中首部，如果没有则以处理此请求的虚拟主机的主机名代替
$hostname: nginx服务运行在主机的主机名
$remote_addr: 客户端ip
$remote_port: 客户端端口
$remote_user: 使用用户认证时客户端用户输入的用户名
$request_filename: 用户请求中的URI经过本地root或alias转换后映射的本地文件路径
$request_method: 请求方法，GET POST PUT
$server_add: 服务器地址
$server_name: 服务器名称
$server_port: 服务器名称
$server_protocol: 服务器向客户端发送响应时的协议，如http/1.1 http/1.0
$scheme: 在请求中使用scheme，如http://xxx.com中的http
$http_HEADER: 匹配请求报文中指定的 HEADER
$http_host: 匹配请求报文中的host首部
$document_root: 当前请求映射到的root配置

$remote_addr 表示客户端地址
$remote_user http客户端请求nginx谁用户名
$time_local nginx 的时间
$request request请求行，GET等方法，http协议版本
$status responce 返回状态码
$body_bytes_sent 从服务商响应给客户端body信息大小
$http_referer http上一级页面，防盗链，用户行为
$http_user_agent http头部信息，客户端访问设备
$http_x_forwarded_for http请求携带的http信息

## 压测工具
httpd-tool 压测工具

## nginx 容易搞混的问题（root 与 alias 区别）
   ```
   # 如果系统中有文件 /opt/soft/share/picture/weigong.jpeg
   location /jomkie/download {
      # 假设监听localhost,请求为：http://localhost/jomkie/download/weigong.jpeg
      # 符合规则，/jomkie/download 符合规则，被替换为 /opt/soft/share
      # 剩下部分为：http://localhost 与 /weigong.jpeg
      # 组装 http://localhost + /opt/soft/share + /weigong.jpeg
      # 最终结果为 http://localhost/opt/soft/share/weigong.jpeg

      # 注意！！！！！
      # 注意！！！！！
      # 不要在规则模式后面加 “/”，即 /jomkie/download
      # 这样会变为 http://localhost + /opt/soft/share + weigong.jpeg
      # 错误最终结果为 http://localhost/opt/soft/share/weigong.jpeg
      alias /opt/soft/share;
   }
   location /soft/share/picture/ {
      # 假设监听localhost,请求为：http://localhost/soft/share/picture/weigong.jpeg
      # 符合规则 /soft/share/picture/
      # 裁分为 http://localhost /soft/share/picture/ weigong.jpeg
      # /soft/share/picture/ 加在 /opt 后形成 http://localhost/opt/soft/share/picture/
      # 再加上剩余部分 weigong.jpeg
      # 最终结果为 http://localhost/opt/soft/share/picture/weigong.jpeg

      # 注意！！！！！
      # 注意！！！！！
      # 不要在 /opt 后加 “/”,这样就会形成 http://localhost/opt//soft/share/picture/weigong.jpeg
      # 虽然对于web访问没有问题，但是不标准，不确保在特殊情况下会引起不正确
      root /opt;
   }
   ```
## nginx 的监控
  - 使用的模块是 --with-http_stub_status_module
    - 可以定义在 server 或 location 下
    ```
    location /mystatus {
        // 这样就可以查看 nginx 的状态了，默认是 off
        stub_status on;
    }
    ```
## nginx 的下载站点
可以在 http, location, server 下
autoindex off; // 默认是关闭的，开启则可以激活，下载站点目录
autoindex_exact_size on; 默认on，on 表示显示出文件的确切大小，单位是 bytes; off 显示出文件的大概大小，单位是kb或者mb或者gb
autoindex_localtime on; 默认off, off 显示的文件时间为 GMT 时间; on 显示的文件时间为文件的服务器时间
carset utf8,gbk; // 解决乱码，可以是 utf-8 或 gbk 或其它


## nginx 连接限制模块 *************** 重看
- 连接的限制只有 公有云 可以测出来，如果是虚拟机测不出来
- 全局定义连接限制
  - Syntax: limit_conn_zone key zone=name:size
  - Context: http
- 引用连接限制
  - Syntax: limit_conn zone number [burst=number] [nodelay]
  - Context: http, server, location

## nginx 请求限制模块 ************** 重看
- 请求限制 
  - http 模块配置, rate 限制速率，限制一秒钟最大一个ip请求
  - limit_req_zone $binary_remote_addr zone=req_zone:1m rate=1r/s;
    - location 模块配置， 1r/s 只接收一个请求，多余直接处理
  - limit_req zone=req_zone;
  - limit_req zone=req_zone burst=3 nodelay;
    - location 模块配置，请求超过1r/s，剩下的将被延迟处理，请求超过 burst 的数量，多余的返回 503

## nginx 访问控制
  - 允许配置语法
    - Syntax: allow address | CIDR | unix: | all;
    - Context: http, server, location, limit_except
  - 拒绝配置语法
    - Synctax: deny address | CIDR | unix: | all;
    - Context: http, server, location, limit_except
  - 案例
    - 如果有多个 ip 要禁用或允许应该 一行写一个ip
    ```
      allow 192.168.0.1;
      allow 192.168.0.2;
    ```
    - 允许或拒绝一个网段的ip可以按以下这样写
    ```
      allow 192.168.0.0/24;
      deny all;
    ```

## nginx 基于用户登录认证 ************** 重看
  - 配置语法
    - Syntax: auth_basic string | off;
    - Default: auth_basic off;
    - Context: http,server,location,limit_except
  - 用户密码记录配置文件
    - 通过文件中带的 用户名和密码让用户访问
    - Syntax: auth_basic_user_file file;
    - Context: http, server, location, limit_except
  - 用于文件的需要安装 httpd-tool 且用 htpasswd

## 如果在监听同样的 server_name 和 port 的情况下，优先是以先读取的文件作优先
  - 如果要有自定义的优先则应该 listen 端口 default_server; 在监听的端口后加上 "default_server"


## 静态资源配置语法 ******************8 重看
  - 文件的读取高效
    - Syntax: sendfile on | off
    - 默认 off
    - COntext: http, server, location, if in location
  - 提高网络传输效率
    - tcp_nopush on | off 
    - 默认: off
    - Context: http, server, location
    - 必须在 sendfile 开启的情况下才有作用
  - tcp_nopush
    - 在 keepalive 连接下，提高网络的传输’实时性'
    - 默认: on
    - Context: http, server, location
  - gzip 压缩配置，传输压缩，压缩本身是耗服务器的性能的
    - gzip on | off
    - 默认 off
    - Context: http, server, location, if in location
  - 压缩比率配置语法
    - gzip_comp_level level
    - 默认 level 是 1
    - Context: http, server, location
  - 压缩协议版本
    - Syntax: gzip_http_version 1.0 | 1.1
    - 默认 1.1
    - Context: http, server, location
  - 扩展压缩模块
    - gzip_static on | off | always
    - 默认 off
    - Context: http, server, location

## 浏览器缓存概述 ******************* 重看
  - 浏览器缓存实战案例
  - Syntax: expires [modified] time;
  - expires epoch | max | off;
  - 默认: expires off
  - Context: http, server, location , if in location
  - 例子
    - expires 30d 表示缓存30天（也可以是 多少h 表示小时）

## 跨域访问配置 ****************** 重看
  - 接收请求的源域名
  - Syntax: add_header name value [always]
  - Context: http, server, location, if in location

## 防盗链 ********************8 重看
  - Syntax: valid_referers none | blocked | server_names | string ...;
  - Context: server, location


## 代理，类似于 nopush 缓冲区
  - 语法
    - proxy_pass url
    - Context: location, if in location, limit_except
  - 可能收集所有头请求
    - Syntax: proxy_buffering on | off
    - 默认 on
    - Context: http, server, location
  - 扩展
    - proxy_buffer_size
    - proxy_buffers
    - proxy_busy_buffer_size
  - 中转重定向
    - Syntax: proxy_redirect default;
    - proxy_redirect off; proxy_redirect redirect replacement;
    - Default: proxy_redirect default;
    - Context: http, server, location

  - 头信息
    - Syntax: proxy_set_header field value;
    - Default: proxy_set header Host $proxy_host;
               proxy_set_header Connection close;
    - Context: http, server, location
    - 扩展: proxy_hide_header 
            proxy_set_body
    - 代理到后端的 tcp 连接超时
      - Syntax: proxy_connect_timeout time;
      - Default: proxy_connect_timeout 60s;
      - Context: http, server, location
      - 扩展: proxy_read_timeout
              proxy_send_timeout
      - 案例
      ```
          # 这是在把这台机器作为正向代理的配置（比如浏览器设了代理）
          proxy_pass http://$http_host$request_uri; # 以本机器的身份访问用户原本请求的主机和地址
          proxy_set_header Host $http_host; # 在头信息中加入原本的请求报文的host
          proxy_set_header X-Real-Ip $remote_addr; # 把请求这台机器的ip地址写入到 X_Real_Ip
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; # 把请求ip串 加入 X-Forwarded-For
      ```

## 负截均衡
  - 负载均衡的状态
    - down # 当前的 server 暂时时不参与负载均衡
    - backup # 预留的备份服务器
    - max_fails # 允许请求失败的次数
    - fail_timeout # 经过 max_fails 失败后，服务暂停时间
    - max_conns # 限制最大的接收连接数
  - 调度算法
    - weight # 按时间顺序逐一分朽到不同的后端服务器（默认）
    - weight # 加权轮询,weight值越大，分配到的访问几率越高
    - ip_hash # 每个请求按访问ip的hash结果分配，这样来自同一ip固定访问一个后端服务器
    - url_hash # 按照访问 url 的hash结果来分配请求，是每个url定向到同一个后端服务器
      - `hash $request_uri`
    - least_conn # 最少链接数，哪个机器链接数少就分发
    - hash关键数值 # hash自定义的key
  - 对手机型号的判断
    - $http_user_agent 记录了客户端的机型
    - 语法
      ```
      location / {
        if ($http_user_agent ~* "Chrome") {
            proxy_pass http://上流代理;
        }

        proxy_pass: http://默认上游代理;
      }
      ```
## nginx 的缓存
  - 缓存的配置语法
    - Syntax: proxy_cache zone | off;
    - Default: proxy_cache off;
    - Context: http, server, location
  - 缓存路径
    - Syntax: proxy_cache_path path [levels=levels] [use_temp_path=on|off] keys_zone=name:size [其它等。。。]
    - Context: http
  - 缓存过期周期
    - Syntax: proxy_cache_valid [code ...] time;
    - Default: -
    - Context: http, server, location
    - 示例：proxy_cache_valid 200 302 10m;
    - 示例2：proxy_cache_valid 404 1m;
  - 缓存的维度
    - Syntax: proxy_cache_key sring;
    - Default: proxy_cache_key $scheme$proxy_host$request_uri;
    - Context: http, server, location
    - 示例：
      - proxy_cache_key "$host$request_uri $cookie_user";
      - proxy_cache_key $scheme$proxy_host$uri$is_args$args;

## 重写 Rewrite
- Syntax rewrite regex replacement [flag];
- Context server,location,if
  - Rewrite 的标记
    - last 停止 rewrite 检测
    - break 停止 rewrite 检测
    - redirect 返回 302 临时重定向，地址会显示中转后的地址
    - permanent 返回 301 永久重定向，地址栏会显示中转后的地址
  - last 和 break 对比总结
    - last 会建立一个请求，请求域名+/test
    - break 匹配后不会进行匹配，会查找对应 root 站点目录下包含 /test 目录
  - redirect 与 permanent 区别
    - redirect 返回 302 临时重定向，地址栏会显示中转后的地址，在关闭 nginx 后将无法进行跳转
    - permanent 返回 301 永久重定向，地址栏会显示中转后的地址，在即使关闭了 nginx，在 permanent 的设定也可以生效（因为它告诉客户端之前的设定是永久的）















## https 的语法（openssl 必须是 1.0.2 的，可以 openssl version 查看一下）
- Syntax: ssl on | off
- Default: ssl off;
- COntext: http, server

Syntax: ssl_certificate file;
Default: -
Context: http, server

Syntax: ssl_certificate_key file;
Default: -
Context: http, server
