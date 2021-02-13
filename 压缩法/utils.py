import numpy as np
f_relu = lambda s: (s>0) * s

df_relu = lambda s: s>0

def cost(a,y):
    J = 1/2 *np.sum((a-y)**2)
    return J

def accuracy(a,y):
    mini_batch = a.shape[1]
    idx_a = np.argmax(a,axis=0)
    idx_y = np.argmax(y,axis=0)
    acc = sum(idx_a == idx_y) / mini_batch
    return acc

def fc(w,a):
    z_next 
    return a_