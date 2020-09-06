clear all;
clc;
ImagePath='F:\matlabfile\GLCM\glcm_textureVerification-master\Data1\';  %数据集路径
Images=dir([ImagePath,'*.png']);%数据集里的图像
PictureNums=length(Images);%图像个数
FitureNums=8;
gray_comatrix=zeros(PictureNums,FitureNums);%返回一个9*8零矩阵
label_features=zeros(PictureNums,FitureNums+1);
for i=1:PictureNums
    name=Images(i).name;
    I=imread([ImagePath,name]);
   [GLCMS,SI]=graycomatrix(I,'GrayLimits',[],'NumLevels',FitureNums,'Offset',[0 1;-1 1;0 -1;-1 -1]);%提取灰度矩阵
   H=GLCMS;
   [kk,ll,mm]=size(H);
    
    
   
%     stats=graycoprops(H,'all');
%     %能量
%     Energy=[];
%     Energy=[Energy,stats.Energy];
end