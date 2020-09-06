clc;
clear all;
close all;
%% 读取图像
root='./data';
img=read_train(root);
%% 提取特征
img_feature=feature_lattice(img);
%% 构造标签
class=10;
numberpclass=500;
ann_label=zeros(class,numberpclass*class);
ann_data=img_feature;
for i=1:class
 for j=numberpclass*(i-1)+1:numberpclass*i
     ann_label(i,j)=1;
 end
end

%% 选定训练集和测试集
k=rand(1,numberpclass*class);  
[m,n]=sort(k);  
ntraindata=4500;
ntestdata=500;
train_data=ann_data(:,n(1:ntraindata));
test_data=ann_data(:,n(ntraindata+1:numberpclass*class));
train_label=ann_label(:,n(1:ntraindata));
test_label=ann_label(:,n(ntraindata+1:numberpclass*class));
%% BP神经网络创建，训练和测试
net=network_train(train_data,train_label);
predict_label=network_test(test_data,net);
%% 正确率计算
[u,v]=find(test_label==1);
label=u';
error=label-predict_label;
accuracy=size(find(error==0),2)/size(label,2)


