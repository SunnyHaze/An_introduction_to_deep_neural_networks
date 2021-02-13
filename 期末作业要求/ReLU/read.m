clear;
clc;
%read in the files
try 
    load train_1024.mat
catch
    load train_32x32.mat
    % train_data
    train_size = length(X);
    test_data = ones(32,32,train_size);
    for i=1:length(X)
        test_data(:,:,i) = rgb2gray(X(:,:,:,i));
    end
    test_data = test_data / 255;
    imshow(test_data(:,:,2));
    X_train = reshape(test_data,32*32, train_size);
    % train_label
    trainlabel_size = length(y);
    trainlabels = zeros(10,trainlabel_size);
    for i = 1:trainlabel_size
        temp = y(i,1);
        trainlabels(temp,i) = 1;
    end
    save train_1024.mat X_train train_size trainlabels
end
clc;
clear;
try 
    load test_1024.mat
catch
    load test_32x32.mat
    % test_data
    test_size = length(X);
    test_data = ones(32,32,test_size);
    for i=1:length(X)
        test_data(:,:,i) = rgb2gray(X(:,:,:,i));
    end
    test_data = test_data / 255;
    X_test = reshape(test_data,32*32, test_size); 
    
     % test_label
    testlabel_size = length(y);
    test_label = zeros(10,testlabel_size);
    for i = 1:testlabel_size
        temp = y(i,1);
        test_label(temp,i) = 1;
    end
    save test_1024.mat X_test test_size test_label
end
clc;

try 
    load extra_1024.mat
catch
    fprintf('transform extra.');
    load extra_32x32.mat
    % test_data
    train_size = length(X);
    test_data = ones(32,32,train_size);
    for i=1:length(X)
        test_data(:,:,i) = rgb2gray(X(:,:,:,i));
    end
    test_data = test_data / 255;
    imshow(test_data(:,:,2));
    X_train = reshape(test_data,32*32, train_size);
    % train_label
    trainlabel_size = length(y);
    trainlabels = zeros(10,trainlabel_size);
    for i = 1:trainlabel_size
        temp = y(i,1);
        trainlabels(temp,i) = 1;
    end
    save( 'extra_1024.mat','X_train','train_size','trainlabels','-v7.3'); 
end

