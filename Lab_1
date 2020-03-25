# Lab 1
## Question 1 and 2

The dimentions are :
1. height = 500
2. width = 889
3. dim (color channels RGB) = 3


## Question 3
>For most image file formats, imread uses 8 or fewer bits per color plane to store image pixels. This table lists the class of the returned image array, A, for the bit depths used by the file formats.

| Bit Depth in File | Class of Array Returned by imread |
| ----------- | ----------- |
| 1 bit per pixel| logical |
| 2 to 8 bits per color plane | uint8 |
| 9 to 16 bits per pixel | uint16 (BMP, JPEG, PNG, and TIFF) For the 16-bit BMP packed format (5-6-5), MATLAB returns uint8 |

## Question 4
```
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
%RED Component

subplot(2,3,4)
R = img;
R(:,:,2:3)=0;
imshow(R)
title("Orignal RGB Image")
%Green Component
subplot(2,3,5);
G = img;
G(:,:,1)=0;
G(:,:,3)=0;
imshow(G)
title("Orignal RGB Image")
%Blue component
B = img;
B(:,:,1:2)=0;
subplot(2,3,6)
imshow(B)
title("Blue Channel In Blue")
%===============================================
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
title("Blue Channel In Blue")

```
