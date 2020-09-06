clear all;
clc;
for i=1:55
    A=imread('F:\matlabfile\GLCM\glcm_textureVerification-master\Bananas\banana (i).jpg');
% imshow(A);
A_gray=rgb2gray(A);
% figure,imshow(A_gray);
imwrite(A_gray,'F:\matlabfile\GLCM\glcm_textureVerification-master\Bananas\banana.i.png');
end
