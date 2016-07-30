# Nyaovim

### deoplete 
-   自动启动   <code>let g:deoplete#enable_at_startup = 1</code>
-   设置c++补全  
  <code>"let g:deoplete#sources#clang#libclang_path ='/usr/lib/llvm-3.6/lib/libclang.so.1' 
  let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.6/lib/clang/3.6.0/include' 
  </code>
-   按tab才显示补全   <code> let g:deoplete#auto_complete_start_length = 1000 </code>

---
### 默认代码 F2
### 编译运行 F7 c++生成的文件为原名
### TreeToggle  显示文件树  F4
### GundoToggle 显示更改树 F5
### SrcExpl 显示定义文本 F8
### 切换窗口  

- **t[hjkl#[]]  hjkl代表上下左右  数字代表左上的数字  [] 代表左上的上一个和下一个**
- tb/ti 显示变量函数等信息

---
### NeoMake  语法检查

- au! BufWritePost * Neomake  每次保存时候执行 Neomake

---
### 注释
- \cc **单行注释  注释在最前**
- \cy **多行注释**
- \c<space>  选中后多行注释 如果内部被注释的 则对其他不操作
- \cm 选中后多行注释 用/**/    
- \cn 单行注释  注释在第一个字符前
- \ci **多行注释  如果内部有被注释的 则取消注释**
- \cu **取消注释**

---
### easymotion
\f 字符 搜索
\s 两个字符
\L 查询行
\w 查询单词

---
### multiple-cursors 多指针
- ctrl -q x

---
### target.vim 命令扩展
- [({, 等都能用 da*

---
### NeoTerm
- t&lt;Enter> 显示终端
- tc 终端kill 进程
- te 将选中的部分发送到终端
- tE 将此文件内容发送到终端
- tt 将后面的信息发送到终端

---
### EasyAlign
1. 选中区域
2. ga
3. 对齐的符号

---
### surround
- cs char1 char2 将一对char2变成char1 char2 可以是<*> 主要用于"'{[(
- cst char1 将一对<*>转成char
- ds char 删除一对char
- dstw 删除一对<*>
- ystw char 在选定word两边加char

---
### repeat.vim
- 用.重复上一次操作

---
### Mark-Karkat 采取多种颜色高亮
- \\m 将当前word高亮
- \\r 将输入的词高亮
- \\n 隐藏高亮
- \\* 将前颜色的下一个
- \/ 所有颜色的下一个


---
### ccvext.vim can't use
### 字体
用元素审查 分析css  在 ~/.config/nyaovim/nyaovimrc.html 中改css 字体用 Noto Sans CJK SC

