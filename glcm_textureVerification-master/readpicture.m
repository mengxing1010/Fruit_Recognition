file_path='F:\matlabfile\Final_Fruit_Recognition\glcm_textureVerification-master\ImageDataSet\';
img_path_list=dir(strcat(file_path,'*.png'));
img_num=length(img_path_list);
I=cell(1,img_num);
if img_num>0
    for j=1:img_num
        image_name=img_path_list(j).name;
        image=imread(strcat(file_path,image_name));
        I{j}=image;
        fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));
    end
end