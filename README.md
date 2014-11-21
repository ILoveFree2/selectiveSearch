this is yiqing's implementation of selective search algorithm
==============

one way to use it
--------------
is to run the **demo.m** file, and it will perform the selective search on single image

the other way to use it
---------------------
is to run the **testAllPicturesInDirectory.m** file and it will perform the selective search on
all the images in a directory, the result will also be written in the same directory


the original paper
----------------
- the original algorithm is found in http://homepages.inf.ed.ac.uk/juijling/#page=projects1
- but the original implementation in matlab is partially encrypted, so I implementation my own 


the withoutTexture branch
----------------
I found out that there is some bug in the implementaton of the aniguass.c, so for now, I just ignore the texture part, so I create a new branch called 
withoutTexture, this branch does not produce bug when testing with large amount of data. To fix the bug is a 
TODO in the future. 
