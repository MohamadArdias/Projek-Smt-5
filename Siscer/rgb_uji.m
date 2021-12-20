clc; clear; close all; warning off all;

% % % Proses pengujian
% lokasi data
nama_folder = 'E:\semester 5\z-projek\progres\Projek-Smt-5\tomat 1\data uji';
% membaca file
nama_file = dir(fullfile(nama_folder, '*.jpg'));
% jumlah_file
jumlah_file = numel(nama_file);

% inilisiasi
ciri_uji = zeros(jumlah_file,3);
% mengolah citra
for n = 1:jumlah_file
    % membaca file rgb
    Img = imread(fullfile(nama_folder, nama_file(n).name));
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
    
%     figure, imshow(H)
%     figure, imshow(S)
%     figure, imshow(V)  
  
    %menghitung rata2 h,s,v
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
           
    %mengisi variable
    ciri_uji(n,1) = Red;
    ciri_uji(n,2) = Green;
    ciri_uji(n,3) = Blue;

end

% menyusun variabel kelas_uji
kelas_uji = cell(jumlah_file, 1);

% mengisi nama2 tomat pada variabel kelas_uji
for k = 1:5
    kelas_uji{k} = 'Matang';
end

for k = 6:10
    kelas_uji{k} = 'Mentah';
end

for k = 11:15
    kelas_uji{k} = 'Setengah Matang';
end

% klasifikasi citra menggunakan algoritma naive bayes
load siscer;

% membaca kelas keluaran hasil pelatihan
hasil_uji = predict(Mdl,ciri_uji);

% menghitung akurasi latih
jumlah_benar = 0;
for k = 1:jumlah_file
    if isequal(hasil_uji{k}, kelas_uji{k})
        jumlah_benar = jumlah_benar+1;
    end
end

akurasi_latih = jumlah_benar/jumlah_file*100;
