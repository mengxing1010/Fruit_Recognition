clear all;
clc;
gray = [1 1 5 6 8
    2 3 5 7 1
    4 5 7 1 2
    8 5 1 2 5];
offsets = [0 1;-1 1;-1 0;-1 -1];
m = 3; % 3阶灰度级
[GLCMS,SI] = graycomatrix(gray,'GrayLimits',[],'Of',offsets,'NumLevels',m);
P = GLCMS;
[kk,ll,mm] = size(P);
% 对共生矩阵归一化
%---------------------------------------------------------
for n = 1:mm
    P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));
end
 
%-----------------------------------------------------------
%对共生矩阵计算能量、熵、惯性矩、相关4个纹理参数
%-----------------------------------------------------------
H = zeros(1,mm);
I = H;
Ux = H;      Uy = H;
deltaX= H;  deltaY = H;
C =H;
for n = 1:mm
    E(n) = sum(sum(P(:,:,n).^2)); %能量
    for i = 1:kk
        for j = 1:ll
            if P(i,j,n)~=0
                H(n) = -P(i,j,n)*log(P(i,j,n))+H(n); %熵
            end
            I(n) = (i-j)^2*P(i,j,n)+I(n);  %惯性矩
 
            Ux(n) = i*P(i,j,n)+Ux(n); %相关性中μx
            Uy(n) = j*P(i,j,n)+Uy(n); %相关性中μy
        end
    end
end
for n = 1:mm
    for i = 1:kk
        for j = 1:ll
            deltaX(n) = (i-Ux(n))^2*P(i,j,n)+deltaX(n); %相关性中σx
            deltaY(n) = (j-Uy(n))^2*P(i,j,n)+deltaY(n); %相关性中σy
            C(n) = i*j*P(i,j,n)+C(n);
        end
    end
    C(n) = (C(n)-Ux(n)*Uy(n))/deltaX(n)/deltaY(n); %相关性
end
%--------------------------------------------------------------------------
%求能量、熵、惯性矩、相关的均值和标准差作为最终8维纹理特征
%--------------------------------------------------------------------------
a1 = mean(E)
b1 = sqrt(cov(E))
 
a2 = mean(H)
b2 = sqrt(cov(H))
 
a3 = mean(I)
b3 = sqrt(cov(I))
 
a4 = mean(C)
b4 = sqrt(cov(C))
 
sprintf('0,45,90,135方向上的能量依次为： %f, %f, %f, %f',E(1),E(2),E(3),E(4))  % 输出数据;
sprintf('0,45,90,135方向上的熵依次为： %f, %f, %f, %f',H(1),H(2),H(3),H(4))  % 输出数据;
sprintf('0,45,90,135方向上的惯性矩依次为： %f, %f, %f, %f',I(1),I(2),I(3),I(4))  % 输出数据;
sprintf('0,45,90,135方向上的相关性依次为： %f, %f, %f, %f',C(1),C(2),C(3),C(4))  % 输出数据;
