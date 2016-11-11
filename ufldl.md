## ufldl笔记
#### ex1
##### Linear Regression 和Logistic Regression 这两个没什么值得注意的 与机器学习相同  
##### Gradient check 用来判断求导的正确性 利用导数的最初的epslion定义  

##### Softmax Regression  
这里将Logistic Regression 进行了扩展,从二分类问题扩展为多分类问题
J也进行来变化 但是思想仍然没变 仍然是取sum(-log(p(y=y_)))  
而 p = exp(theta'x)/sum(exp(theta'x))  
这样计算得到的p就相当于每个分类的概率
梯度计算直接求导即可  
Softmax Regression 有一个很重要的性质 它的参数是冗余的 由于P的和为1 那么就会产生一个参数的冗余 所以在实际使用中,我们可以少用一个theta,仍然可以得到相同的效果

#### Multi-Layer Neural Network
和上课讲的差不多,增加了正则化的操作以防止过拟合
//TODO: 学习矩阵的求导法则

#### Supervised Convolutional Neural Network
ufldl的重点 也就是CNN
CNN主要分为两块 分别是卷积和池化  
##### 卷积 
卷积每次相隔1的做映射   
假设原举证是r*c 用于卷积的矩阵是a*b 有k个 那么最后有k*(r-a+1)*(r-b+1)个元素  
在matlab中使用的是conv函数 注意在用之前要先旋转90°
![](http://ufldl.stanford.edu/tutorial/images/Convolution_schematic.gif)

##### 池化  
将卷积得到的那么多元素进行整合  将一个区间内的所有元素按照某种映射方式进行转化为1个元素  
通常有 max  mean 2范式等  
![](http://ufldl.stanford.edu/tutorial/images/Pooling_schematic.gif)

---

##### 随机梯度下降  
与批处理的比较 alpha需要变小  
从而有了两种比较好的方式 一种是用一个小值并在之后折半  
或者用一个根据迭代次数t相关的函数 如a/(b+t)

##### Momentum  
这里用了一种加速的方法  当前迭代的进度与之前迭代的进度有关系  
即 v=gama*v+alpha*d  theta = theta-v

##### Convolutional Neural Network  
前向时很简单 先进行卷积 后进行池化  
但是反向传播的时候就有些区别
如果第l层是卷积层 第l+1是池化层  
那么这里的delta传导如下图  
![](http://images.cnitblog.com/blog/381513/201312/11080853-06c3fdc33e66423490d7560de2cbbeb9.png)

这里涉及到一个采样的问题 用unsample将原本的delta分到采样前的各个位置   
如果是用均值pooling 则用kron函数可以实现 如果是最大值pooling 需要记录最大值的位置

当pooling层下一层是卷积层 pooling层的delta  
这一点在ufldl中并没有体现 由于ufldl中是单层的卷积+pooling  
以下是公式  
当pooling层有n个通道 卷积层(l+1)有M个特征 
![](http://images.cnitblog.com/blog/381513/201312/10233224-de029dc4d24a40e0b6ad19289184ee43.png)

其中*代表矩阵卷积 但是这里的卷积和之前的不一样 是full的 周围要先补一圈0

#### Unsupervised Learning
##### autoencoder 
同样是利用神经网络来重构数据  
对于系数编码 与课上讲的使用1范来实现稀疏不同,这里用了KL  
首先设了一个稀疏度参数p 
公式如下图  
其中pj代表神经元j的激活度  
![](http://ufldl.stanford.edu/wiki/images/math/8/7/2/8728009d101b17918c7ef40a6b1d34bb.png)  
![](http://ufldl.stanford.edu/wiki/images/math/8/a/7/8a77066279d89dae4688d9bf4508e0a1.png)

再将bp算法进行修改  
![](http://ufldl.stanford.edu/wiki/images/math/7/a/4/7a4ac86b3559db835f4357987252b088.png)
![](http://ufldl.stanford.edu/wiki/images/math/b/e/f/bef8a29947bfb0d746c54a7d922874e8.png)

##### PCA Whitening
PCA 也就是主成分分析 目的是进行降纬  
实际上是将一个矩阵分成三块 旋转 伸缩 旋转
降纬只需要取它较大的特征值 这里面特征值代表着在该方向上数据的方差情况,方差越大 该方向上特征越大

白化  
白话的目的是降低输入的冗余,由于若数据是图像,那么图像中相邻像素有很强的相关性,白化就减少这种冗余  
具体来说,白化将我们的输入转化为以下性质:  
1. 特征之间相关性低
2. 特征焗油相同的方差

在PCA白化中  只需要将对应的X/sqrt(lamdba) 使每个特征都有相同的协方差

在ZCA白化中 试将其变为原来纬度 即 xZCAwhite = U*xPCAwhite  
注意到特征值可能为0 且做分母 故需要加上一个epsilon  一般取1e-5

##### Sparse Coding
大部分和我们上课所做的是相似的 在这里稀疏使用了1范
比较有意思的是概率解释,他把自然图像建模问题看成k个独立的特征和噪声的和  
我们的目的是找到一组特征向量基 使这个特征基与之前假设的特征KL散度低  
![](http://ufldl.stanford.edu/wiki/images/math/7/b/3/7b39a1c36dc8d6463e4997495334c0f8.png)  
把噪声看成高斯白噪声 
那么有下式  
![](http://ufldl.stanford.edu/wiki/images/math/9/d/6/9d634e2a1b3457f439d442bf61f7381b.png)  
我们把特征看成独立的 
![](http://ufldl.stanford.edu/wiki/images/math/d/8/9/d89ec802e2b5461efa8d0d2d84f9e829.png)  
考虑稀疏性,我们希望 ai 的概率分布在零值附近是凸起的，而且峰值很高。一个方便的参数化先验分布就是  
![](http://ufldl.stanford.edu/wiki/images/math/8/5/0/850c6b42874fde83fef6001ba388d0b4.png)  
得到概率分布  
![](http://ufldl.stanford.edu/wiki/images/math/6/b/7/6b7b96f043bd1d85571edc7ac556921e.png)  

我们需要找argmax 但是考虑积分很困难  我们用最大值估计上积分  
代价函数可以表达为:  
![](http://ufldl.stanford.edu/wiki/images/math/e/3/4/e34c091d504207038943443866f62ccc.png)

使用稀疏编码算法学习基向量集的方法，是由两个独立的优化过程组合起来的。第一个是逐个使用训练样本x来优化系数 ai ，第二个是一次性处理多个样本对基向量phi进行优化。


##### ICA RICA
ICA 的中文名叫独立成分分析
目的是在稀疏编码的时候能得到一组正交基 (由于直接稀疏编码得到的可能不是正交的) 那么只是将优化目标改变 J=||Wx||1  s.t. WW'=I

##### RICA
将ICA公式进行变化 从而能解决对白化数据敏感 不能学习到过完备集 不能用其他的优化方法  
具体公式如下  
![](http://img.blog.csdn.net/20130717111256125?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQveGlhb19qaWFuZzIwMTI=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


#### Self-Taught Learning
这一块和我们上课时候的思想是一样的 通过自学习得到自己的特征 通过特征去进行分类

