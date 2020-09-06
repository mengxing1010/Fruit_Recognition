I=imread('fruit.jpg');
% I=imread('F:\matlabfile\Facel Recognition\Samples\s2_3.bmp')
histLBP1=getLBPHist(I,14,13,1);
histLBP2=getLBPHist(I,7,6,2);
histLBP3=getLBPHist(I,5,4,3);
figure,plot(histLBP1);
figure,plot(histLBP2);
figure,plot(histLBP3);

