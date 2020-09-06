function feature = feature_lattice(img)
% 输入:黑底白字的二值图像。输出：35维的网格特征
% ======提取特征，转成5*7的特征矢量,把图像中每10*10的点进行划分相加，进行相加成一个点=====%
%======即统计每个小区域中图像象素所占百分比作为特征数据====%
for i=1:length(img);
bw2=im2bw(img{i},graythresh(img{i}));
bw_7050=imresize(bw2,[70,50]);
for cnt=1:7
    for cnt2=1:5
        Atemp=sum(bw_7050(((cnt*10-9):(cnt*10)),((cnt2*10-9):(cnt2*10))));%10*10box
        lett((cnt-1)*5+cnt2)=sum(Atemp);
    end
end
lett=((100-lett)/100);
lett=lett';
feature(:,i)=lett;
end