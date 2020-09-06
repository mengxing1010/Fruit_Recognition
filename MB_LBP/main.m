%load('D:\MatlabFiles\processing\chapter12\code\LBP\Mat\LBPMap.mat');
%I=imread('xcs-lbp3.tif');
 I=imread('fruit.jpg');
 I=rgb2gray(I);

[hist1,I_LBP1]=getMBLBPFea(I,1);
[hist2,I_LBP2]=getMBLBPFea(I,2);
[hist3,I_LBP3]=getMBLBPFea(I,3);
figure,imshow(I_LBP1,[ ]);
title('MB-LBPÍ¼Ïñ');
figure,imshow(I_LBP2,[ ]);
title('MB-LBPÍ¼Ïñ');
figure,imshow(I_LBP3,[ ]);
title('MB-LBPÍ¼Ïñ');
% figure,imhist(hist1);
figure,plot(hist2);
% figure,plot(hist3);