 ![alt text](https://www.ubfc.fr/wp-content/uploads/2018/07/logo_ubfc.png)







# ------------------------ Filtering --------------------
------------------------------------------------------------

                                      
                                      
                                      
                                      
##    Dr .Eric Fauvert                   
                                      
                                      
##     Dr . Zongwei WU


###                  Mohammad Khaeld Alshikh


-------------------------------------------------------------

-------------------------------------------------------------
###### What Is a Filter?
The main difference between filters and point operations is that filters generally
use more than one pixel from the source image for computing each new pixel
value.
> The Filter Matrix (Mask or Window):
>>For any linear filter, the size and shape of the support region, as well as the
individual pixel weights, are specified by the “filter matrix” or “filter mask”
H(i, j)

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/CV_L_05_Spatial_Filters.jpg)


> First-order derivative : **Edge Detectors**
>>First derivatives in image processing are implemented using the magnitude of
the gradient. For a function f(x, y), the gradient of f at coordinates (x, y) is
defined as the two-dimensional column vector
>>>Given a 3*3 region of an image the following edge detection filters can be used :
![image2](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filters.jpg)
![images3](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filters2.jpg)

>Second-order derivative (2D Laplacian):
>>A basic definition of the second-order derivative of a two-dimensional function
f(x,y) (Laplacien)
>>>Usually hen used for edge detection the Laplacian is combined with a
smoothing Gaussian filter

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filter3s.jpg)
![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filters4.jpg)
![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filters6.jpg)
![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/CV_L_05_Spatial_Filters8.jpg)


###### In our lab we apply diffrent filiter as following:
### Question 1
- Robert gradient
- Sobel
- Gradient
- Laplacian
 
 ```
 img = imread('galaxy.tiff');
im=img(:, : ,1:3);
%size(im);
grey=  rgb2gray(im);
Rob = edge(grey,'Roberts');
subplot(321)
imshow(Rob);
title('Robert');
subplot(322)
Sobel = edge(grey,'sobel');
imshow(Sobel)
title('Sobel');
%--------------------------------------
[Gmag, Gdir] = imgradient(grey,'prewitt');
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
```
![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/Captur2.PNG)

### Question 2 :
##### Smoothing ( low pass) :


> Effect: reduce sharp transitions
 Some type of noise consists in sharp transitions
>Type of smoothing filters:
>> 1. Standard average.
>> 2. Weighted average.
>> 3. Median filter.

```
%Q2
% figure
G = imnoise(grey,'gaussian') ;
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
```
##### Peak Signal-to-Noise Ratio

 This ratio is used as a quality measurement between the original and a compressed image.
 The higher the PSNR, the better the quality of the compressed, or reconstructed image.
 
 ```
 [peaksnr, snr] = psnr(G, grey);
[peaksnr1, snr1] = psnr(uint8(lp), grey);
fprintf('\n The Peak-SNR value is : %0.2f', peaksnr);
fprintf('\n The Peak-SNR value after applying Low pass filter is :%0.2f', peaksnr1)
 
 ```
#### the result : 
 The Peak-SNR value is : 20.58 dB
 The Peak-SNR value after applying Low pass filter is :11.58 dB
 
 
##### Sharpening Spatial Filters ( high pass):
> Sharpening spatial filters seek to highlight
fine detail
>> 1. Remove blurring from images
>> 2. Highlight edges
>> 3. Useful for emphasizing transitions in image
intensity

1. LAPLACE
2. SOBEL 
``` 
 h=fspecial('laplacian',0);
 Xp=imfilter(im,h);
figure

 imshow(Xp)
 imshow(Xp+im)

title('High pass filter')
```
![image2](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/Capture3.PNG)

### Question 3
##### Combining Spatial Enhancement Methods 
Successful image
enhancement is typically
not achieved using a single
operation
Rather we combine a
range of techniques in order
to achieve a final result
This example will focus on
enhancing the bone scan to
the right

```

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


```

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab_3/images/Capture1.PNG)
