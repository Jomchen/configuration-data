* 软件
   - everything     # 强大的文件搜索工具
   - wox            # 类似 dmenu 的软件搜索打开工具
   - Beyond Compare # 对比工具
   - openArk        # 查看快捷键被占用的程序
   - todesk         # 远程工具
   - AID164         # 硬件监控
   - Hwinfo         # 硬件监控

* 查看硬盘格式的方式
   win+r => diskpart => list disk => 查看 Gpt 栏有没有“*” 没有则是 mbr
   我的电脑 => 磁盘管理 => 对硬盘右键，如果有转换成的 mbr 的灰色选项则是 gpt 模式硬盘（反之则是mbr）
* 查看电脑引导的方式
   win+r => msinfo32 => 查看 “BIOS模式” 是否是 UEFI
   Windows 管理工具 => 系统信息 => 查看 “BIOS模式” 是否是 UEFI

* 打开服务窗口
   win+r => services.msc
* PE分区界面调动cmd
   shift + f10      # 调出cmd窗口
   diskpart         # 进入硬盘操作模式
   list disk        # 查看硬盘信息
   select disk 数字 # 使用相应索引号的硬盘
   clean            # 清除磁盘
   convert mbr      # 转磁盘为 mbr 格式
   convert gpt      # 转磁盘为 gpt 格式
   exit             # 退出硬盘模式
   
