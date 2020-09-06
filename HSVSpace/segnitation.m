%1读取原图，并处理成二值图像
I=imread('caomei3.jpg');



I2=rgb2gray(I);
% R=medfilt2(I2,[3,3]);
% figure,imshow(R);title('中值滤波');
BW=imbinarize(I2,0.9);
total=bwarea(~BW);
figure,imshow(I);
figure,imshow(I2);
figure,imshow(BW);
% subplot(1,3,1),imshow(I),title('原始图像');
%  subplot(1,3,2),imshow(I2),title('灰度图像');
% subplot(1,3,3),imshow(BW),title('二值图像');
bw=edge(BW,'canny');
figure,imshow(bw);

%2进行边缘检测 得到了不连续的图形边界(采用sobel算子或区域增长)

%3得到各个图形的连续边界

SE=strel('rectangle',[1 6]);  % 结构定义
J2=imopen(BW,SE);            % 开启运算
figure,imshow(J2),title('对二值图像进行开运算后的结果图像');

SE=strel('square',6); % 定义3×3腐蚀结构元素
J=imerode(~J2,SE);
BW2=(~J2)-J;        % 检测边缘
figure,imshow(BW2),title('3*3腐蚀运算后的图像边界轮廓');

%填充了已有的检测的连续形状边界
B = imfill(BW2,'holes');
B = bwmorph(B,'remove');
figure,imshow(B),title('');
% figure,imshow(B),title('提取出的边界图像');

%3-2将不同的图形进行分别标记，num表示连接的图形对象的个数
[Label,num] = bwlabel(B,8);

%得到各个图像的边界像素的数组




%4计算各个图形单元的周长   用连接像素点或数边界像素点个数的方法   numPoints数组表示各个图形边界的像素个数（即用个数来表示周长）
 %num = max(max(Label));

    for i = 1 : num
        Premeter(i) = 0;
    end

    [row,col] = size(Label);
    for i = 1 : row
        for j = 1 : col
            if(Label(i,j) > 0)
                Premeter(Label(i,j)) = Premeter(Label(i,j)) + 1;    %计算标记后的各块图形边界中像素的个数的总数
            end
        end
    end

%5计算各个图形单元的面积
FilledLabel = imfill(Label,'holes');  %填充打过标记的边界线中间围成的图形区域
% figure,imshow(FilledLabel),title('打过标记后并已被填充的结果图像');
figure,imshow(FilledLabel),title('');
for i = 1 : num
    Area(i) = 0;
end

[row,col] = size(FilledLabel);
for i = 1 : row
    for j = 1 : col
        if(FilledLabel(i,j) > 0)
            Area(FilledLabel(i,j)) = Area(FilledLabel(i,j)) + 1;   %通过统计像素点个数的方式来求各形状的面积
        end
    end
end

%6计算各个图形单元的圆度
for i = 1 : num     
    Ecllipseratio(i) = 4*pi*Area(i)/Premeter(i)^2;
end

%7计算各个图像的颜色（色度）

HSV = rgb2hsv(I);   %转换为HSV，为后面的颜色元素的提取做准备

[row,col] = size(FilledLabel);   %统计填充后的图形中各块图形所含像素的个数的多少
MeanHue = zeros(1,num);
    for i = 1 : num
        Hue = zeros(Area(i),1);
        nPoint = 0;
        for j = 1 : row
            for k = 1 : col
                if(FilledLabel(j,k) == i)
                    nPoint = nPoint + 1;
                    Hue(nPoint,1) = HSV(j,k,1);
                end
            end
        end
        
        Hue(:,i) = sort(Hue(:,1));
        for j = floor(nPoint*0.1) : floor(nPoint*0.9)
            MeanHue(i) = MeanHue(i) + Hue(j,1);
        end
        MeanHue(i) = MeanHue(i) / (0.8*nPoint);  %计算出平均的色度值
    end


%8识别桃

%8-1构建桃的分类器，在二维特征空间对各个图像进行类别区分
pitch=0;
for i=1:num
    if(MeanHue(i)>0.5)    %分类器识别桃的准则：判断各个图形中平均色度值大于0.5的为桃
        pitch=i;
    end
end
%8-2对分出来的类别分别构建相应的图像掩膜，并用对原图的亮度图像进行掩膜操作
pitchHSV=HSV;
[row,col] = size(FilledLabel);   %统计填充后的图形中各块图形所含像素的个数的多少
%MeanHue = zeros(1,num);
        for j = 1 : row
            for k = 1 : col
                if(FilledLabel(j,k) ~=pitch)
                       pitchHSV(j,k,2)=1;
                       pitchHSV(j,k,3)=0;
                end
            end
        end
%8-3变换生成最终的结果图像，图像中显示的结果即对应分类器中指定的类别
pitchmatrix = hsv2rgb(pitchHSV);   %转换为RGB彩图，彩图中已经滤去了其余水果，只剩下桃
% figure,imshow(pitchmatrix),title('提取出的图像');
figure,imshow(pitchmatrix),title('');

