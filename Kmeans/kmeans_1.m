clear;
clc;
ima=imread('pic.jpg');
%ima=rgb2gray(imread('pic.jpg'));
imshow(ima);
 k=4;
[mu,mask]=kmeans(ima,k);

figure,imshow(mask,[]);

% title('k=3');