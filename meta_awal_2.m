clc; clear; close all; warning off all;

% % % Proses Latih
% lokasi data
nama_folder = 'E:\semester 5\z-projek\data set buah tomat\data uji';
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
    rgbImage = imcrop(Img,[30 30 50 50]);
%     figure, imshow(rgbImage)
  
    % ekstraksi ciri
    
    % ekstrak R G B
    R = mean(mean(rgbImage(:,:,1)));
    G = mean(mean(rgbImage(:,:,2)));
    B = mean(mean(rgbImage(:,:,3)));         
       
   %mengisi variable
    ciri_latih(n,1) = R;
    ciri_latih(n,2) = G;
    ciri_latih(n,3) = B;

end

% % menyusun variabel kelas_latih
% kelas_latih = cell(jumlah_file, 1);
% 
% % mengisi nama2 tomat pada variabel kelas_latih
% for k = 1:35
%     kelas_latih{k} = 'Matang';
% end
% 
% for k = 36:80
%     kelas_latih{k} = 'Mentah';
% end
% 
% for k = 81:125
%     kelas_latih{k} = 'Setengah Matang';
% end
% 
% klasifikasi citra menggunakan algoritma naive bayes
% Mdl = fitcnb(ciri_latih, kelas_latih);
% 
% % membaca kelas keluaran hasil pelatihan
% hasil_latih = predict(Mdl,ciri_latih);