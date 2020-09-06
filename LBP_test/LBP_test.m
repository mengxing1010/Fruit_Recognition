clear all;
clc;
 Img=imread('36.png');  
%Img=imread('D:\MatlabFiles\FacelRecognition\Samples\s2_3.bmp');  
% I=rgb2gray(Img);  
I=Img;
mapping=getmapping(8,'u2');   
H1=lbp(I,2,8,mapping,'h'); %LBP histogram in (8,1) neighborhood  
                                 %using uniform patterns  
% subplot(2,1,1);
figure,stem(H1);  
xlabel('草莓LBP值');ylabel('像素的个数');
% H2=lbp(I);  
% subplot(2,1,2),stem(H2);  
  
SP=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];  
I2=lbp(I,SP,0,'i'); %LBP code image using sampling points in SP  
                          %and no mapping. Now H2 is equal to histogram of I2.  
% show the images  
figure, imshow(I);  
title('Input Image');  
figure, imshow(I2);  
title('Result of LBP');  
