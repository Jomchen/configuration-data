当安装了 lombok 插件后，文件打不开，报以下错误
   ```
   Unable to make protected final java.lang.Class java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int) throws java.lang.ClassFormatError accessible: module java.base does not "opens java.lang" to unnamed module @1ac4ccad
   
   ```
   ```
   解决方案为：在 eclipse.ini 里面加上 --illegal-access=permit
   ```
