function [ textureM ] = mergeTextureM( textureM, blobBoxes ,firstBlob, secondBlob)
%mergeTextureM : merge the texture histogram Matrix 
%   firstBlob : the index of the first segmentation
%   secondBlob : the index of the second segmentation
%  textureM : is the   texture histogram matrix
% blobBoxes : the bounding boxes, this must be the original bounding box,
% so that this function must be called before the merge of bounding box

firstSize = ( blobBoxes(firstBlob,3) - blobBoxes(firstBlob,1) + 1) * ( blobBoxes(firstBlob,4) - blobBoxes(firstBlob,2) + 1);
secondSize = ( blobBoxes(secondBlob,3) - blobBoxes(secondBlob,1) + 1) * ( blobBoxes(secondBlob,4) - blobBoxes(secondBlob,2) + 1);
textureM(firstBlob,:) = ( firstSize * textureM(firstBlob,:) + secondSize * textureM(secondBlob,:) ) / (firstSize + secondSize);
textureM(secondBlob,:) = [];

end