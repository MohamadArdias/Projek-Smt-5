% menggunakan croping

I = imread('oppo.jpg');
J = imread('oppo2.jpg');
K = imread('oppo3.jpg');

I2 = imcrop(I,[1000 1600 1000 1000]);
J2 = imcrop(J,[1000 1600 1000 1000]);
K2 = imcrop(K,[1000 1600 1000 1000]);

hsvImage = rgb2hsv(I2);
hsvImage2 = rgb2hsv(J2);
hsvImage3 = rgb2hsv(K2);

% halo = hsvImage(:, :, 3);

subplot(2,3,1),imshow(hsvImage),title('citra asli');
subplot(2,3,2),imshow(hsvImage2),title('citra asli');
subplot(2,3,3),imshow(hsvImage3),title('citra asli');

subplot(2,3,4),imhist(hsvImage),title('citra asli');
subplot(2,3,5),imhist(hsvImage2),title('citra asli');
subplot(2,3,6),imhist(hsvImage3),title('citra asli');



% I = imread('ds.jpg');
% J = imread('ds2.jpg');
% K = imread('ds3.jpg');
% 
% I2 = imcrop(I,[20 20 60 60]);
% J2 = imcrop(J,[20 20 60 60]);
% K2 = imcrop(K,[20 20 60 60]);
% 
% hsvImage = rgb2hsv(I2);
% hsvImage2 = rgb2hsv(J2);
% hsvImage3 = rgb2hsv(K2);
% 
% subplot(2,3,1),imshow(hsvImage),title('citra asli');
% subplot(2,3,2),imshow(hsvImage2),title('citra asli');
% subplot(2,3,3),imshow(hsvImage3),title('citra asli');
% 
% subplot(2,3,4),imhist(hsvImage),title('citra asli');
% subplot(2,3,5),imhist(hsvImage2),title('citra asli');
% subplot(2,3,6),imhist(hsvImage3),title('citra asli');



% I = imread('oppo.jpg');
% J = imread('oppo2.jpg');
% K = imread('oppo3.jpg');
% 
% I2 = imcrop(I,[60 60 60 60]);
% J2 = imcrop(J,[20 20 60 60]);
% K2 = imcrop(K,[20 20 60 60]);
% 
% subplot(2,3,1),imshow(I),title('citra asli');
% subplot(2,3,2),imshow(J),title('citra asli');
% subplot(2,3,3),imshow(K),title('citra asli');
% 
% subplot(2,3,4),imshow(I2),title('citra asli');
% subplot(2,3,5),imshow(J2),title('citra asli');
% subplot(2,3,6),imshow(K2),title('citra asli');
