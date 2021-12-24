clc; clear; close all; warning off all;

% % % Proses Latih
% lokasi data
nama_folder = 'E:\semester 5\z-projek\progres\Projek-Smt-5\tomat 1\data latih';
% membaca file
nama_file = dir(fullfile(nama_folder, '*.jpg'));
% jumlah_file
jumlah_file = numel(nama_file);

% inilisiasi
ciri_latih = zeros(jumlah_file,3);
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
    
    % ekstrak R G B
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
%     figure, imshow(R)
%     figure, imshow(G)
%     figure, imshow(B)

    %mengubah background menjadi 0
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
        
    %menghitung rata2 h,s,v
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
           
    %mengisi variable
    ciri_latih(n,1) = Red;
    ciri_latih(n,2) = Green;
    ciri_latih(n,3) = Blue;

end

% menyusun variabel kelas_latih
kelas_latih = cell(jumlah_file, 1);

% mengisi nama2 tomat pada variabel kelas_latih
for k = 1:35
    kelas_latih{k} = 'Matang';
end

for k = 36:80
    kelas_latih{k} = 'Mentah';
end

for k = 81:125
    kelas_latih{k} = 'Setengah Matang';
end

% klasifikasi citra menggunakan algoritma naive bayes
Mdl = fitcnb(ciri_latih, kelas_latih);

% membaca kelas keluaran hasil pelatihan
hasil_latih = predict(Mdl,ciri_latih);

% menghitung akurasi latih
jumlah_benar = 0;
for k = 1:jumlah_file
    if isequal(hasil_latih{k}, kelas_latih{k})
        jumlah_benar = jumlah_benar+1;
    end
end

akurasi_latih = jumlah_benar/jumlah_file*100;

save siscer Mdl
