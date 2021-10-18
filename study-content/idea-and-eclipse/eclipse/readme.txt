安装 lombok 插件方式
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
