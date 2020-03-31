%===================================================================
clc
clear all
close all
% ===================================================================

figure('Name','Lab2','NumberTitle','off');
img = imread('seeds.tif');
subplot(3,1,1)
img=(img(:,:,1:3)); 
imwrite(img,'seeds.jpg');
img2=imread('seeds.jpg');
imshow(img);
title('orginal')
%====================================================================

subplot(3,1,2)
bw= im2bw(img,0.2);
imshow(bw);
title('binary image')

subplot(3,1,3)
% I=imread('seeds.jpg');
% J1=imadjust(I,[ ],[1;0]);
% imshow(J1)
bw2 = imcomplement(img2);
imshow(bw2);
title('negative image ')
%=====================================================================
figure('Name','Histograms','NumberTitle','off');
subplot(1,2,1)
histogram(img);
title('Histogram');
subplot(1,2,2)
im= histogram(bw2)
title('Histogram for neg')


