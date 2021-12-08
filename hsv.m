clc; clear; close all; warning off all;



% membaca file rgb
%     Img = imread(fullfile(nama_folder, nama_file(n).name));
    Img = imread('matang (11).jpg');
    figure, imshow(Img)
    
    %croping
    rgbImage = imcrop(Img,[1300 1000 1500 1500]);
    figure, imshow(rgbImage)
  
    % ekstraksi ciri
    % RGB to HSV
    HSV = rgb2hsv(rgbImage);
    figure, imshow(HSV)
    
    % ekstrak R G B
    H = mean(mean(HSV(:,:,1)));
    S = mean(mean(HSV(:,:,2)));
    V = mean(mean(HSV(:,:,3))); 