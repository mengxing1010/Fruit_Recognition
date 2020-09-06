I=imread('Lena.jpg');
gray=rgb2gray(I);
GS=graycomatrix(gray,'NumLevels',256);%水平位置算子计算共生矩阵
GSn=GS/sum(GS(:));%归一化矩阵
stats=graycoprops(GS,'all');%共生矩阵的描述子
maxProbability=max(GSn(:));%最大概率
corr=stats.Correlation;%相关
contrast=stats.Contrast;%对比度
energy=stats.Energy;%能量
hom=stats.Homogeneity;%同质
for J=1:size(GSn,1)
sumcols(J)=sum(-GSn(J,1:end).*log2(GSn(J,1:end)+eps));
end
entropy=sum(sumcols);%熵
Y=[maxProbability,corr,contrast,energy,hom,entropy];
