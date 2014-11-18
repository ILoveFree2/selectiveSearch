function [  ] = drawBoundingboxOnImageWithRandomColor( im, resultBoundingBox )
%drawBoundingboxOnImage draw the random color bounding box on the image and
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

for i = 1: size(newBox,1)
    
    shapeInserter = vision.ShapeInserter('Shape','Rectangles','BorderColor','Custom', 'CustomBorderColor',  uint8(randi(225,1,3)) );
    rectangle = int32(newBox(i,:));
    im = step(shapeInserter, im, rectangle);
    
end

imwrite(im,'resultImage.jpg')

fprintf('the result image with bounding box was written on file resultImage.jpg\n');

end


