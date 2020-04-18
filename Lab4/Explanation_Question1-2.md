 ![alt text](https://www.ubfc.fr/wp-content/uploads/2018/07/logo_ubfc.png)







# ------------------------ Morphology --------------------
------------------------------------------------------------

                                      
                                      
                                      
                                      
##    Prof .Eric Fauvert                   
                                      
                                      
##      Zongwei WU


###                  Mohammad Khaeld Alshikh


-------------------------------------------------------------

-------------------------------------------------------------

Morphological operators: are used to change image
data to reflect new geometric structure.

Binary Morphology

Binary images often suffer from noise (specifically saltand-pepper noise)
Binary regions also suffer from noise (isolated black
pixels in a white region). Can also have cracks, picket
fence , etc.
Dilation and erosion are two binary morphological
operations that can assist with these problems.

Dilation is used for expanding an element A by using
structuring element B
•The dilation operator takes two pieces of data as input
1. A binary image, which is to be dilated
2. A structuring element (or kernel), which determines the
behavior of the morphological operation


Main Applications of Dilation

Expand shapes
  Fills in holes, crack, valleys between spiky regions
  Smoothes object boundaries.
 smoothes small negative grey level regions
 
 
 
 
 
 
 
 
 
 Opening & Closing
 
Opening and Closing are two important operators
from mathematical morphology
They are both derived from the fundamental
operations of erosion and dilation
 They are normally applied to binary images


•We use opening for:
o Smoothes object boundaries
o Eliminates noise (isolated pixels)
o Maintains object size


Closing of A by B, is dilation followed by erosion (opposite to
opening).
We use Closing for:
Smoothes object boundaries
Eliminates noise (small holes), fills gaps in contours and close
up cracks in objects.
Maintains object size.


result:Erosion and dilation clean image but leave objects
either smaller or larger than their original size.
Opening and closing perform same functions as
erosion and dilation but object size remains the
same


