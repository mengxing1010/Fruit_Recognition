clc;clear;close all;
rgb1=imread('F:\matlabfile\Final_Fruit_Recognition\TrainDatas\apples.jpg');
rgb2=imread('F:\matlabfile\Final_Fruit_Recognition\TrainDatas\fruit.jpg');
rgb3=imread('F:\matlabfile\Final_Fruit_Recognition\TrainDatas\lemon.jpg');

h1=getHsvHist(rgb1);
h2=getHsvHist(rgb2);
h3=getHsvHist(rgb3);

% h2=hsvHist(rgb);
figure,
subplot(3,1,1)
bar(h1),
% title('苹果HSV非均匀量化直方图');
ylabel('像素的个数');xlabel('苹果HSV非均匀量化直方图');

subplot(3,1,2)
bar(h2),
% title('草莓HSV非均匀量化直方图');
ylabel('像素的个数');xlabel('草莓HSV非均匀量化直方图');

subplot(3,1,3)
bar(h3),
% title('柠檬HSV非均匀量化直方图');
ylabel('像素的个数');xlabel('柠檬HSV非均匀量化直方图');
toc;
disp(['运行时间: ',num2str(toc)]);