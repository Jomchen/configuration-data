* 安装后需要作的操作
   - 一般设置
      - General -> Appearance -> Colors and Fonts -> Basic -> Font -> Text Font （建议微软雅黑，17号）
      - Java -> Installed JREs -> 设定为自己的 JDK
         - Java -> Compiler 设定为自己JDK的版本进行编译
      - Maven -> Installations -> 设定为自己的 maven
         - Maven -> User Settings 设定为自己的 maven 中的 settings.xml 文件
         - Maven -> User Settings 设定为自己的 maven 中的 repository
   - 特定设定（一般面向于项目仍然报错的情况）
      - 对项目又键，点 properties
         - Java Compiler，选定 自己JDK版本进行编译
         - Java Build Path -> Libraries -> JRE System Library 编辑为自己的 JDK
   - 设定相应的编码为 UTF-8

* 必装插件
   Windows -> Eclipse MarketPlace wizard -> 安装 sts 插件

* 安装 lombok 插件方式
   将 lombok 的jar 文件放在 eclipse 的目录文件夹中（注意 lombok-xxx.jar 的版本，最新的 eclipse 不要和旧的 lombok 文件一起处理）
   定位到 eclipse 的目录文件夹中运行 java -jar lombok-xxx.jar（注意这里以实际的jar文件名为准）
   选择 eclipse 的运行文件的位置，然后点击 Install 按钮，安装完毕后退出

   当安装了 lombok 插件后，文件打不开，报以下错误
      ```
      Unable to make protected final java.lang.Class java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int) throws java.lang.ClassFormatError accessible: module java.base does not "opens java.lang" to unnamed module @1ac4ccad
      
      ```
      ```
      （目前 202109 版本不需要加此行）解决方案为：在 eclipse.ini 里面加上 --illegal-access=permit
      ```
