function net = network_train(train_data,train_label )
% 输入：训练图像特征和label。输出：训练好的神经网络

% BP网络训练
% 初始化网络结构
layer=25;
net=newff(train_data,train_label,layer);
net.trainParam.epochs=1;
net.trainParam.lr=0.1;
net.trainParam.goal=0.001;
net.trainFcn='trainrp';
% 网络训练
net=train(net,train_data,train_label);
end

