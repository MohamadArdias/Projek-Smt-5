% Tanpa Croping

I = imread('oppo.jpg');
J = imread('oppo2.jpg');
K = imread('oppo3.jpg');
% I2 = imcrop(I,[1000 1600 1000 1000]);
% 
% subplot(2,2,1),imshow(I),title('citra asli'); 
% subplot(2,2,2),imshow(I2),title('citra hasil'); 

hsvImage = rgb2hsv(I);
hsvImage2 = rgb2hsv(J);
hsvImage3 = rgb2hsv(K);

subplot(2,3,1),imshow(hsvImage),title('citra asli');
subplot(2,3,2),imshow(hsvImage2),title('citra asli');
subplot(2,3,3),imshow(hsvImage3),title('citra asli');

subplot(2,3,4),imhist(hsvImage),title('citra asli');
subplot(2,3,5),imhist(hsvImage2),title('citra asli');
subplot(2,3,6),imhist(hsvImage3),title('citra asli');