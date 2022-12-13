* 安装后的一般设定
   - properties -> 搜索 maven -> 更改 maven 目录和settings.xml 和 repositores
   - properties -> 搜索 file encoding -> 理性编码为 UTF-8
   - 如果还编译报错，对项目配置编译的 JDK 版本
* idea 不能下载源码的解决方案
   - https://www.icode9.com/content-1-116950.html
   - setting -> Build,Execution,Deployment -> Build Tools -> Maven -> Importing
      - 勾上 Automatically download [Sources]
* 如果发现没有 run Dashboard 则可以：在Edit Configurations -> Run -> 复制一个运行程序 -> 确定
   - 此时应该会有提示，如果没有提示需要修改idea的配置文件 workspace.xml
      - 在 component 标签中添加
      ```
      <option name="configurationTypes">
          <set>
              <option valud="SpringBootApplicationConfigurationType"/>
          </set>
      </option>
      ```
* Plugins
   - maven-helper               # 冲突搜索
   - maven-enforcer-plugin      # 冲突搜索（没有查到此插件）
