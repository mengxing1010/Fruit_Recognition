function vec = getHsvHist(Image)
[M,N,O] = size(Image);
if O~= 3
    error('3 components are needed for histogram');
end
[h,s,v] = rgb2hsv(Image);
H = h; S = s; V = v;
% h = h*360;

%将hsv空间非等间隔量化：
%  h量化成16级；
%  s量化成4级；
%  v量化成4级；
for i = 1:M
    for j = 1:N
        if h(i,j)<=0.1||h(i,j)>0.95
            H(i,j) = 0;
        end
        if h(i,j)<=0.15&&h(i,j)>0.1
            H(i,j) = 1;
        end
        if h(i,j)<=0.2&&h(i,j)>0.15
            H(i,j) = 2;
        end
        if h(i,j)<=0.45&&h(i,j)>0.2
            H(i,j) = 3;
        end
        if h(i,j)<=0.7&&h(i,j)>0.45
            H(i,j) = 4;
        end
        if h(i,j)<=0.75&&h(i,j)>0.7
            H(i,j) = 5;
        end
        if h(i,j)<=0.8&&h(i,j)>0.75
            H(i,j) = 6;
        end
        if h(i,j)<=0.95&&h(i,j)>0.8
            H(i,j) = 7;
        end
%         if h(i,j)<=190&&h(i,j)>165
%             H(i,j) = 8;
%         end
%         if h(i,j)<=220&&h(i,j)>190
%             H(i,j) = 9;
%         end
%         if h(i,j)<=255&&h(i,j)>220
%             H(i,j) = 10;
%         end
%         if h(i,j)<=275&&h(i,j)>255
%             H(i,j) = 11;
%         end
%         if h(i,j)<=290&&h(i,j)>275
%             H(i,j) = 12;
%         end
%         if h(i,j)<=316&&h(i,j)>290
%             H(i,j) = 13;
%         end
%         if h(i,j)<=330&&h(i,j)>316
%             H(i,j) = 14;
%         end
%         if h(i,j)<=345&&h(i,j)>330
%             H(i,j) = 15;
%         end
    end
end
for i = 1:M
    for j = 1:N
        if s(i,j)<=0.2&&s(i,j)>0
            S(i,j) = 0;
        end
        if s(i,j)<=0.7&&s(i,j)>0.2
            S(i,j) = 1;
        end
        if s(i,j)<=1&&s(i,j)>0.7
            S(i,j) = 2;
        end
%         if s(i,j)<=1&&s(i,j)>0.75
%             S(i,j) = 3;
%         end
    end
end
for i = 1:M
    for j = 1:N
        if v(i,j)<=0.4&&v(i,j)>0
            V(i,j) = 0;
        end
        if v(i,j)<=0.8&&v(i,j)>0.4
            V(i,j) = 1;
        end
        if v(i,j)<=1&&v(i,j)>0.8
            V(i,j) = 2;
        end
%         if v(i,j)<=1&&v(i,j)>0.75
%             V(i,j) = 3;
%         end
    end
end

%将三个颜色分量合成为一维特征向量：L = H*Qs*Qv+S*Qv+v；Qs,Qv分别是S和V的量化级数, L取值范围[0,71]
%取Qs = 3; Qv = 3
L=zeros(M,N);
for  i = 1:M
    for j = 1:N
        L(i,j) = H(i,j)*9+S(i,j)*3+V(i,j);
    end
end
%计算L的直方图
Hist=zeros(1,72);
for i = 0:72
    Hist(i+1) = size(find(L==i),1);
end
vec=Hist';