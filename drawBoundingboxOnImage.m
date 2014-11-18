function [  ] = drawBoundingboxOnImage( im, resultBoundingBox )
%drawBoundingboxOnImage draw the same color bounding box on the image and
% save the image to the newimage.jpg file
%   im, is the image
%  resultBoundingBox are the result bounding box of the selective search
%  method

newBox = zeros(size(resultBoundingBox));
%in the format [x y width height], where [x y] determine the upper-left corner location of the rectangle, and width and height specify the size.
%the coordinate system is not the same. so that we need to change the
%coordiniate system

newBox(:,3) = resultBoundingBox(:,4) - resultBoundingBox(:,2);
newBox(:,4) = resultBoundingBox(:,3) - resultBoundingBox(:,1);
newBox(:,[1,2]) = resultBoundingBox (:,[2,1]);
 
shapeInserter = vision.ShapeInserter;
rectangle = int32(newBox);
J = step(shapeInserter, im, rectangle);

imwrite(J,'newimage.jpg')

end

