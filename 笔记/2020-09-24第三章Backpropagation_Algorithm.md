# 第三章 反向传播算法（Backpropagation Algorithm）
## Review of computational model of Synapse
突触刻画数学模型（权重）  
拓扑抽象刻画神经元模型  
>$y=f(z)=f(\sum_{i=1}^nw_ix_i)$  
>$z=\sum_{i=1}^nw_ix_i$  

标准神经网络模型

## 神经网络的训练（Network performance Cost Function
）
* 要具备评价的能力
* 要具备自我学习的能力
* 利用cost function（性能函数）刻画网络的性能
  * $a^L$：网络的预测向量
  * $y^l$：实际期望向量
  * $J(a^L,y^l)$：Performance function or cost function，所定义的性能函数；用于更新网络的连接权。
* 用什么刻画性能能函数
  * 利用个欧几里得距离衡量性能
  * 如果性能函数取零，那两个点完全一样。则代表学习成功
  * 本质是**非线性函数**
  * 比如：$j=\frac{1}{2}$。
* 性能函数J的利用方法
  * 目的在于找到性能函数的**极小值（minima points）**，是局部极小、局部概念（邻域内最小）
  * 找到对应的**极小点**（函数取最小值时，所有的变量的取值，有序向量） 
* 利用**迭代法（Iteration method）**
  * 一步一步找到最小点  
$w(k+1)=w(k)+a_k\cdot p_k$
  * 梯度下降法 
* 总体步骤
  1. 构造性能函数
  2. 计算梯度 $\partial$ 
  3. x
  4. x
## 三页纸浅析 BP算法计算梯度
* 是一个有效的计算这个函数的方法：
$$\frac{\partial J}{\partial w_{ij}^l}  \text{用这个函数刻画性能}$$
* 有一个性能函数刻画整体性能
* 构造全局性能函数$J$，定义在神经网络上，和敏感性$\delta^l_i$，其中
* $$\delta^l_i=\frac{\partial J}{\partial Z_i^{l}}$$
* 一般来说$J$会取欧氏距离：
$$J=\frac{1}{2}\sum^{N_L}_{j=1}(a^l_j-y^l_j)^2$$

$$\delta^l_i=\frac{\partial J}{\partial Z^l_i}=\sum^{n_{l+1}}_{j=1}\frac{\partial J}{\partial z^{l+1}_j}\cdot$$
XXXXXXXXXXXXXXXXXXX  
XXXXXXXXXXXXXXXXXXX  
XXXXXXXXXXXXXXXXXXX  

## BP算法
* 定义在神经网络有两种算法
  * 前向计算：$a^{l+1}_i=f \left( \sum^n_{j=1}\right)$
  * 反向传播：$\delta^l_i$
* 两种训练方式
    1. Online training: For each sample
* 产生两种BP算法进行训练：
    1.  **Online BP Algorithm:**
        1. Input the training data set $D=\{(x,y^l)\}$
    2.  **Batch BP Algorithm:**
