# Lab 7 - Sequence auto-complete

## Information

* Course: Understanding Deep Neural Networks
* Teacher: Zhang Yi
* Student:
* ID:
#########################################################################################################################

PS： 1, You are allowed to use any programming language(e.g matlab, python and so on) but any deep learning framework ！
        2, Don't need to worry about your computer can not meet computation requirement , every assignment of this course can be ran on any PC with CPU!
        3, Please submit your code before deadline（choose one from MATLAB or PATHON）!

##########################################################################################################################

## Files

* `lab7.m` - the MATLAB code file for multi-target BP algorithm with sequence auto-complete problem
* `fc.m` - the MATLAB code file for feedforward computation
* `bc.m` - the MATLAB code file for backward computation.  **NOTICE**, add multi-target implementation in backward computing

## Instructions

Design a multi-target outputs neural network to learn to complete sequence.
The first two items of a sequence uniquely determine the remaining four.

Implement forward computing and backward computing in `fc.m` and `bc.m`.
**NOTICE**, backward computing need to be update to support multi-target error.
You may need to debug together with `lab7.m`.

1. prepare the data set. It is given by
```
train_seq = {
    'AA1212' 'AC1231' 'AD1221' 'AE1213'
    'BA2312' 'BB2323' 'BC2331' 'BE2313'
    'CB3123' 'CC3131' 'CD3121' 'CE3113'
    'DA2112' 'DB2123' 'DC2131' 'DD2121'
    'EA1312' 'EB1323' 'ED1321' 'EE1313'
    };
test_seq = {
    'AB1223' 'BD2321' 'CA3112' 'DE2113' 'EC1331'
    };
```
2. encode datasets (e.g. as one-hot vectors)
2. choose parameters
3. define the network architecture
4. initialize the weights
5. train the model
6. save the model
7. test the model

Capture the cost function plot and the element-wise accuracy plot while training.

## Submission

* Submit all (3) `.m` files, and the 2 plots (as `.jpg` files) in a zip file.
* Submit to email address of TA (scudeeplearning@163.com)
* Use email title:
    ```
    DNN2020F Lab7 <student-id> <student-name>
    ```
    (Don't keep `<`, `>`, `&gt;`, or `&lt;` in the title. Just fill in your student id and your name.)
    TA will be using a filter to **throw away** any email not following such format.
* Deadline: 2020/11/4 23:59
