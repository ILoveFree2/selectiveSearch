function [ box ] = mergeBoundingBox( box1,box2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% blobBoxes coordinates are [upperleftX,upperleftY,
% lowerRightX,lowerrightY], so that if you want to get the subimage, you
% need to do the image(upperleftX:lowerRightX,upperleftY:lowerrightY)
upperleftX =  min(box1(1),box2(1));
lowerRightX = max(box1(3),box2(3));
upperleftY =  min(box1(2),box2(2));
lowerrightY = max(box1(4),box2(4));
box = [upperleftX,upperleftY,lowerRightX,lowerrightY];

end

