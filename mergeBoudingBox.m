function [ blobBoxes ] = mergeBoudingBox( blobBoxes,firstBlob,secondBlob )
%mergeBoudingBox : this function merge the bounding box according to the firstBlob and secondBlob
%   firstBlob : the index of the first segmentation
%   secondBlob : the index of the second segmentation
%   blobBoxes: the matrix of bounding boxes

    blobBoxes(firstBlob,:) = mergeBoundingBox(blobBoxes(firstBlob,:),blobBoxes(secondBlob,:));
    blobBoxes(secondBlob,:) = [];

end

