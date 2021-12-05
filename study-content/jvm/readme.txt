javap -v Xxx.class # 反编译
JMC             # java相关的服务，以极低的开销来监控，管理和分析生产环境中的应用程序的工具
JClassLib       # java 反编译工具
Bytecode Viewer # 字节码查看器


* 获取加载器
   ```
   ClassLoader systemClassLoader = ClassLoader.getSystemClassLoader() # 获取系统类加载器/程序加载器
   ClassLoader extClassLoader = systemClassLoader.getParent() # 获取扩展类加载器
   ClassLoader bootClassLoader = extClassLoader.getParent() # 试图获取根加载器，这里获取的是 null，因为引导类加载器是 C/C++ 写的

   由上至下是包含的关系

   Xxx类.class.getClassLoader() # 获取加载这个类的类加载器
   如果是 java.lang.String.class.getClassLoader() # 这里获取到空，因为 String 这个基类是由引导类加载器加载的
   ```

* 类的加载过程
   1. 加载
      - 通过一个类的全限定名获取定义此类的二进制流
      - 将这个字节流所代表的表态存储结构转化为方法区的运行时数据结构
      - 在内存中生成一个代表这个类的 java.lang.Class 对象，作为方法区这个类的各种数据的访问入口
   2. 链接
      1. 验证（Verify）
         - 目的在于确保Class文件的字节流中包含信息符合当前虚拟机要求，保证被加载类的正确性，不会危害虚拟机自身安全
         - 主要包括四种验证，文件格式验证，元数据验证，字节码验证，符号引用验证
      2. 准备（Prepare）
         - 为类变量分配内存并且设置该类变量的默认初始值，即零值
         - 这里不包含用 final 修饰的 static，因为 final 在编译时会分配，准备阶段会显式初始化
         - 这里不会为实例变量分配初始化，类变量会分配在方法区中，而实例变量是会随着对象一起分配到 java 堆中
      3. 解析（Resolve）
         - 将常量池内的符号引用转换为直接引用的过程
         - 事实上，解析操作往往会伴随着JVM在执行完初始化之后再执行
         - 符号引用就是一级符号来描述所引用的目标。符号引用的字面量形式明确定义在《java虚拟机规范》的Class文件格式中。直接引用就是直接指向目标的指针，相对偏移量或一个间接定位到目标的句柄
         - 解析动作主要针对类或接口，字段，类方法，接口方法，方法类型等。对应常量池中的 CONSTANT_Class_info, CONSTANT_Fieldref_info, CONSTANT_Methodref_info 等
   3. 初始化
      - 初始化阶段就是执行构造器方法<clinit>()的过程
      - 此方法不需定义，是javac编译器自动收集类中的所有类变量的赋值动作和动态代码块中的语句合并而来
      - 构造器方法中指令按语句在源文件中出现的顺序执行
      - <clinit>()不同于类的构造器。（关联：构造器是虚拟机视角下的<init>()）
      - 若该类具有父亲，JVM会保证子类的<clinit>()执行前，父类的<clinit>()已经执行完毕
      - 虚拟机必须保证一个类的<clinit>()方法在多线程下被同步加锁
