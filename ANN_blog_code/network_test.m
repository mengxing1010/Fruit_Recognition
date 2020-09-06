function out = network_test(test_data,net)
% 输入：测试数据的特征和真值。输出：测试数据的label以及误差图
% BP网络预测

an=sim(net,test_data);
for i=1:length(test_data)
    out(i)=find(an(:,i)==max(an(:,i)));
end

end

