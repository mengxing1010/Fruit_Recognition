clear all;
clc;
StrOut='F:\matlabfile\GLCM\glcm_textureVerification-master\app\';
path = 'F:\matlabfile\GLCM\glcm_textureVerification-master\app\';
D = dir([path '*.jpg']);
H=dir([path '*.png']);
for i = 1:length(D)
    a = imread([path D(i).name]);
     imwrite(a,[StrOut '\' num2str(i) '.jpg']);
end
for i =1:length(H)
    a = imread([path H(i).name]);
     imwrite(a,[StrOut '\' num2str(i+length(D)) '.jpg']);
end
