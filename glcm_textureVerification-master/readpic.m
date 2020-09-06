AuImgList =dir(fullfile('F:\matlabfile\GLCM\glcm_textureVerification-master\app\','*.jpg'));  %把存放数据文件的目录E:/researchData/CASIAv1.0/Au下的所有jpg文件列出来，并把这些文件名的信息存放到一个变量AuImgList 中，AuImgList 是一个结构体变量数组，只要对AuImgList 进行循环就可以读取到所有文件的数据了
%如需其它图片格式支持，可以自己【重载dir()】函数，实现查找所有图片文件的功能，
%如果图片是其它路径，可以用 ["路径" ".扩展名"] 字符串来实现。
k =length(AuImgList);
for m=1:1:k
fileName=strcat('F:\matlabfile\GLCM\glcm_textureVerification-master\app\',AuImgList(m).name);  %获取图像文件的绝对路径
AuImage_data{m}=imread(fileName);  %读图像文件
AuImageGray_data{m} = rgb2gray(AuImage_data{m});%用已有的函数进行RGB到灰度图像的转换


[rows , cols , colors] = size(AuImage_data{m});%得到原来图像的矩阵的参数
MidGrayPic = zeros(rows , cols);%用得到的参数创建一个全零的矩阵，这个矩阵用来存储用下面的方法产生的灰度图像
MidGrayPic = uint8(MidGrayPic);%将创建的全零矩阵转化为uint8格式，因为用上面的语句创建之后图像是double型的


for i = 1:rows
    for j = 1:cols
        sum = 0;
        for k = 1:colors
            sum = sum + AuImage_data{m}(i , j , k) / 3;%进行转化的关键公式，sum每次都因为后面的数字而不能超过255
        end
        MidGrayPic(i , j) = sum;
    end

end


str= strcat ('F:\matlabfile\GLCM\glcm_textureVerification-master\app\', AuImgList(m).name(1:end-4) , 'apple.png') ; % 连接字符串形成生成的灰度图像的文件名，1：end-4去掉原来文件的后缀名

imwrite(MidGrayPic , str, 'png');      %写文件
end 
