function [mu,mask]=kmeans(ima,k)
%   功能：运用k-means算法对图像进行分割
%   输入: ima-输入的灰度图像           k-分类数
%   输出:  mu-均值类向量                mask-分类后的图像
ima=double(ima);
copy=ima;         
ima=ima(:);
mi=min(ima);      
ima=ima-mi+1;     
s=length(ima);
% 计算图像灰度直方图
m=max(ima)+1;
h=zeros(1,m);
hc=zeros(1,m);
for i=1:s
  if(ima(i)>0) h(ima(i))=h(ima(i))+1;end;
end
ind=find(h);
hl=length(ind);
% 初始化质心
mu=(1:k)*m/(k+1);
% start process
while(true)
  oldmu=mu;
  % 现有的分类  
  for i=1:hl
      c=abs(ind(i)-mu);
      cc=find(c==min(c));
      hc(ind(i))=cc(1);
  end
  %重新计算均值  
  for i=1:k, 
      a=find(hc==i);
      mu(i)=sum(a.*h(a))/sum(h(a));
  end
  if(mu==oldmu) break;end;
  end
% calculate mask
s=size(copy);
mask=zeros(s);
for i=1:s(1),
for j=1:s(2),
  c=abs(copy(i,j)-mu);
  a=find(c==min(c));  
  mask(i,j)=a(1);
end
end
mu=mu+mi-1;   
