%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course:  Understanding Deep Neural Networks
% Teacher: Zhang Yi
% Student: 马晓晨
% ID:2019141460009
%
% Lab 5 - Handwritten Digit to Speech Convertor
%
% Task: Design and train a neural netowrk to produce
%       standard speech according to input
%       handwritten digits in images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear workspace and close plot windows
clear;
close all;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code BELOW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% prepare the data set
load mnist_small_matlab.mat
% trainData: a matrix with size of 28x28x10000   
% trainLabels: a matrix with size of 10x10000
% testData: a matrix with size of 28x28x2000
% testLabels: a matrix with size of 10x2000
try
    load model.mat
catch
    fprintf('没有文件！');
end
% w  
% layer_size
% acc
train_size = 10000;
X_train = reshape(trainData,784,train_size);
test_size = 2000;
X_test = reshape(testData,784,test_size);

% prepare standard speech audio
cur_path = mfilename('fullpath');
temp = strfind(cur_path,'\');
length(temp);
cur_path = cur_path(1:temp(length(temp)));
cur_path =[cur_path 'audio\'];
files = dir(cur_path);
y{10}=[];
fs{10}=[];
for i = 3:12
  infile = [cur_path,files(i).name];
  [y{i-2},fs{i-2}] = audioread(infile);
end
sound(y{1},fs{1}); %% y{1}is for audio of zero, and so on.

% choose parameters
L = 5;
alpha = 0.005;
x = @(s) 1 ./ (1 + exp(-s)); 

% define network architecture
layer_size = [784
              256
              128
              64
              10];
% initialize weights
Acc = [];

    for i = 1:L-1
        w{i} = 0.1 * randn(layer_size(i+1,1),layer_size(i,1));
    end
    J = []; 

    max_epoch = 25;
    mini_batch = 100; 
    figure
    acc =0;
    times = 0;

% train

while acc < 0.98
    idxs = randperm(train_size);
    fprintf(['start time ',num2str(times),' with acc:',num2str(acc),'\n']);
    times = times + 1;
    for k =1:ceil(train_size/mini_batch)
        start_idx = (k-1)* mini_batch +1;
        end_idx = min(k* mini_batch, train_size);
%         fprintf('start_idx is %d\n',start_idx);
%         fprintf('end_idx is %d\n', end_idx);
        a{1} = X_train(:,idxs(start_idx:end_idx));
        target = trainLabels(:,idxs(start_idx:end_idx));
        
        for q = 1:L-1
            [a{q+1},z{q+1}] = fc(w{q},a{q},x);
        end
        delta{L} = (a{L}-target).*a{L}.*(1-a{L});
        for q = L-1:-1:2
            delta{q} = bc(w{q},z{q},delta{q+1});
        end
        
        for q = 1:L-1
            grad_w = delta{q+1}*a{q}';
            w{q} = w{q} - alpha* grad_w;
        end
        J = [J 1/mini_batch*sum(1/2 * sum((a{L} - target).^2))];
        
        mini_batch = size(a{L}, 2);
        [~,idx_a] = max(a{L});
        [~,idx_y] = max(target);
        acc = sum(idx_a==idx_y) / mini_batch;
        Acc =[Acc acc]; 
    end
end
plot(Acc);
% save model
save model.mat w layer_size acc
% display/listen to some results pairs
data = input('请输入测试集中的第n条784维向量,最大为2000：');
while data ~= 0 
    outlabel = find(testLabels(:,data)==1)-1;
    image_buff = testData(:,:,data);
    subplot(1,1,1);
    imshow((image_buff));
    sound(y{outlabel+1},fs{outlabel+1});
    fprintf(['mnist的第',num2str(data),'数值为',num2str(outlabel)]);
    data = input('请输入测试集中的第n条784维向量，最大为2000：');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your code ABOVE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
