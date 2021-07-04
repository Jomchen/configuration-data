### 汇编学习

mov                               # 为变量赋值
cmp                               # 对比
j 开头的指令基本都是跳转
jne -> jump not equal             # 跳转（有条件跳转，不相等时跳转）
jmp                               # 跳转

push offset string "xxx" (地址)   # printf(xxx)
call                              # 调用函数
add esp,4                         # #堆栈平衡#
