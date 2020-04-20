%===================================================================
clc
clearvars
close all
%===================================================================
%Q1
%====================================================================
%%
img = imread('hubble.jpg');
%size(img);
%applying binariation
img2=rgb2gray(img);
bw=imbinarize(img2);

figure('name','Applying binariziton & ersrions')
subplot(331)
imshow(img)
title('orginal image')
subplot(332)
imshow(bw);
title('Binarize Image')
% applying the Erosion with different Shapes
se = strel('disk',3);
A2 = imerode(bw, se);
subplot(333)
imshow(A2);
title('Erosion disk')
se = strel('octagon',3);
A3 = imerode(bw, se);
subplot(334)
imshow(A3);
title('Erosion octagon 3')
%-----------------------------------

%applyin Dilation with different shapes
se = strel('disk',3);
A2 = imdilate(bw, se);
subplot(335)
imshow(A2);
title(' Dilation disk')
se = strel('diamond',3);
A2 = imdilate(bw, se);
subplot(336)
imshow(A2);
title('Dilation diamond')
%-----------------------------------


figure('Name','open and close');
subplot(311)
imshow(img);
title('Orginal image')
se = strel('disk',5);
afteropen = imopen(bw,se);
subplot(312)
imshow(afteropen);
title('Opening')
se = strel('disk',5);
closeBW = imclose(bw,se);
subplot(313)
imshow(closeBW);
title('Closing')

%----------------------------------
%%
labeled_img = logical(bw);
%feature extraction and size distribution
m = regionprops(labeled_img, 'EquivDiameter');
allDiameters = [m.EquivDiameter];
numOfBins = 100; % arbitary value
figure;subplot (1,1,1)
[diamDist, binDiam] = hist(allDiameters, numOfBins);
bar(binDiam, diamDist, 'BarWidth', 1.0);
xlabel('Bin-Diameters');ylabel ('Diam-Distribution');title('Size-Distribution')

%=========================================================================
%Q2
%=========================================================================
%%
figure('Name','Erisoion&Delation ')
img3 = imread('Moon.png');
%size(img);
img4=rgb2gray(img3);
bw1=imbinarize(img4);
subplot(221)
imshow(img3);
title('Orginal image')
se = strel('disk',3);
A3 = imerode(bw1, se);
subplot(222)
imshow(A3);
title('Erosion disk')
se = strel('disk',5);
A4 = imerode(bw1, se);
subplot(223)
imshow(A4);
title('Erosion dimanod ')
%-----------------------------------

se = strel('disk',3);
A5 = imdilate(bw1, se);
subplot(224)
imshow(A5);
title(' Dilation disk')
% B = [0 1 0; 1 1 1; 0 1 0];
% A6 = imdilate(bw1,B);
% subplot(335)
% 
% imshow(A6)
% title(' Disk  ')
%-----------------------------------

%%
figure('Name',' moon open and close');
subplot(221)
imshow(img4);
title('Orginal Image')
se = strel('disk',5);
afteropen = imopen(bw1,se);
subplot(222)
imshow(afteropen);
title('Opeining')
se = strel('disk',5);
closeBW = imclose(bw1,se);
subplot(223)
imshow(closeBW);
title('Closing')
[Gmag, Gdir] = imgradient(bw1);
subplot(224)
imshow(Gmag);
title('Gradient');
%----------------------------------

se = strel('disk',5);

tophatFiltered = imtophat(img3,se);
figure
imshow(tophatFiltered)
title ('White top hat filter 4')
