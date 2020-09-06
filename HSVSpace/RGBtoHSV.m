caomei=imread('D:\MatlabFiles\Final_Fruit_Recognition\TrainDatas\36.png');
% apple=imread('apple.1.jpg');
% chengzi=imread('chengzi.jpg');
% subplot(2,3,1);imshow(caomei);title('RGB-Picture');
% subplot(2,3,2);imshow(apple);title('RGB-Picture');
% subplot(2,3,3);imshow(chengzi);title('RGB-Picture');


HSVcaomei=rgb2hsv(caomei);
% HSVapple=rgb2hsv(apple);
% HSVchengzi=rgb2hsv(chengzi);
% subplot(2,3,4);imshow(HSVcaomei);title('HSV-Picture');
% subplot(2,3,5);imshow(HSVapple);title('HSV-Picture');
% subplot(2,3,6);imshow(HSVchengzi);title('HSV-Picture');

imshow(HSVcaomei);




