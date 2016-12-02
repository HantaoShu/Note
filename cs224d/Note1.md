## 1. Introduction to Natural Language Processing
讲述了NLP的目标:让计算机理解自然语言，并进行一些工作。  
Note 中列举了一些NLP的具体运用从易到难，像类似QA的，看到像实验室也有在做。  
在slide中讲述了NLP中最重要的一个难点，就是歧义。

## 2. Word Vectors
由于单词无法被直接被计算机理解->需要被编码->提出one-hot向量  
one-hot向量有一个性质:任意两个不同的词，他们one-hot向量正交

## 3. SVD Based Methods
Note中讲述了将矩阵X分解为UST<sup>T</sup>  
在我看来其实可以把奇异值分解看成三个矩阵的乘积，分别是旋转 伸缩 旋转

### 3.1. Word-Document Matrix
将文本和词关联起来，用一种很简单的方式X<sub>ij</sub>代表第i个词出现在第j个文本中

### 3.2 Word-Word Co-occurrence Matrix
记录两个词在一定区间内同时出现的频率 是一个|V|*|V|的矩阵  
有以下问题:
1. 新增词表时有问题，需要对所有进行重做
2. 维度很高，在训练中有困难
3. 矩阵十分稀疏，导致缺乏鲁棒性(并不是很了解直接逻辑)

针对以上问题，提出了用SVD来处理矩阵，通过SVD进行降纬，可以在减少矩阵纬度的同时保留了主要的信息

这里要注意以下问题
1. SVD是二次的时间复杂度
2. 对一些冠词 代词等常用的词需要处理 如the he has 等，有以下处理方式
  1. 像Note中说的，直接除去
  2. 在Leacture中说的，做max(x,t) x一般取100
  3. 在论文中说的，可以用subsampling，公式如下:
3. 考虑相关系数而不是原始的计数

![](http://o88xvi2w5.bkt.clouddn.com/svd.png)

## 4. Iteration Based Methods
这里讲了一些model，以及像error和update的内容

### 4.1 Language Models(Unigrams,Bigrams,etc)
这里讲的是一些传统的model ，如N-Gram 就是用条件概率来表示联合概率 而Unigram和Bigram就是n=1和n=2的特例
![unigram](http://o88xvi2w5.bkt.clouddn.com/unigram.png)
![bigram](http://o88xvi2w5.bkt.clouddn.com/bigram.png)

### 4.2 Continuous Bag of Words Model(CBOW)
用简单的话说，就是用中心词来预测前后词  
方式也很容易理解:  
网络一共有三层:
1. 输入层 输入是该中心词左右的词  
2. 隐含层
3. 输出层

有两组参数
1. W<sup>(1)</sup> 是从输入层到隐含层 这里的参数是共享权值的
2. W<sup>(2)</sup>  

注意隐含层需要进行平均操作

训练中使用交叉熵作为代价函数,具体如下
!![](http://o88xvi2w5.bkt.clouddn.com/CBOW.png)
![](http://o88xvi2w5.bkt.clouddn.com/CBOW2.png)

### 4.3 Skip-Gram Model
用一句话说就是用中间预测前后  
网络与之前的类似，只是类似将第一层和第二层进行了交换 先通过中心词一个输入得到隐含层，再通过隐含层得到前后的词
注意这里不需要进行取均值  
公式如下:
![](http://o88xvi2w5.bkt.clouddn.com/Skip-Gram.png)
![](http://o88xvi2w5.bkt.clouddn.com/Skip-Gram2.png)
---
在论文中，提出了Hierarchical Softmax 对原本的算法进行了改进 引入了Huffman树 从而来加速训练，利用Huffman树并通过训练一系列二分类问题，从而改进，公式与之前的有所不同，如下:
![](http://o88xvi2w5.bkt.clouddn.com/Skip-Gram.pnghttp://o88xvi2w5.bkt.clouddn.com/HierarchicalSoftmax.png)

### 4.4 Negative Sample
引入了对负样本的参考，同时，他对所有负样本进行了采样，只是抽取部分负样本，再进行优化。  
优化的目标从原本的正确变成了正确+不错误(代表负样本，而且每类有所采样)  
提高了低概率的权重(文中说的3/4)

![](http://o88xvi2w5.bkt.clouddn.com/NegativeSample.png)


