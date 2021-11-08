* CSR 生成器地址
   - https://csrgenerator.com/
* SSL Certificates Help Address
   - https://sg.godaddy.com/help/add-or-remove-subject-alternative-names-from-my-ucc-certificates-4649

* Godaddy 下载证书并合并成证书
   - csr-key
      - **.csr.txt 的为证书的签名内容文件
      - xx-private-key.txt 字眼的为证书私钥，用于之后的请求加密
         - 更名为 YOUR_DOMAIN.key
         - 记得更改文件内容编码（详见后文）
   - cert
      - ***.crt # 明文证书的前半部分（这个文件在前，追加 gd_bundle-g2-g1.crt）
      - gd_bundle-g2-g1.crt # 明文证书的后半部分（这个文件在 ***.crt 后）
      - ***.pem # 完整的二进制文件
   - 注意
      - 如果要用明文证书则合并 ***.crt 和 gd_boundle-g2-g1.crt 为 YOUR_DOMAIN.crt
         - 注意合并后更改文件内容的编码（详见后文）
      - 也可以使用二进制文件证书 ***.pem

* 下载证书后，将 key 与 证书安装在 nginx 上后，nginx -t 验证不通过,错误形同如下
   ```
   报错nginx: [emerg] SSL_CTX_use_PrivateKey_file("/etc/nginx/ssl/myxxxxgame201904.key") failed (SSL: error:0906D06C:PEM routines:PEM_read_bio:no start line:Expecting: ANY PRIVATE KEY error:140B0009:SSL routines:SSL_CTX_use_PrivateKey_file:PEM lib)
   ```
   ```
   解决方案是因为编码问题，用 vim 分别打开 证书 与 私钥，并执行
   :set fileencoding=cp936
   :wq!
   微软的CP936通常被视为等同为GBK，连IANA也以CP936为GBK之别名，但是事实上比较起来
   GBK定义的字符较CP936多出95字（15个非汉字及80个汉字）
      CP936就是 GB2312
   两个文件修改编码后即可验证成功
   原因是证书与私钥必须以 ANSI 编码，而不能用 utf-8
   ```
