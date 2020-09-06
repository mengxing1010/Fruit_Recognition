clc,clear
I=imread('apples.jpg');
I=rgb2gray(I);
imshow(I);
%输出直方图
figure;imhist(I);
%人工选定阈值进行分割，选择阈值为120
[width,height]=size(I);
T1=120;
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            BW1(i,j)=0;
        else 
            BW1(i,j)=1;
        end
    end
end
figure;imshow(BW1),title('人工阈值进行分割');
%自动选择阈值
T2=graythresh(I);

BW2=im2bw(I,0.9);%Otus阈值进行分割
figure;imshow(BW2),title('Otus阈值进行分割'); 
bw=edge(BW2,'canny');
figure,imshow(bw);