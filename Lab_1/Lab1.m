%===================================================================
clc
clear all
close all
%===================================================================

img = imread('ferrari-halo.jpg');

[height, width, colour_planes] = size(img)
%==================================================================
% info = imfinfo('ferrari-halo.jpg');
% info.Height;
% info.Width;
%===================================================================
figure('Name','RGB','NumberTitle','off');
%Orignal Image

subplot(2,3,2)
imshow(img)
title("Orignal RGB Image")
=-------------------------------------------------------------------
%RED Component
subplot(2,3,4)
R = img;
R(:,:,2:3)=0;
imshow(R)
title("RED Chaneel In Red")
=------------------------------------------------------------------
%Green Component
subplot(2,3,5);
G = img;
G(:,:,1)=0;
G(:,:,3)=0;
imshow(G)
title("Green Channel In Green")
=------------------------------------------------------------------
%Blue component
B = img;
B(:,:,1:2)=0;
subplot(2,3,6)
imshow(B)
title("Blue Channel In Blue")
%=====================================================================
subplot(2,3,1)
R2=img;
for i= 1:height
    for j= 1:width
        if (R2(i,j,1)<180)
            R2(i,j,:)=255;
        end
    end
end
%R2(:,:,2:3)=255;
%colormap = hot;
imshow(R2);
title("RED")
