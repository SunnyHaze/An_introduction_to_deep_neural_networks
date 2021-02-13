%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: Understanding Deep Neural Networks
% Teacher: Zhang Yi
% Student:马晓晨
% ID:2019141460009
%
% Lab 7 - Sequence auto-complete
%
% Task:
% Design a multi-target outputs neural network to learn to complete sequence.
% The first two items of a sequence uniquely determine the remaining four.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear workspace and close plot windows
clear;
close all;

% prepare the data set
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
x = @(s) 1 ./ (1 + exp(-s)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encode datasets
train_data = zeros(5,6,numel(train_seq));
% prepare training data
[x,y] =size(train_seq);
cnt = 1;
for i = 1:x
    for j = 1:y
        temp = train_seq{i,j};
        for k = 1:2
            train_data(int16(temp(k)) - 'A'+1,k,cnt) =1;
        end
        for k = 3:6
            train_data(int16(temp(k)) - '1'+1,k,cnt) = 1;
        end
        cnt = cnt+1;
    end
end
% prepare testing data

% choose parameters
alpha = 0.005;
% define the network architecture
n = [12,8
    13,8
    11,6
    9,6
    9,6
    9,3];

% initialize weights
try
    load model.mat
catch 
    for i = 1:6
        w{i} = 0.1 * randn(n(i,2),n(i,1));
    end
end
% train
J = [];
Acc = [];
max_iter = 200;
% loop until converge
for iter = 1:max_iter
    % for each mini-batch
    for dick = 1:20
        k = floor(rand(1,1)*20+1);
        a{1}= [train_data(:,1,k)];
        a_t{1} = [a{1}
            0
            0
            0
            0
            0
            0
            0];
        % forward computation
        for j = 1:1
           [a{j+1},z{j+1}] = fc(w{j},a_t{j});
           a_t{j+1} = [train_data(:,2,k)
               a{j+1}];
        end
        for j = 2:6
           [a{j+1},z{j+1}] = fc(w{j},a_t{j});
           a_t{j+1} = [train_data(1:3,j,k)
               a{j+1}];
        end
        target = train_data(1:3,6,k);
        delta{7} = (a{7} - target).*a{7}.*(1-a{7});
        % backward computation (need some attention here)
        for j = 6 : -1 : 4
           err = a{j}(3:5)-train_data(1:3,j,k);
           delta{j} = bc(w{j},z{j},delta{j+1},err);
        end
        for j = 3 : -1 : 2
            err = a{j}(3:7) - train_data(:,j,k);
            delta{j} = bc(w{j},z{j},delta{j+1},err);
        end
        % update weight
        for j = 1:6
            temp = a_t{j};
            grad_w = delta{j+1} * temp';
            w{j} = w{j} - alpha * grad_w;
        end
        % cost function on train batch (sums from all layers)
        for q = 2:3
            J_L{q} = 1/2 * sum((a{q}(3:7) - train_data(:,q-1,k)).^2);
        end
        for q = 4:6
            J_L{q} = 1/2 * sum((a{q}(3:5) - train_data(1:3,q-1,k)).^2);
        end
        J_L{7} = 1/2 * sum((a{7} - train_data(1:3,6,k)).^2);
        J_batch = 0.0;
        for q = 2:7
            J_batch = J_batch +  J_L{q};
        end
        J = [J J_batch];
        for q = 2:7
           a{q} = floor(a{q}+0.5);
        end
        % accuary on train batch
        for q = 2:3
            acc_t{q} = sum(abs(a{q}(3:7) - train_data(:,q-1,k)));
            if acc_t{q} > 0
                acc_t{q} = 1;
            end
        end
        
        for q = 4:6
            acc_t{q} = sum(abs(a{q}(3:5) - train_data(1:3,q-1,k)));
            if acc_t{q} > 0
                acc_t{q} = 1;
            end
        end
            acc_t{7} = sum(abs(a{7} - train_data(1:3,q-1,k)));
            if acc_t{7} > 0
                acc_t{7} = 1;
            end
       batch_Acc = 0;
        for q = 2:7
            batch_Acc = batch_Acc +  acc_t{q};
        end
        batch_Acc = 1.0-batch_Acc/6.0;
        Acc = [Acc batch_Acc];
        fprintf('Accuracy on training dataset is %f%%\n', batch_Acc*100);
    end
    % optionally you can display J and Acc on-the-fly
    plot(J,'-b');
    drawnow
end

% save model
save model.mat w n

% test
% 训练集的ACC就不是很好，调整不出一个很好的参数，希望助教老师能再给一个正确的程序吧
% test on training set
train_acc = [];

% test on testing set
test_acc = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code ABOVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% display results
fprintf('Accuracy on training dataset is %f%%\n', train_acc*100);
fprintf('Accuracy on testing dataset is %f%%\n', test_acc*100);
