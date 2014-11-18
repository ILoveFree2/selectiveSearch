function [ newBox] = deduplicate(resultBoundingBox, hT, wT)
%deduplicate find all the rectangle with similar postion, and remove them
%in the result bounding boxes
%   resultBoundingBox:      is the bounding boxes with duplications
%   hT:       is the threshold to tell which two rectangle are
%   similar, in height direction
%   wT:  is the threshold to tell which two rectangle are
%   similar, in width direction
%  newBox:          is the bounding boxes after without similar
%  retangles
newBox = zeros(0,4);
for i = 1:size(resultBoundingBox)
    coor1 = resultBoundingBox(i,1);
    coor2 = resultBoundingBox(i,2);
    coor3 = resultBoundingBox(i,3);
    coor4 = resultBoundingBox(i,4);
    
    newRectangleFlag = true;
    for j = size(newBox,1):-1:1
        if abs(newBox(j,1)-coor1)<=hT &&  abs(newBox(j,2)-coor2)<=wT &&  abs(newBox(j,3)-coor3)<=hT &&  abs(newBox(j,4)-coor4)<=wT 
            newRectangleFlag = false;
            break
        end
    end
    if newRectangleFlag
        newIndex = size(newBox,1) + 1;
        newBox(newIndex,:) = [coor1,coor2,coor3,coor4]; 
    end

end

end

