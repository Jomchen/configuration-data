# 解决响应信息中文乱码
   1. 解决方案一
      - 线程组->添加->后置处理器->BeanshellPostProcessor
         - 添加内容：prev.setDataEncoding("utf-8");
   2. 解决方案二
      - jmeter 的 bin 目录，打开 jmeter.properties 文件
         - 解开注释并修改 sampleresult.default.encoding 为 utf-8
         - 解开注释并修改 language 为 zh_CN
      - 选项->选择语言->中文（简体）
