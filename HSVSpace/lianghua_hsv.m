clc;clear;close all;
apples_rgb=imread('apples.jpg');
h1=getHsvHist(apples_rgb);
fruit_rgb=imread('fruit.jpg');
h2=getHsvHist(fruit_rgb);
ningmeng_rgb=imread('ningmeng.jpg');
h3=getHsvHist(ningmeng_rgb);
% h2=hsvHist(rgb);

figure,
subplot(3,1,1);
bar(h1),
% title('苹果HSV非均匀量化直方图','FontName','宋体','FontSize',10);
ylabel('像素的个数','FontName','宋体','FontSize',10);
xlabel('苹果HSV非均匀量化后灰度级','FontName','黑体','FontSize',10);
% set(gca,'FontName','Times New Roman','FontSize',6);
subplot(3,1,2);
bar(h2),
% title('草莓HSV非均匀量化直方图','FontName','宋体','FontSize',10);
ylabel('像素的个数','FontName','宋体','FontSize',10);
xlabel('草莓HSV非均匀量化后灰度级','FontName','黑体','FontSize',10);
% set(gca,'FontName','Times New Roman','FontSize',6);
subplot(3,1,3);
bar(h3),
% title('柠檬HSV非均匀量化直方图','FontName','宋体','FontSize',10);
ylabel('像素的个数','FontName','宋体','FontSize',10);
xlabel('柠檬HSV非均匀量化后灰度级','FontName','黑体','FontSize',10);
% set(gca,'FontName','Times New Roman','FontSize',6);
