oriImage = imread('apple.1.jpg');
grayImage = rgb2gray(oriImage);
figure;
imshow(grayImage);title('grayimage');

originalMinValue = double(min(min(grayImage)));
originalMaxValue = double(max(max(grayImage)));
originalRange = originalMaxValue - originalMinValue;

% Get a double image in the range 0 to +255
desiredMin = 0;
desiredMax = 255;
desiredRange = desiredMax - desiredMin;
dblImageS255 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;

figure;
imshow(uint8(dblImageS255));title('ablimage0-255');

% Get a double image in the range 0 to +1
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
dblImageS1 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;

figure;
imshow(dblImageS1);title('dblimage0-1');

% Another way to normalazation, which only calls MATLAB function
img3 = mat2gray(oriImage);
figure;
imshow(img3);
