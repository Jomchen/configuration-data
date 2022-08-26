* 软件
   - everything     # 强大的文件搜索工具
   - wox            # 类似 dmenu 的软件搜索打开工具
   - Beyond Compare # 对比工具
   - openArk        # 查看快捷键被占用的程序
* 查看硬盘格式的方式
   win+r => diskpart => list disk => 查看 Gpt 栏有没有“*” 没有则是 mbr
   我的电脑 => 磁盘管理 => 对硬盘右键，如果有转换成的 mbr 的灰色选项则是 gpt 模式硬盘（反之则是mbr）
* 查看电脑引导的方式
   win+r => msinfo32 => 查看 “BIOS模式” 是否是 UEFI
   Windows 管理工具 => 系统信息 => 查看 “BIOS模式” 是否是 UEFI
* 打开服务窗口
   win+r => services.msc
