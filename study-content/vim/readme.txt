## 个别知识
- [工具正则](https://my.oschina.net/onionsheep/blog/346926)
- [VIM教程](https://github.com/wsdjeg/vim-galore-zh_cn)

## 插件
- ctags + cscope
   - 概念
      ```
      实际上，vim 中代码跳转是由 vim tags 模块完成的，tags 模块依赖于 tags 文件
      如果要知道一个函数都在什么地方使用过，需要使用 cscope
      ```
   - 编译 cscope 可能会报错，原因是缺少依赖，可以执行 
     - ubuntu 系统执行 `sudo apt-get install libncurses5-dev `
     - centos 系统执行 `yum install ncurses-devel`
   - ctags 运用方法
     1. 进入项目的根目录下，要刚刚在项目的根目录中
     2. 执行 `ctags -R` 递归产生文件索引
   - cscope 运用方法
     1. 进入项目的根目录下，要刚刚在项目的根目录中
     2. 在这个目录下执行 `find ./ -type f > cscope.file` 生成文件目录树文件
     3. 执行 `cscope -bqk -i cscope.file` 生成三个索引文件
     4. 因为 cscope 只识别后缀为 h,p,c 的文件，即只支持c语言，所以需要手工处理
   - 在vim 中只需要 `:cscope add cscope.file` 即可建立索引

## 小技巧
   - 其它
      - 如果把光标放在一个数字上，按 数字 ctr + a 则可以递增对光标所在数字增加递增数字个数(ctrl + x 是递减)
      - ctrl + g 显示当前文本的位置所在比例，和文本的总行数
      - 数字% 跳转到文章内容的百分之多少
      - df字符 会从当前字符一直删到往后找到的第一个匹配字符的地方
   - 词语操作
      - ciw 删除当前所在的词并进入插入模式(caw 会包含结尾的空白)
      - diw 删除当前所在的整个词(daw 会包含结尾的空白)
      - viw 选择当前所在的整个词(vaw 会包含结尾的空白)
      - yiw 复制当前所在的单词(yaw 会包含结尾的空白)
   - 句子操作
      - cis 对当前光标所在句子作整体替换(cas 会包含结尾的空白)
      - dis 对当前光标所在句子作整体删除(das 会包含结尾的空白)
      - vis 对当前光标注所在句子作整体选择(vas 会包含结尾的空白)
      - yis 对当前这一句句子作复制(yas 会包含结尾的空白)
   - 查找式删除
      - d[n]f字符 从当前字符删除到第 n 次查找到的字符，默认为第一个
      - d[n]/字符 从当前字符删除到第 n 次查找到的字符的前一个字符，默认为第一个
   - 替换
      - c 删除当前字符并进入插入模式
      - cc 删除当前行并进入插入模式
      - ch 删除前面一个字符并进入插入模式
      - cl 删除后面一个字符并进入插入模式
      - c2wbe (c 作替换 | 2w 替换两个单词 | be 最后替换成的字符串)
   - 目录树的操作
      - :Explore 可以打开当前文件所在的目录（:Ex）
      - :Vexplore 可以垂直打开当前文件所在的目录（:Ve）
   - 文件补全
      - ctrl + p 向前切换成员
      - ctrl + n 向后切换成员
      - ctrl + e 退出下拉菜单，并退回到原来文字
      - ctrl + y 退出下拉菜单，并接受当前选项


## 文件比较
   - vimdiff file1 file2 比较两个文件的差异
   - :vertical diffsplit xxx 垂直比较当前文件和 xxx 文件
   - zo 打开光标下面的折叠
   - zc 关闭光标下面的折叠
   - zO 打开光标下面的所有折叠
   - zC 关闭光标下面的所有折叠
   - [c 跳到上一个修改点
   - ]c 跳到下一个修改点
   - diffupdate 在比较过程中，修改过一个文件后更新比较状态
   - dp 把光标所在窗口的差异改到另一个窗口(:diffput)
   - do 把光标所在的窗口的差异改为另一个窗口(:diffget)
   - diffoff! 强制关闭比较模式
   - :set noscrollbind 取消文件比较中的同步滚屏功能


## 缓冲区
   - buffer
      - ctrl + w o 可以隐藏当前  窗口之外的其它窗口到 buffer
      - :badd xx.txt 用buffer隐式打开 xx.txt
   - :buffers（用命令 :ls 也可以）
      - 可以查看相应的 buffer
      - 最前面的数字是 buffer 相应的编号
      - %表示当前激活的buffer中打开的buffer ; a 表示激活的 buffer
   - :b数字，可以打开相应位置的 buffer 
   - :bn，下一个缓冲区
   - :bp，上一个缓冲区
   - :bl，最后一个缓冲区
   - :数字bw，彻底删除第数字对应的缓冲区
   - :数字bd，删除第数字对应的缓冲区，并未真正删除，还在unlisted列表中
   - :ba[ll]，把所有的缓冲区在当前页中打开，每个缓冲区占有一个窗口

## 标签tab
   - :set tabpagemax=15 设定为最大标签为 15 个，默认为最大 10 个
   - vim   -p file1 file2 # 把这几文件以标签形式打开
   - set showtabline=[1,2,3] # =0完全不显示标签栏，=1只有用户新建时才显示，=2总是显示标签栏
   - :tab 文件名 # 在新标签页中打开指定文件
   - :tabnew 文件名 # 在新标签页中编辑新文件
   - :tab split # 在新标签页中，打开当前缓冲区中的文件的
   - :tabf 允许你在当前目录搜索文件，并在新 标签页中打开
   - :tabs 显示已打开标签页的列表，并用“>”标识出当前页面，用“+”标识出已更改的页面
   - :tabc 关闭当前标签
   - :tabo 关闭所有标签
   - :ngt 转到相应的标签，n标签编号
   - :tabn 或 gt 移动到下一个标签页
   - :tabp 或 gT 移动到上一个标签页
   - :tabfirst 或 :tabr 移动到第一个标签页
   - :tablast 移动到最后一个标签页
   - :tabm 数字 # 移动当前标签页的次序，不指定参数将移动到第一个位置
   - :tabdo 命令 # 同时在多个标签中执行命令，比如 :tabdo 5s/food/drink/g 命令把当前多个标签页中文件中的 “food” 都替换成 “drink”

## 书签
- 书签分为 文件书签 和 全局书签
   - 文件书签是你标记文件中的不同位置，然后可以在文件内快速跳转到你想要的位置。 
   - 全局书签是标记不同文件中的位置。也就是说你可以在不同的文件中快速跳转 
   - `m{a-zA-Z} ` 在当前光标处标记书签
   - 例如 ma 或 mA 
   - 小写的是文件书签，可以用(a-z）中的任何字母标记。
   - 大写的是全局书签，用大写的(A-Z)中任意字母标记。
   - \``{a-zA-Z}` 中转到某个标签
   - 如果是全局书签，则会开启被书签标记的文件跳转至标记的行
   - \`0 跳转入现在编辑的文件中上次退出的位置 (go to last exit in file)
   - \`\` 跳转如最后一次跳转的位置 (go to last jump   -> go back to last jump)
   - \`\`\` 跳转至最后一次编辑的位置 (go to last edit)
   - g`{mark} 跳转到书签 (jump to {mark})
   - `:delm{marks}` 删除一个书签 (delete a mark) 例如:delma那么就删除了书签a 
   - `:delm!` 删除全部书签 (delete all marks)
   - `:marks` 显示系统全部书签 (show all bookmarks)


## 寄存器
   - vim 默认是没有系统剪贴板的，如果要在vim中复制到系统剪贴板中则要安装 `sudo apt-get install vim-gnome`
   - 寄存器的 + 和 * 的区别
      - \+ 是指外部在剪贴板中的内容，这里才是要粘贴出来的内容
      - \* 是指鼠标选中的内容
   - 在插入模式下
      - "= 可以进入指命模式寄存器，在下栏中输入一个计算表达式可以计算值并存在指命寄存器中
      - "对应的寄存器名 可以把相应寄存器中的数据粘贴出来
   - 在普通模式下
      - "a~z 再执行复制或删除或剪切命令，可以把相应的操作内容放在相应的寄存器中
      - 如果是用大写的字母作为寄存器名，则是把操作内容累加在相应小写的寄存器中
      - "a~z 再执行粘贴可以把相应寄存器中的内容粘贴出来


## 正则表达式
   - 区别
      - 在 vim 中使用的正则表达式差不多只有 . * [] 元字符可以直接用,其它元字符只能加 \
      - \\= 表示函数式
      - 加上行号 :%s/^/\\=line(".")/g
      - 加上行号和一个空格 :%s/^/\\=line(".")." "/g
      - 换行匹配
      - \\n 换行符（行尾）
      - \\_s 是一个空白字符，空格或制表符或换行符
      - \\_^ 开始一行（零宽度）
      - \\_$ 一行的结束（零宽度）
      - \\_. 表示包含换行符在内的所有字符
      - \\_s 匹配空格或断行
      - 未明确的知识1
      - 在Vim中, 还可以对正则表达式的分组进行大小写的转换, 要用到的参数有:
      - \u （将分组第一个字母转换成大写）
      - \U （将整个分组转换成大写）
      - \l （将分组第一个转换成小写）
      - \L （将整个分组转换成小写）
      - 示例:
            ```
      - :%s/\v(\w)(\w*)/\u\1\L\2/g
      - 将所有单词转换成首字母大写
            ```
      - 未明确的知识2
         ```
         要在查找或替换中完全使用正则表达式, 可以在pattern之前使用参数:
         \v
         它代表"very magic".
   
         相反, 有个代表"very nomagic"的参数, 可以表示完全不使用正则表达式:
         \V
         即原样匹配所有字符, 但斜杠和反斜杠还是需要转义.
   
         示例:
         /\v<vim=>|gvim
         :%s/\V\\v<vim=>|gvim//g
   
         可使用以下文本进行测试:
         gvim vi vim gvi viv \v<vim=>|gvim
         ```


- ### 贪婪/懒惰
   - #### 一般情况下默认是匹配尽可能长的
   - #### perl 正则格式
    |符号|说明|
    |--|--|
    |\{-}|0个或多个，尽可能少的匹配|
    |\{-n,m}|n个或多个，尽可能少的匹配|
    |\{-n, }|至少匹配n次，尽可能少的匹配|
    |\{-, m}|至多匹配m次，尽可能少的匹配|
   - #### vim 正则格式
   - vim中的匹配实在是不如perl好用，一直想实现非贪婪匹配，今天偶然发现可以用量词匹配来实现，具体可以看:h /\{
   - \{n,m} Matches n to m of the preceding atom, as many as possible
   - \{n} Matches n of the preceding atom
   - \{n,} Matches at least n of the preceding atom, as many as possible
   - \{,m} Matches 0 to m of the preceding atom, as many as possible
   - \{} Matches 0 or more of the preceding atom, as many as possible (like *)
   - \{-n,m} matches n to m of the preceding atom, as few as possible
   - \{-n} matches n of the preceding atom
   - \{-n,} matches at least n of the preceding atom, as few as possible
   - \{-,m} matches 0 to m of the preceding atom, as few as possible
   - \{-} matches 0 or more of the preceding atom, as few as possible
   - 也就是.\{-}可以实现.*的非贪婪匹配，.\{-1,}可以实现.+的非贪婪匹配。

   - ### 零宽断言
   - 在各种常用工具对比中，我看到vim是支持计数的，而且似乎大部分常用的正则元字符都与perl兼容，比如\s,\d,\D,\w,\W, <
   - 但vim不支持\b，即单次边界。另外，vim中比较麻烦的是它似乎支持的是BRE（基本正则表达式，posix定义的），BRE中所有括号都不是元字符，因为作为元字符的是\(,\{。比如vim中匹配连续3个9，你得用9\{3\}，原来我一直以为不支持，但我还是觉得麻烦了一点，grep默认也是使用的这种BRE。好吧，我发现网上文章说了一个小小的偷懒情况，VIM中匹配999也可以写成9\{3}，也就是说少了结尾的\。
   - 与perl相比，(?换成了\@，并且这个符号应该跟在匹配模式的后边。
   - vim Perl 意义 
   - \\@=   (?= 顺序环视 
   - eg:查找后面是sql的my： /my\(sql\)\\@=
   - \\@!   (?! 顺序否定环视 
   - eg:查找后面不是sql的my： /my\(sql\)\\@!
   - \\@<=   (?<= 逆序环视 
   - eg: 查找前面是my的sql： /\(my\)\\@<=sql
   - \\@<!   (?<! 逆序否定环视 
   - eg:查找前面不是my的sql： /\(my\)\\@<!sql
   - \\@>   (?> 固化分组 
   - \\%(atom\)   (?: 非捕获型括号
   - 意思是，此分组不捕获，可以理解为不算在分组信息中，eg：
   - :%s/\%(my\)sql\(ok\)/\1
   - 上面的命令会将mysqlok替换为 ok ，由于my为捕获在分组中，故组中\1 为ok。

## 宏（高级功能）
   - 宏的步骤
      - 按 q 记录宏
      - 再按 a-z 其中一个字母的键 把宏存入相应寄存器
      - 然后操作自己的操作
      - 按 Esc 回到一般模式
      - 再按 q 退出宏
      - 按 @刚刚记录宏的寄存器的键 使用宏
      - 如果要有次数的调用宏则 数字@刚刚记录宏的寄存器的键
      - @@ 重复调用上次的宏

## 内容文件搜索
   - :vimgrep /正则/[g][i][j] 文件路径名（可以是多个文件）
      - 如果没有参数 j 那么会当前打开文件会打开查找到的第一个文件，有参数 j 则只更新查找到的列表
      - 查找后 :copen 打开查找到的位置，在相应位置 enter 则打开文件
      - 查找后 :cclose 关闭位置窗口
      - 查找后 :cc 是在转到当前查找到的位置
      - 查找后 :cn 转到下一个位置
      - 查找后 :cp 转到前一个位置

## Tags
   - [tags教程](https://blog.csdn.net/wooin/article/details/1858917)
   - [VIM tag教程](https://blog.easwy.com/archives/advanced-vim-skills-use-ctags-tag-file/)
   - [vim 标签教程一](https://blog.csdn.net/wooin/article/details/1858917)
   - [vim 标签教程二](https://blog.easwy.com/archives/advanced-vim-skills-use-ctags-tag-file/)

## 未完待续
   - 未完待续。。。
  





