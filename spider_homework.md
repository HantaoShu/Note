编程环境: CentOS6.5 python2.7.8      
所用框架: urllib, urllib2, BeautfulSoup     
实验目标: 爬取 http://58921.com/ 网站的票房信息并获得每部电影的票房与其相关信息    
  
  
## 一. 主要问题  
该网站做了些反爬虫的设计，主要有以下两点  
1. 在网站中数字的存储大多为图片  
2. 若需爬取第3页及之后信息则需要登录 且在登录时有token验证  
  
#### 问题1 在网站中数字的存储大多为图片  
由于总票房数为图片故我分析了以下三个页面  
网页58921.com/alltime 结构  

![http://o88xvi2w5.bkt.clouddn.com/spiderhomework2.jpg](http://o88xvi2w5.bkt.clouddn.com/spiderhomework1.jpg)  

主要需要爬去的内容由蓝色标出 其 Xpath://*[@id="content"]/div[3]/table/tbody  
此处的总票房为图片存储 故需要进一步爬取  


网页http://58921.com/film/2882 结构  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework2.jpg)  

主要需要爬去的内容由蓝色标出 其 Xpath://*[@id="content_view_2882"]/div[2]/div  
可以看到这里的票房仍是图片  
  
网页http://58921.com/film/2882/boxoffice 结构  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework3.jpg)  

主要需要爬去的内容由蓝色标出 其 Xpath://*[@id="2"]/div[1]/h3  
在这可以得到票房的文字信息  
同时在第二个页面中，电影的其他信息得到解决  
  
#### 问题2 若需爬取第3页及之后信息则需要登录 且在登录时有token验证  
  
![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework4.jpg)  

分析表单: 表单XPath://*[@id="content"]/div/form  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework5.jpg)  

表单有5项 且主要问题是form_token  
在关闭浏览器cookie后 可以在network中找到对应的post表单(若不关闭则会直接重定向)  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework6.jpg)  

在这得到了目的url 并且验证了post data  
在猜测cookie中存在着form token的  
故通过记录cookie 以及在html中获得token 从而进行正常登录  

## 二.  代码分析  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework7.jpg)  
此处 为bsfinder类 目的是为beautifulsoup设置的判断函数 用于判断文档结构和中文  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework8.jpg)  

此处为进一步的分析函数 对后面爬虫所需各项进行进一步分解 得到内容   
func 作为一个转换函数 将两个参数的函数转换为一个参数  
  
![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework9.jpg)  

此处为登录的部分 存储了cookie以及在/user/login 中查询token信息  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework10.jpg)  

此处为爬虫的主体部分  
和之前讲述的相同 现在/alltime 页面中找到链接和电影名字  
之后在对应的电影下找到导演 演员 语言 类型 公司 url 上映月份 电影持续时间等信息  
再到最后一个页面查询票房信息  
同时我也对爬虫进行时间上的控制 通过sleep 放置被封ip以及账户  
最后会存储log信息以及结果信息  
## 三. 实验结果  
以下为log 以及out的部分结果 (总体数据过大 只做部分截图)  

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework11.jpg)  

左边为out的信息 右边为log的信息  
输出信息由unicode编码 解码后如图所示(仅取一部分) 

![](http://o88xvi2w5.bkt.clouddn.com/spiderhomework12.jpg)  
最后得到980k的json数据共计1980部电影
