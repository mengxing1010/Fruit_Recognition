I=imread('chengzi.jpg');
sopt=fspecial('sobel');
% 计算R、G、B、对x y的偏导
Rx=imfilter(double(I(:,:,1)),sopt,'replicate');
Ry=imfilter(double(I(:,:,1)),sopt','replicate');
Gx=imfilter(double(I(:,:,2)),sopt,'replicate');
Gy=imfilter(double(I(:,:,2)),sopt','replicate');
Bx=imfilter(double(I(:,:,3)),sopt,'replicate');
By=imfilter(double(I(:,:,3)),sopt','replicate');
% 计算点积gxx,gyy,gxy
gxx=Rx.^2+Gx.^2+Bx.^2;
gxy=Rx.*Ry+Gx.*Gy+Bx.*By;
gyy=Ry.^2+Gy.^2+By.^2;

% 计算变化率最大的角度
theta=0.5*(atan(2*gxy./(gxx-gyy+eps)));
G1=0.5*((gxx+gyy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));

theta=theta+pi/2;
G2=0.5*((gxx+gxy)+(gxx-gyy).*cos(2*theta)+2*gxy.*sin(2*theta));
G1=G1.^0.5;
G2=G2.^0.5;
% 得到梯度向量
gradiant=mat2gray(max(G1,G2));

figure,imshow(I);
figure,imshow(gradiant);