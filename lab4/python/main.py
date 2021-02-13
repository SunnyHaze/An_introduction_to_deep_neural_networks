import math, pickle
import numpy as np
from scipy.io import loadmat
import matplotlib.pyplot as plt
from utils import cost, accuracy, fc, bc

if __name__ == '__main__':
    # Step 1: Data Preparation
    m = loadmat("D:\笔记\深度神经网络引论\lab4\python\mnist_small_matlab.mat")

    trainData, trainLabels = m['trainData'], m['trainLabels']
    testData, testLabels = m['testData'], m['testLabels']
    print(trainData.shape,trainLabels.shape)
    print(testData.shape,testLabels.shape)

    train_size = 10000
    X_train = trainData.reshape(-1, train_size)
    test_size = 2000
    X_test = testData.reshape(-1, test_size)
    print(X_train.shape, X_test.shape)

    L = 5

    layer_size = [784, 
                  256, 
                  128, 
                  64, 
                  10]  
    
    w = {}
    for l in range(1, L):
        w[l] = 0.1 * np.random.randn(layer_size[l], layer_size[l-1])
    alpha = 0.05  

    J = [] 
    Acc = []
    max_epoch = 20 
    mini_batch = 100
    for epoch_num in range(max_epoch):
        idxs = np.random.permutation(train_size)
        for k in range(math.ceil(train_size/mini_batch)):
            start_idx = k*mini_batch 
            end_idx = min((k+1)*mini_batch, train_size) 

            a, z, delta = {}, {}, {}
            batch_indices = idxs[start_idx:end_idx]
            a[1] = X_train[:, batch_indices]
            y = trainLabels[:, batch_indices]
               
            for l in range(1, L):
                a[l+1], z[l+1] = fc(w[l], a[l])

            delta[L] = (a[L] - y) * (a[L]*(1-a[L]))  
            print(delta[L])

            for l in range(L-1, 1, -1):
                delta[l] = bc(w[l], z[l], delta[l+1])

            for l in range(1, L):
                grad_w = np.dot(delta[l+1], a[l].T)
                w[l] = w[l] - alpha*grad_w

            J.append(cost(a[L], y)/mini_batch)
            Acc.append(accuracy(a[L], y))
        
        a[1] = X_test
        y = testLabels

        for l in range(1, L):
            a[l+1], z[l+1] = fc(w[l], a[l])

        print(epoch_num, "training acc:", Acc[-1], 'test acc:', accuracy(a[L], y))
    
    plt.figure()
    plt.plot(J)
    plt.savefig("J.png")
    plt.close()
    plt.figure()               
    plt.plot(Acc)
    plt.savefig("Acc.png")
    plt.close()
    # Step 8: Store the Network Parameters
    # save model
    model_name = 'model.pkl'
    with open(model_name, 'wb') as f:
        pickle.dump([w, layer_size], f)
    print("model saved to {}".format(model_name))
