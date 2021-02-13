function ck= check()
    try
    load model.mat
    load test_1024.mat
    load train_1024.mat
    % training data ACC
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
end