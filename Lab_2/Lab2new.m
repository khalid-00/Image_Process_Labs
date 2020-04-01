%===================================================================
clc
clear all
close all
% ===================================================================
%q1
img = imread('seeds.tif');
RGBimage= img(:,:,1:3);
grey=rgb2gray(RGBimage);
%imshow(grey);
%imwrite(grey,'seeds.jpg');
%%===================================================================
%Q2+Q3
bw=imbinarize(grey,0.3);
neg = 1 - bw ;
imshowpair(bw,neg,'montag');
subplot(221)
imhist(grey);
subplot(222)
histogram(neg);
%=====================================================================
%Q4 the hiseq is enhance the constat for the image 
figure ('name','histogram visulization')
hq1= histeq(grey);
hq2= histeq(neg);
imshowpair(hq1,hq2,'montag');

figure('name','histogram equlization')
subplot(121)

histogram(hq1);
subplot(122)
histogram(hq2);
%========================================================================
%Q5

%bw is my binarization image and now i'll binarize just the equliz image
bw2= imbinarize(hq1);
imshow(bw2);



