 ![alt text](https://www.ubfc.fr/wp-content/uploads/2018/07/logo_ubfc.png)







# ------------------------ Morphology --------------------
------------------------------------------------------------

                                      
                                      
                                      
                                      
##    Prof .Eric Fauvert                   
                                      
                                      
##  PT    Zongwei WU


###                  Mohammad Khaeld Alshikh


-------------------------------------------------------------

-------------------------------------------------------------

**Morphological operators**: are used to change image
data to reflect new geometric structure.

**Binary Morphology**

> Binary images often suffer from noise (specifically saltand-pepper noise)
> Binary regions also suffer from noise (isolated black pixels in a white region).

##### **Dilation and Erosion** are two binary morphologica operations that can assist with these problems.

###### **Dilation :**
is used for expanding an element A by using structuring element B

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Dilation.PNG)

The dilation operator takes two pieces of data as input
> A binary image, which is to be dilated
> A structuring element (or kernel), which determines the behavior of the morphological operation

 >> Main Applications of Dilation:
 >> Expand shapes.
 >> Fills in holes, crack, valleys between spiky regions
 >> Smoothes object boundaries.
 >> Smoothes small negative grey level regions
###### Code 
```
%applyin Dilation
figure('name','Dilation')
se = strel('disk',3);
A2 = imdilate(bw, se);

imshow(A2);title('Image Dilation')
```



######  **Erosion** 
 
>> Erosion is used for shrinking of element A by using
element B
>> One of the simplest uses of erosion is for eliminating irrelevant details from a binary image.

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/erosion%20.jpg) 


>>  application of Erosion
>>> Removes isolated noisy pixels.
>>> Smoothes object
>>> boundary(removes spiky edges).
>>> Removes the outer layer of object pixels
 
 ###### Code
 ```
img = imread('hubble.jpg');
%size(img);
%applying binariation
img2=rgb2gray(img);
bw=imbinarize(img2);

figure('name','applying binariziton & Erosion')
subplot(221)
imshow(img);
title('binarzie')
% applying the Erosion with different sizes
se = strel('disk',3);
A2 = imerode(bw, se);
subplot(222)
imshow(A2);
title('Erosion size 3')
se = strel('octagon',3);
A3 = imerode(bw, se);
subplot(223)
imshow(A3);
title('Erosion size octagon 3')
se = strel('disk',5);
A4 = imerode(bw, se);
subplot(224)
imshow(A4);
title('Erosion size ')
```
###### Result 
![Image2](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%201%20.PNG)


**Opening & Closing**
 
Opening and Closing are two important operators from mathematical morphology
> They are both derived from the fundamental operations of erosion and dilation
> They are normally applied to binary images


> We use opening for:
  >> Smoothes object boundaries
  >> Eliminates noise (isolated pixels)
  >> Maintains object size

We use Closing for:
>> cleaned binary image
>> Eliminates noise (small holes), fills gaps in contours and close up cracks in objects.
>> Maintains object size.

###### Code 
```
figure('Name','open and close');
subplot(311)
imshow(img);
se = strel('disk',5);
afteropen = imopen(bw,se);
subplot(312)
imshow(afteropen);
se = strel('disk',5);
closeBW = imclose(bw,se);
subplot(313)
imshow(closeBW);
```

#### The reuslt : 

![image3](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%2012%20.PNG)



##### Observations 
Erosion and dilation clean image but leave objects
either smaller or larger than their original size.
Opening and closing perform same functions as
erosion and dilation but object size remains the
same

##### Granulometry
>Measurement of the Size distribution in a collection of grains is referred to as Granulometry. In the
 code, matlab built-in function ‘regionprops’ is utilized to measure the image properties, to proceed with
 the regionprops function, first connected components are found via the bwlabel function. By using the
 Labeled matrix as an input, the properties can be measured.
 ##### Code
``` 
labeled_img = logical(bw);
%feature extraction and size distribution
m = regionprops(labeled_img, 'EquivDiameter');
allDiameters = [m.EquivDiameter];
numOfBins = 100; % arbitary value
figure;subplot (1,1,1)
[diamDist, binDiam] = hist(allDiameters, numOfBins);
bar(binDiam, diamDist, 'BarWidth', 1.0);
xlabel('Bin-Diameters');ylabel ('Diam-Distribution');title('Size-Distribution')
```

#### The result 

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%20123%20granulmetry%20.PNG)

### Question 2 

 Useing the same approach for Moon image.
 
###### Code

```
figure('Name','erisoion')
img3 = imread('Moon.png');
%size(img);
img4=rgb2gray(img3);
bw1=imbinarize(img4);
subplot(331)
imshow(img3);
title('Orginal image')
se = strel('disk',3);
A3 = imerode(bw1, se);
subplot(332)
imshow(A3);
title('Erosion disk')
se = strel('disk',5);
A4 = imerode(bw1, se);
subplot(333)
imshow(A4);
title('Erosion dimanod ')
%-----------------------------------
se = strel('disk',3);
A5 = imdilate(bw1, se);
subplot(334)
imshow(A5);
title(' Dilation disk')
% B = [0 1 0; 1 1 1; 0 1 0];
% A6 = imdilate(bw1,B);
% subplot(335)
% imshow(A6)
% title(' Disk  ')

```

#### The result 
![image5](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%201234%20Moon%20E%26D.PNG)

```
%-----------------------------------
figure('Name',' moon open and close');
subplot(411)
imshow(img4);
title('Orginal Image')
se = strel('disk',5);
afteropen = imopen(bw1,se);
subplot(412)
imshow(afteropen);
title('Opeining')
se = strel('disk',5);
closeBW = imclose(bw1,se);
subplot(413)
imshow(closeBW);
title('Closing')
[Gmag, Gdir] = imgradient(bw1);
subplot(414)
imshow(Gmag);
title('Gradient');

```
##### The result :

![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%201234%20Moon%20all%20.PNG)



##### Miss hat white filter 

> is an operation that extracts small elements and details from given image 

##### Code 
```
se = strel('disk',5);

tophatFiltered = imtophat(img3,se);
figure
imshow(tophatFiltered)
title ('White top hat filter 4')


```



##### The result 


![image](https://github.com/khalid-00/Image_Process_Labs/blob/master/Lab4/Images/Reuslt%201234%20hat%20filter.PNG)

