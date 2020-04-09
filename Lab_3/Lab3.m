%===================================================================
clc
clearvars
close all
% ===================================================================
%Q1
%====================================================================
img = imread('galaxy.tiff');
im=img(:, : ,1:3);
%size(im);
im2grey=  rgb2gray(im);
Rob = edge(im2grey,'Roberts');
subplot(321)
imshow(Rob);
title('Robert');
subplot(322)
Sobel = edge(im2grey,'sobel');
imshow(Sobel)
title('Sobel');
%--------------------------------------
[Gmag, Gdir] = imgradient(im2grey,'prewitt');
subplot(323)
imshowpair(Gmag, Gdir, 'montage');
title('Gradient Magnitude,using Prewitt method');
% ---------------------------------------
% LAPLACIAN

kernel = [
    0 -1 0 ;
    -1 4 -1 ;
    0 -1 0 ];
Laplacian =imfilter(im2grey,kernel);
subplot(324)
imshow(Laplacian> 8 ,[])

title('Laplacian');
% %===============================================================
%Q2
% figure
G = imnoise(im2grey,'gaussian') ;
subplot(325)
imshow(G)
title('gussian')
I2 = im2double(G);
Ig = (1/9).*[1,1,1;
            1,1,1;
            1,1,1];
lp=conv2(I2,Ig,'same');
subplot(326)
imshow(lp);
title('Low pass filter')
% %-----------------------
[peaksnr, snr] = psnr(G, im2grey);
[peaksnr1, snr1] = psnr(uint8(lp), im2grey);
fprintf('\n The Peak-SNR value is : %0.2f', peaksnr);
fprintf('\n The Peak-SNR value after applying Low pass filter is :%0.2f', peaksnr1)
%-------------------------
%%
h=fspecial('laplacian',1);
Xp=imfilter(im,h);
figure
imshow(Xp)
imshow(Xp+im)
lg2 = [
    0 -1 0 ;
    -1 4 -1 ;
    0 -1 0 ];
hp = conv2(im2grey,lg2,'same');
%  h=fspecial('laplacian',0);
%  Xp=imfilter(im,h);
%  figure 
%  imshow(hp)
%  imshow(hp+im)
title('High pass filter')

%=================================================================
% %Q3
figure
img=imread('bodyb.tif');
v1=img( :, : ,1:3);
v2=rgb2gray(v1);
v=im2double(v2);
 
h=[0 1 0 ;
    1 -4 1;
    0 1 0];
Xp=filter2(h,v);
subplot(131)
imshow(Xp)


b = imsharpen(v,'Radius',2,'amount',2);
subplot(132)
imshow(imadd(Xp,b))

h=fspecial('sobel');
h1=h';
p1=imfilter(v,h);
p2=imfilter(v,h1);
p3=abs(p1)+abs(p2);
subplot(133)
imshow(v),imshow(p3+v)

