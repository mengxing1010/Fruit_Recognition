
clear all;clc;
 
ImagePath='F:\matlabfile\Final_Fruit_Recognition\glcm_textureVerification-master\Apples\';
Images = dir([ImagePath, '*png']);
PictureNums = length(Images);
FitureNums = 8;
gray_comatrix=zeros(PictureNums,FitureNums);
label_features=zeros(4,21);
 
for i=1:PictureNums
%     i
    name = Images(i).name;
    I=imread([ImagePath,name]);
%     I=im2double(I);
%    H=rgb2gray(I);
    
    H=graycomatrix(I,'GrayLimits',[],'NumLevels', FitureNums,'Offset',[0 1]);%得到灰度共生矩阵
    
    stats=graycoprops(H,'all');
    %能量
    Energy = [];
    Energy= [Energy,stats.Energy];
    Energy=mean(Energy);
    %对比度
    Contrast=[];
    Contrast=[Contrast,stats.Contrast];
    Contrast=mean(Contrast);
    %相关性
    Correlation=[];
    Correlation=[Correlation,stats.Correlation];
    Correlation=mean(Correlation);
%     %差异性
%     Dissimilarity=[];
% %     Dissimilarity=[Dissimilarity,stats.Dissimilarity];
%     Dissimilarity=mean(Dissimilarity);
%     %熵值
%     Entropy=[];
% %     Entropy=[Entropy,stats.Entropy];
%     Entropy=mean(Entropy);
    %齐次性
    Homogeneity=[];
    Homogeneity=[Homogeneity,stats.Homogeneity];
    Homogeneity=mean(Homogeneity);
%     %中值
%     Mean=[];
% %     Mean=[Mean,stats.Mean];
%     Mean=mean(Mean);
%     %协方差
%     Variance=[];
% %     Variance=[Variance,stats.Variance];
%     Variance=mean(Variance);
  


    
    
    %     gray_comatrix(i,1)=Energy;
    %     gray_comatrix(i,2)=Contrast;
    %     gray_comatrix(i,3)=Correlation;
    %     gray_comatrix(i,4)=Dissimilarity;
    %     gray_comatrix(i,5)=Entropy;
    %     gray_comatrix(i,6)=Homogeneity;
    %     gray_comatrix(i,7)=Mean;
    %     gray_comatrix(i,8)=Variance;
    
    %类别标签
    if(name(1)=='C')
        label = 1;
    else
        label = 0;
    end
%     label_features(1,i) = label;
    label_features(1,1)=0;
    label_features(2,1)=45;
    label_features(3,1)=90;
    label_features(4,1)=135;
    label_features(1,i+1) = Energy;%能量
    label_features(2,i+1) = Contrast;%对比度
    label_features(3,i+1) = Correlation;%互相关
%     label_features(i,5) = Dissimilarity;
%     label_features(i,6) = Entropy;%熵值
    label_features(4,i+1) = Homogeneity; %齐次性
%     label_features(i,8) = Mean;
%     label_features(i,9) = Variance;
end
 
% save('mat文件名', '变量名') 
save('label_features', 'label_features');
