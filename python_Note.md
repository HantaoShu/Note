# 语句
- // 表示浮点数的整除运算
- ** 乘方运算
- 结尾加L 高精度数
- 将脚本像普通程序一样运算  在Linux下 第一行加入  
#!/usr/bin/env python  
之后在chmod a+x ****.py
- 字符串可以直接拼接 "aaa"  "bbb" 普通的需要进行转义  
- 若不想用转义 需前面加r  代表raw 最后不能有/
- 长字符串可以用3'  '''aaa''' 可跨行
- repr 将某种数据转成字符串的形式 比如字符串和数字拼接需要这函数   有些地方用反引号
- unicode编码字符串 在前缀加u
- 包 是一个有层次的文件目录结构  每个包都有\_\_init\_\_.py
- range 和 xrange 在py2中 range返回列表 xrange返回生成器 在py3中 range被xrange取代
# 列表与元组
- 列表和元组最大的区别是元组是不可改变 
- 编号是从0开始的
- 比如要最后3个数  可以用 [-3:]  注意不能用0  同理 只要从头开始 就把那数字置空 [ : ]代表整个数组
- 可以设置步长 [::步长] 可以是正数或者负数但不能为0
- 序列可以相加或者乘常数
- 不存在在py中是None 不是null
- in 是一种运算符返回值是Bool 真为True 假为False
- list() 将字符串转为列表  ''.join(somelist) 列表转字符串
- del函数可以删除元素
- 可以分片复制  a[3:5] = list('aa') 且可以不等长替换 比如可以变长或变[]
- 列表常用的方法  
    - append 在尾部追加
    - count  统计次数
    - extend 追加某个序列的多个值  与+不同 他不返回一个新的序列 在原有改变
    - index 返回索引
    - insert(key,record)
    - pop 删除最后一个
    - remove(record) 删除第一个匹配项
    - reverse 反序
    - sort和sorted sort在本身更改 sorted返回一个列表  sort(reverse=True,key=len) key是比较方法 
- 平常用，分割的就是元组  如果要单独一个元素的元组 需要在后面加一个，
- tuple可以生成一个元组 从字符串或列表
- 作用域  在函数外是全局 在内部是局部 
# 字符串
- 格式化字符串   format % values  format是字符串格式化与c相似 values 是元组  
  format   
    - r 字符串 被repr的
    - e/E 科学计数法
    - 可以加 + -(左对齐) “ ” 0 和c相同 
- 模板字符串  
  s = Template('$x ...')  
  s.subtitute(x='...') 
  其中如果要打印$ 需要$$  subtitute可以使用字典
- 字符串常量  
    - string.digits 
    - string.letters 
    - string.lowercase 
    - string.uppercase 
    - string.printable
    - string.punctation
- 字符串方法
  - find 查找子串，若存在返回最左端，若不存在则返回-1
  - join 连接 用某一个字符去连接一个字符串列表  
    例子： ‘+’.join(['1','2','3','4'])  => '1+2+3+4'
  - sqlit join的逆方法
  - lower 变为小写字母
  - replace 替换 所有
  - strip 去除两边的空格
  - translate 同时多个替换 单个字符  
    table = maketrans('原字符','换后字符')  
    ''.translate(table)

# 字典
- 创建字典 用dict()  函数内可以用关键字的映射或者元组的列表
- 常规函数和使用和列表相似
- 利用字典的格式化字符串  ‘  $(xxx)’ %yyy 显示的是yyy[xxx]
- 方法 
  - clear 清空  防止因为引用赋值造成的问题，如  
    x={}  
    y=x  
    x['key'] = 'value'  
    x={}  
    此时y没被清空 用clear就被清空了
  - copy 浅拷贝 字典是新的 但是字典中的值是原来的 只是引用  
    对应的深拷贝   
    from copy import deepcopy  
    deepcopy()   
  - fromkeys 构造一个字典用默认值作为值(默认是None) dict.fromkeys(['',''],'默认值')
  - get 取出字典的值 即使是不存在也能取出 get还能设置默认值 即当不存在返回什么(默认为None)、
  - has_key 是否存在键 py3.0不存在
  - items 按照键值对返回list
  - iteritems 返回迭代器
  - key iterkeys key返回键的列表 iterkeys返回迭代器
  - values itervalues values返回值的列表 itervalues返回迭代器
  - pop 根据键删除该键-值
  - popitem 删除随机的一个键-值
  - setdefault 查找值 若存在则返回 若不存在则赋值
  - update 用一个字典更新另外一个字典 添加键值 若重复则覆盖

# 条件 循环和其他语句
- print 打印时候可以用，打印多个表达式，打印结果会用' '代替，
- import  
  - import \*\*  
    需要写之前的包路径
  - from \*\* import \*\*  
    不用
  - from \*\* import \*\* as \*\*

- 赋值  可以多个一起赋值  列表赋值为引用赋值 要深拷贝需要 b = a[:]
- 用:表示语句块的开始
- 作为布尔表达式 以下会作为假 False None 0 "" () [] {}
- 选择语句  
    if \*\* :  
    elif \*\*:  
    else :  
- == 和 is ==代表相同 is代表是同一个对象
- 断言 assert 表达式
- 循环 while for(主要用in)
- 迭代工具 
    - zip 将两个序列压缩成元组  若长度不同则按照最短的
    - enumerate 提供索引-值对  
           for index,string in enumerate(strings):
              if 'a' in string 
                strings[index] = '[consored]'
    - sorted 返回列表
    - reversed 返回一个可迭代对象
- 循环的else 语句　当break没有被执行执行else
- 列表推导式 形成列表的 [** for / if]
- pass 跳过 python中空代码块不合法
- del 删除对象
- exec 执行字符串的语句 建议后面加 in <scope> 确定域 防止破坏原有环境
- eval 计算字符串的结果 可以在对应域中用  
  scope={}  
  scope['x'] = 2  
  scope['y'] = 3  
  eval('x\*y',scope)  
  scope={}  
  exec 'x=2' in scope  
  eval ('x*x',scope)

# 抽象
- callable 判断函数是否能被调用 
- 在def后面的第一条与居前加入字符串，可以当做函数的一部分信息，作为文档字符串  
  当输入函数名或者help() 都会显示文档字符串
- 修改参数  如果参数是变量则不会被修改 如果是list则会被修改
- 可以使用关键字参数
- 搜集参数 如果可以有任意个参数  可以用 def fun(\*perms)  参数会转变成元组  
  如果参数是关键字参数 用 \*\*perms 那么会变为一个字典
- 作用域 vars()   返回一个字典，包含当前作用域的变量 这个字典最好不要修改
- 函数能访问外部变量  若重名那么就需要用globals()['parameter'] 
  如果你需要修该全局变量 那么需要申明 这就需要 global parameter
- 函数嵌套 通常使用在函数中创建函数
- 函数式编程
  - map(fun,list())  对每个对象进行这个函数
  - filter(fun,list())  对每个对象判断 如果函数返回真，那么保留，假不保留
  - lamdba表达式，创捷匿名函数 lamdba x:某个正常的语句

# 更加抽象
- self 对象本身
- 可以将摸个普通函数绑定到某个对象的实例上 这里的普通函数不用self的参数 也可以将实例的函数绑定到一个普通函数上
- python不直接支持私有方法 如果要将一个方法或者属性变成私有的要在它前面加双下划线  
  这样会将方法不能被某个实例进行调用，但是实际上在内部是将他变成了但下划线+类名+函数名的形式
  如果不想让其他对象访问内部数据，那么可以加但下划线，这样不会被from module import* 导入
- 类作用域 类作用域内的变量会被所有实例访问 如果重新绑定 那么就可以屏蔽类范围的对象
- 定义超类 在class 类名后的括号内可以设置超类
- 查看一个类是不是另外一个类的子类 可以用issubclass(子类,父类)  或者可以查看类的特殊属性 \_\_bases\_\_
- 查看一个对象属于哪个类用\_\_class\_\_
- python 满足多继承  注意顺序 先继承的类中的方法会重写后继承的方法
- hasattr(对象,'特性') 判断某个类是否包含某个特性(方法/变量)  
  callable(getattr(对象,'特性',默认值)) 默认值代表如果不存在这个特性的返回值
- \_\_dict\_\_  得到对象内存储的值

# 异常
- 引发异常  用raise 语句
- 自建异常 继承Exception
- 捕捉异常：
  try:  
    ...  
  except ..Exception:  
  
    ..
- 继续传递异常  raise 不加参数
- 可以在一个try中加多个exception 多次捕捉 也可以一次性捕捉多个异常 用元组
- 如果需要用到exception内具体的 可以在except语句内多一个参数  如 except Exception,e:
- 全捕捉 except后不加任何参数 会捕捉所有异常
- 异常中的else语句 代表如果没有异常那么进入else
- finally子句  一定会运行的子句

# 魔法方法 属性 迭代器
- 新式python  在类前面加\_\_metaclass\_\_=type
- \_\_init\_\_  构造器方法 
- 构造子类的的构造器方法时要现运行父类的构造器方法,或者在新式python中用super(类名,self).\_\_init\_\_()  
  使用super可以很好的处理继承多个类  可以一次性init
- 实现对量的序列和映射 \_\_setitem\_\_(self,key,value) \_\_getitem\_\_(self,key) \_\_len\_\_(self) \_\_delitem\_\_(self,key) 
- 可以继承UserList UserString UserDict 创建自己的list等
- 属性 property函数 绑定一个属性 需要0-4和参数  fget fset fdel doc- 分明是 读取 设置 删除 文档  
  旧式 使用\_\_getattr\_\_ 和\_\_setattr\_\_ \_\_delattr\_\_ 参数有self name name是指对应变量的名字
- 静态方法和成员方法
  - 在静态方法后加 方法=staticmethod(方法)
  - 使用装饰器(@) @staticmethod  @ classmethod
- 迭代器  
迭代器值具有next方法的对象  本身就直接返回self 但是要实现next方法
- 生成器  
生成器具有yield语句 可用于迭代或者用于生成list等数据结构  
可以使用递归  
相当于函数并没有执行 而是存在一个迭代器 每一次请求 执行直到yield 或者 return  
方法  
  - send方法 需要一个参数 此时 原函数中的yield会变成一个表达式而不是一个语句 表达式的值就是send的值
    
  - throw 在生成器中引发一个异常系统库
  - close 关闭 印发


# 充电时刻
- 查看当前是在什么模块下　\_\_name\_\_ 常用 if\_\_name\_\_==\_\_main\_\_: do sth
- 包 包必须含有\_\_init\_\_.py 这个模块  
  可以使用dir() 查询或者查询\_\_all\_\_查询可以使用的  
  \_\_doc\_\_ help 查看文档  
  \range被xrange取代_\_file\_\_ 查看源代码位置
- 
  - sys 包含与python解释器相关的参数
  - os 系统库 包括一些环境变量
  - fileinput 包含文件操作
  - heapq deque(from collections import deque) sets 基本的数据结构
  - random 有一个shuffle 重新排列 
  - time asctime  sleep
  - re 
    - compile 编译正则表达式
    - match 从开始匹配 返回起点或者None
    - serch 从任意处匹配 返回起点或者None
    - spilt 分隔
    - findall 查找所有子串 以列表返回
    - sub  替换

# 文件和素材
- open read字节数 write close
- seek 移动文件指针  tell 获得文件指针长度
- readline 可以加最长字符 writeline 注意加\n
- with open("filename") as somefile:  
    do_sth(somefile)  
  相当于try catch了
- 全部读完 for char in f.read() 或 for line in f.readlines() for line in fileinput.input(filename)

- 文件迭代器  for line in f

# 数据库支持
- connect 连接一个数据库
- rollback 回滚
- commit 提交
- cursor 获得游标  
  对游标使用　execute 可以执行sql语句
- 操作的时候先连接 获得游标 对游标进行操作  提交 关闭

# 网络编程
#### socket
主要有两个方法 send 和recv  
服务器可以listen 一个地址和端口 并可以send数据  
同时本地在connect后可以recv接受数据

#### urllib urllib2
用于访问网络文件 可以像打开本地文件一样打开网络文件  通过urlopen 下载通过urlretrieve 会转换成html

#### 多连接
可以有三种解决方法  分别是fork thread 和异步IO  
用SocketServer 可以用来fork和thread 分别是用ForkingMixIn 和ThreadingMixIn  
异步IO 可以使用select 或者poll  
框架 Twisted

# python与万维网
#### 屏幕抓取
1. tidy 修复xhtml 改正错误的工具
2. beautifulscup  注意findAll 以及各种标签的用法

