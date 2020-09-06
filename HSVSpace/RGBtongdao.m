I=imread('apples.jpg');
J=imread('fruit.jpg');
K=imread('ningmeng.jpg');


apples_R=I(:,:,1);
apples_G=I(:,:,2);
apples_B=I(:,:,3);


fruit_R=J(:,:,1);
fruit_G=J(:,:,2);
fruit_B=J(:,:,3);

ningmeng_R=K(:,:,1);
ningmeng_G=K(:,:,2);
ningmeng_B=K(:,:,3);
subplot(3,3,1),imhist(apples_H);title('苹果R通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,2),imhist(apples_S);title('苹果G通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,3),imhist(apples_V);title('苹果B通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,4),imhist(fruit_H);title('草莓R通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,5),imhist(fruit_S);title('草莓G通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,6),imhist(fruit_V);title('草莓B通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,7),imhist(ningmeng_H);title('柠檬R通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,8),imhist(ningmeng_S);title('柠檬G通道');
xlabel({' ','像素级'});ylabel('像素出现次数');
subplot(3,3,9),imhist(ningmeng_V);title('柠檬B通道');
xlabel({' ','像素级'});ylabel('像素出现次数');