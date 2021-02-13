clc;
clear;
load train_1024.mat
load test_1024.mat
L = 5; 
layer_size = [1024 
              512
              256
              64 
              10];
try 
    load model.mat
catch
    for l = 1:L-1
%         if l==3 || l == 2 || l == 1
%             w{l} = 0.001 * abs(randn(layer_size(l+1,1), sum(layer_size(l,:))));
%         end
%         if l == 4
            w{l} = 0.1 * randn(layer_size(l+1,1), sum(layer_size(l,:)));
        end
%     end
    fprintf('inital\n');
end
alpha = 0.005;
J = []; % array to store cost of each mini batch
Acc = []; % array to store accuracy of each mini batch

max_epoch = int32(input('Enter the max_epoch:'));
mini_batch = 100; % number of sample of each mini batch

figure % plot the cost
for iter=1:max_epoch
    fprintf('========No.%d training starts======= \n',iter);
    % randomly permute the indexes of samples in training set
idxs = randperm(train_size); 
% for each mini-batch
for k = 1:ceil(train_size/mini_batch)
    % prepare internal inputs in 1st layer denoted by a{1}
    
    start_idx = (k-1)*mini_batch+1;          % start index of kth mini-batch
    end_idx = min(k*mini_batch, train_size); % end index of kth mini-batch
    if mod(k,200) == 0
        percent = end_idx/train_size *100;
        fprintf('No.%d trains has complete %8.4f %% \n', iter,percent);
    end
	a{1} = X_train(:,idxs(start_idx:end_idx));
    y = trainlabels(:, idxs(start_idx:end_idx));
    
        [a{2},z{2}] = fc(w{1},a{1});
        [a{3},z{3}] = fc(w{2},a{2});
        [a{4},z{4}] = fc(w{3}, a{3});
        [a{5},z{5}] = fc_sig(w{4},a{4});
%         [a{6},z{6}] = fc(w{5},a{5});
%         [a{7},z{7}] = fc_sig(w{6},a{6});
        
        delta{L} = (a{L} - y).* a{L} .*(1-a{L}); 
%         delta{6} = bc(w{6}, z{6}, delta{7});
%         delta{5} = bc(w{5}, z{5}, delta{6});
        delta{4} = bc(w{4}, z{4}, delta{5});
        delta{3} = bc(w{3}, z{3}, delta{4});
        delta{2} = bc(w{2}, z{2}, delta{3});
%         delta{2} = bc(w{2},z{2},delta{3});
        for l=1:L-1
            grad_w = delta{l+1} * a{l}'; 
           w{l} = w{l} - alpha*grad_w;
        end 
        J = [J 1/length(y)*sum(cost(a{L}, y))];
        acc = accuracy(a{L}, y);
        Acc =[Acc acc];
        plot(J);
        pause(0.000001);
        a{1} = X_train;

end
        fprintf('No.%d acc is %8.4f %% \n',iter, acc);
end 
figure
plot(Acc);
save model.mat w layer_size;
% check acc of both
 a{1} = X_train;
    for l = 1:L-1
      a{l+1} = fc(w{l}, a{l});
    end
    train_acc = accuracy(a{L}, trainlabels);
    fprintf('Accuracy on training dataset is %f%%\n', train_acc*100);
    % test data ACC
    a{1} = X_test;
    for i = 1:length(w)
        a{i+1} = fc(w{i},a{i});
    end
    test_acc = accuracy(a{length(w)+1},test_label);
    fprintf('Accuracy on testing dataset is %f%%\n', test_acc*100);
    ck = test_acc * 100;