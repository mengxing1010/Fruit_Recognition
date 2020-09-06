clear all;
close all;
clc;
%% Implement the GLCM and Entropy for all the images.
prefix = {'Bark' };
feature_label=zeros(9,9);
    for i=1:1
        for   j=1:9
            fn = sprintf ( '%s.%d.png', prefix{i},j );
            img = imread(fn);
           [GLCMS,SI]=graycomatrix(img,'GrayLimits',[],'Offset',[0 1;-1 1;0 -1;-1 -1]);
           P=GLCMS;
           [kk,ll,mm]=size(P);
       for n = 1:mm
            P(:,:,n) = P(:,:,n)/sum(sum(P(:,:,n)));
       end
        end
H = zeros(1,mm);
I = H;
Ux = H;      Uy = H;
deltaX= H;  deltaY = H;
C =H;
       for n = 1:mm
    E(n) = sum(sum(P(:,:,n).^2)); %能量
       end
       
        end
    
    
    
sprintf('0,45,90,135方向上的能量依次为： %f, %f, %f, %f, %f, %f, %f, %f, %f',E(1),E(2),E(3),E(4),E(5),E(6),E(7),E(8),E(9))  % 输出数据;