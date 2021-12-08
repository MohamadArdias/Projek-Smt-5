clc; clear; close all; warning off all;

% % % Proses Latih
% lokasi data
nama_folder = 'E:\semester 5\z-projek\progres\Projek-Smt-5\tomat 2\data training';
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
    
    %croping
    rgbImage = imcrop(Img,[1300 1000 1500 1500]);
%     figure, imshow(rgbImage)
  
    % ekstraksi ciri
    % RGB to HSV
    HSV = rgb2hsv(rgbImage);
%     figure, imshow(HSV)
    
    % ekstrak R G B
    H = mean(mean(HSV(:,:,1)));
    S = mean(mean(HSV(:,:,2)));
    V = mean(mean(HSV(:,:,3)));         
       
   %mengisi variable
    ciri_latih(n,1) = H;
    ciri_latih(n,2) = S;
    ciri_latih(n,3) = V;

end

% menyusun variabel kelas_latih
kelas_latih = cell(jumlah_file, 1);

% mengisi nama2 tomat pada variabel kelas_latih
for k = 1:14
    kelas_latih{k} = 'Matang';
end

for k = 15:42
    kelas_latih{k} = 'Mentah';
end

for k = 43:81
    kelas_latih{k} = 'Setengah Matang';
end

% klasifikasi citra menggunakan algoritma naive bayes
Mdl = fitcnb(ciri_latih, kelas_latih);

% membaca kelas keluaran hasil pelatihan
hasil_latih = predict(Mdl,ciri_latih);