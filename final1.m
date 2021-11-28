clear
% menggunakan croping
Image = imread('E:\semester 5\z-projek\ff\c (10).jpg');
imageCroping = imcrop(Image,[1000 1750 800 800]);
hsvImage = rgb2hsv(imageCroping);

main = mean(mean(hsvImage));

Hue = mean(mean(hsvImage(:,:,1)));
Saturation = mean(mean(hsvImage(:,:,2)));
Value = mean(mean(hsvImage(:,:,3)));

fitur = [Hue Saturation Value];
xlswrite('fiturwarna.xls',fitur);


% % menggunakan croping
% I = imread('oppo3.jpg');
% I2 = imcrop(I,[1000 1750 800 800]);
% hsvImage = rgb2hsv(I2);
% 
% H=hsvImage(:,:,1);
% S=hsvImage(:,:,2);
% V=hsvImage(:,:,3);
% 
% subplot(2,3,1),imshow(I),title('citra asli');
% subplot(2,3,2),imshow(I2),title('citra croping');
% subplot(2,3,3),imshow(hsvImage),title('citra HSV');
% subplot(2,3,4),imshow(H),title('citra Hue');
% subplot(2,3,5),imshow(S),title('citra Saturation');
% subplot(2,3,6),imshow(V),title('citra Value');