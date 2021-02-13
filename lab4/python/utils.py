import numpy as np

# define the sigmoid function
f = lambda s : 1 / (1 + np.exp(-s))

# derivative of sigmoid  function
df = lambda s : f(s) * (1-f(s))

# Step 4: Define Cost Function
def cost(a, y):
    J = 1/2 * np.sum((a - y)**2)
    return J

# Step 5: Define Evaluation Index
def accuracy(a, y):
    mini_batch = a.shape[1]
    idx_a = np.argmax(a, axis=0)
    idx_y = np.argmax(y, axis=0)
    acc = sum(idx_a==idx_y) / mini_batch
    return acc

# Forward computation function
def fc(w, a):
    '''
    w.shape [output_dim, input_dim]
    a.shape [feature_dim, batch_size]
    '''    
    z_next = np.dot(w, a)
    a_next = f(z_next)
    return a_next, z_next

# Backward computation function
def bc(w, z, delta_next):
    '''
    w.shape [output_dim, input_dim]
    z.shape [feature_dim, batch_size]
    delta_next.shape [feature_dim, batch_size]
    '''
    delta = np.dot(w.T, delta_next) * df(z)
    return delta