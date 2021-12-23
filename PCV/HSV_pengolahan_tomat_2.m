clc; clear; close all; warning off all;

% memanggil menu "pencarian file"
[nama_file, nama_folder] = uigetfile('*.jpg');

% jika ada nama file yg dipilih maka akan mengeksekusi perintah di bawah
% ini
if ~isequal(nama_file,0)
        % membaca file rgb
    Img = imread(fullfile(nama_folder, nama_file));
    figure, imshow(Img)
    
    % rgb to grayscale
    Img_gray = rgb2gray(Img);
    figure, imshow(Img_gray)
    
    % grayscale to biner
    bw = imbinarize(Img_gray);
    figure, imshow(bw)

    % operasi komplemen
    bw = imcomplement(bw);
    figure, imshow(bw)
    
    % morfologi filling holes
    bw = imfill(bw,'holes');
    figure, imshow(bw)
    
    % ekstraksi ciri
    
    %RGB to HSV
    HSV = rgb2hsv(Img);
    figure, imshow(HSV)

    % ekstrak H S V
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
       
    %mengubah background menjadi 0
    H(~bw) = 0;
    S(~bw) = 0;
    V(~bw) = 0;
    
%     figure, imshow(H)
%     figure, imshow(S)
%     figure, imshow(V)
    
    %menghitung rata2 h,s,v
    Hue = sum(sum(H))/sum(sum(bw));
    Saturation = sum(sum(S))/sum(sum(bw));
    Value = sum(sum(V))/sum(sum(bw));
    
    %mengisi variable
    ciri_uji(1,1) = Hue;
    ciri_uji(1,2) = Saturation;
    ciri_uji(1,3) = Value;
    
    % klasifikasi citra menggunakan algoritma naive bayes
    load Mdl;

    % membaca kelas keluaran hasil pelatihan
    hasil_uji = predict(Mdl,ciri_uji);
    
    % menampilkan citra asli dan kelas keluaran hasil pengujian
    figure, imshow(Img)
    title ({['Nama File: ', nama_file], ['Hasil Klasifikasi: ', hasil_uji{1}]})
else
%     jika tidak ada nama file yg dipilih maka akan kembali
    return
end




