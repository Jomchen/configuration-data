mvn clean compile package # maven 清除编译结果，重新编译，打包
java -jar xxx.jar \
   -Dmaven.test.skip=true \ # 运行时跳过测试
   -Dfile.encoding=utf-8 \ # 文件编码为 utf-8
   --spring.profiles.active=DEV # 指定spring的活跃环境为 DEV
