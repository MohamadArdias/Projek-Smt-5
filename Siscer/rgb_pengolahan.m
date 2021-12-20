clc; clear; close all; warning off all;

% memanggil menu "pencarian file"
[nama_file, nama_folder] = uigetfile('*.jpg');

% jika ada nama file yg dipilih maka akan mengeksekusi perintah di bawah
% ini
if ~isequal(nama_file,0)
        % membaca file rgb
    Img = imread(fullfile(nama_folder, nama_file));
%     figure, imshow(Img)
    
    % rgb to grayscale
    Img_gray = rgb2gray(Img);
%     figure, imshow(Img_gray)
    
    % grayscale to biner
    bw = imbinarize(Img_gray);
%     figure, imshow(bw)

    % operasi komplemen
    bw = imcomplement(bw);
%     figure, imshow(bw)
    
    % morfologi filling holes
    bw = imfill(bw,'holes');
%     figure, imshow(bw)
    
    % ekstraksi ciri
    
    % ekstrak H S V
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
    
    %mengubah background menjadi 0
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
    
    %menghitung rata2 h,s,v
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
           
    %mengisi variable
    ciri_uji(1,1) = Red;
    ciri_uji(1,2) = Green;
    ciri_uji(1,3) = Blue;
    
    % klasifikasi citra menggunakan algoritma naive bayes
    load siscer;

    % membaca kelas keluaran hasil pelatihan
    hasil_uji = predict(Mdl,ciri_uji);
    
    % menampilkan citra asli dan kelas keluaran hasil pengujian
    figure, imshow(Img)
    title ({['Nama File: ', nama_file], ['Hasil Klasifikasi: ', hasil_uji{1}]})
else
%     jika tidak ada nama file yg dipilih maka akan kembali
    return
end




