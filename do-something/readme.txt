* 项目中的 DataStructDescription.md 中 372 line 的范围可能有问题
* ExecutorService 中 submit() 和 execute() 区别
* Java 泛型中 extends 和 super 的区别
* Java 中 Proxy 类使用
* 最受欢迎的 Linux 发行版，Manjaro 折腾全记录（超长详细）https://www.jianshu.com/p/21c39bc4dd31


* 一些要测试的代码
   ```
   ResultObj<String> resultObj = ResultObj.success("Linux");
           Class<?> cla = resultObj.getClass();
           String name = cla.getName();
           String simpleName = cla.getSimpleName();
           String canonicalName = cla.getCanonicalName();
           String typeName = cla.getTypeName();
           Type type = cla.getGenericSuperclass();
           Type[] types = cla.getGenericInterfaces();
   
   
           System.out.println("name: " + name);
           System.out.println("simpleName: " + simpleName);
           System.out.println("canonicalName: " + canonicalName);
           System.out.println("typeName: " + typeName);
   ```

   ```
    static ReentrantLock lock = new ReentrantLock();
    static final Condition condition = lock.newCondition();
    
    public static void main(String[] args) throws InterruptedException {
    	Test tt1 = new Test(lock, condition, -1);
    	Test tt2 = new Test(lock, condition, 2);
    	Thread t1 = new Thread(tt1, "Thead-1");
    	Thread t2 = new Thread(tt2, "Thread-2");
    	t1.start();
    	Thread.sleep(2000);
    	t2.start();
    }
    
    static class Test implements Runnable {
    	ReentrantLock lock;
        Condition condition;
        int data;
        public Test(ReentrantLock lock, Condition condition, int data) {
        	this.lock = lock; this.condition = condition; this.data = data;
        }
        
        @Override
        public void run() {
	        try {
	        	myRun();
	        } catch( Exception e) {
	        	e.printStackTrace();
	        }
        }
        
            
	    public void myRun() throws InterruptedException {
	    	String threadName = Thread.currentThread().getName();
	    	System.out.println(threadName + " 准备抢锁");
	      	//lock.lockInterruptibly();
	    	lock.lock();
	    	
	    	try {
	    		System.out.println(threadName + " 进入了方法区");
	    		if (this.data > 0) {
	    			this.condition.signalAll();
	    			System.out.println(threadName + " 唤醒者，当前是否有锁：" + lock.isLocked());
	    			System.out.println(threadName + " 唤醒者执行线程结束");
	    			return;
	    		}
	    		
	      		//for (;;) {
	    			System.out.println(threadName + " 开始阻塞");
	    			condition.await();
	    			System.out.println(threadName + " 阻塞后，现在是否有锁：" + lock.isLocked());
	      		//}
	    	} finally {
	    		System.out.println(threadName + " finished 之前是否有锁：" + lock.isLocked());
	    		System.out.println(threadName + " FINISHED");
	    		lock.unlock();
	    		System.out.println(threadName + " 释放锁成功");
	    	}
	    }
    }
   ```


