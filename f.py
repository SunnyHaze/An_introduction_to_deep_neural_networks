# -*- coding:UTF-8 -*-
###########################################################
# Course: Introduction to Deep Learning
# Teacher: Zhang Yi
# Student:������
# ID:2019141460009

# Lab 1 - XOR Problem

# Task 1: Implement the function f(s) and F(x1, x2) in F.m
###########################################################

sample = [[0,0],[1,0],[0,1],[1,1]]
#�Ͽ�PPT����ʦ����ѧӳ���ʵ�ַ���
def f1(num):          
    if num >= 0:
        return 1
    else:
        return 0

def F1(vec):
    return f1(f1(2*vec[0]+2*vec[1]-1) + f1(-vec[0]-vec[1]+1.5) - 1.5)

#ͨ���ܼ򵥵�if���ʵ����    
def F2(vec):
    if vec[0] + vec[1] == 1:
        return 1
    else:
        return 0

def main():
    for i in sample:
        # F1��ʵ�ַ���
        if F1(i) == 0:
            print("Sample [{},{}] is classified as smooth worm.\n".format(i[0],i[1]))
        else:
            print("Sample [{},{}] is classified as doted worm.\n".format(i[0],i[1]))

        # F2��ʵ�ַ���
        # if F(i) == 0:
        #     print("Sample [{},{}] is classified as smooth worm.\n".format(i[0],i[1]))
        # else:
        #     print("Sample [{},{}] is classified as doted worm.\n".format(i[0],i[1]))

if __name__ == '__main__':
    main()