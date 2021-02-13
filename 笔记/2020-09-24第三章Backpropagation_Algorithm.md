# ������ ���򴫲��㷨��Backpropagation Algorithm��
## Review of computational model of Synapse
ͻ���̻���ѧģ�ͣ�Ȩ�أ�  
���˳���̻���Ԫģ��  
>$y=f(z)=f(\sum_{i=1}^nw_ix_i)$  
>$z=\sum_{i=1}^nw_ix_i$  

��׼������ģ��

## �������ѵ����Network performance Cost Function
��
* Ҫ�߱����۵�����
* Ҫ�߱�����ѧϰ������
* ����cost function�����ܺ������̻����������
  * $a^L$�������Ԥ������
  * $y^l$��ʵ����������
  * $J(a^L,y^l)$��Performance function or cost function������������ܺ��������ڸ������������Ȩ��
* ��ʲô�̻������ܺ���
  * ���ø�ŷ����þ����������
  * ������ܺ���ȡ�㣬����������ȫһ���������ѧϰ�ɹ�
  * ������**�����Ժ���**
  * ���磺$j=\frac{1}{2}$��
* ���ܺ���J�����÷���
  * Ŀ�������ҵ����ܺ�����**��Сֵ��minima points��**���Ǿֲ���С���ֲ������������С��
  * �ҵ���Ӧ��**��С��**������ȡ��Сֵʱ�����еı�����ȡֵ������������ 
* ����**��������Iteration method��**
  * һ��һ���ҵ���С��  
$w(k+1)=w(k)+a_k\cdot p_k$
  * �ݶ��½��� 
* ���岽��
  1. �������ܺ���
  2. �����ݶ� $\partial$ 
  3. x
  4. x
## ��ҳֽǳ�� BP�㷨�����ݶ�
* ��һ����Ч�ļ�����������ķ�����
$$\frac{\partial J}{\partial w_{ij}^l}  \text{����������̻�����}$$
* ��һ�����ܺ����̻���������
* ����ȫ�����ܺ���$J$���������������ϣ���������$\delta^l_i$������
* $$\delta^l_i=\frac{\partial J}{\partial Z_i^{l}}$$
* һ����˵$J$��ȡŷ�Ͼ��룺
$$J=\frac{1}{2}\sum^{N_L}_{j=1}(a^l_j-y^l_j)^2$$

$$\delta^l_i=\frac{\partial J}{\partial Z^l_i}=\sum^{n_{l+1}}_{j=1}\frac{\partial J}{\partial z^{l+1}_j}\cdot$$
XXXXXXXXXXXXXXXXXXX  
XXXXXXXXXXXXXXXXXXX  
XXXXXXXXXXXXXXXXXXX  

## BP�㷨
* �������������������㷨
  * ǰ����㣺$a^{l+1}_i=f \left( \sum^n_{j=1}\right)$
  * ���򴫲���$\delta^l_i$
* ����ѵ����ʽ
    1. Online training: For each sample
* ��������BP�㷨����ѵ����
    1.  **Online BP Algorithm:**
        1. Input the training data set $D=\{(x,y^l)\}$
    2.  **Batch BP Algorithm:**
