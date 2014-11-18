function [similarM_fill] = updateSimilarityM_fill(similarM_fill,blobBoxes,firstBlob,sizeM,totalSize)
%updateSimilarityM_size updates the similarity matrix M 
%   this function updates the similarity matrix of the fill
%   similarM_fill: output the initial similar matrix 
%   firstBlob : the index of the first segmentation
%   sizeM: the size of each segmentation(vector) !!! you must provide the
%   new sizeM vector to this function !!!
%   blobBoxes: this is the matrix of bounding box, and this should be a new
%   bounding box
%   totalSize: the total size of the image in pixel
    
    %after that,we need to recalculate the similatity

    for i = firstBlob + 1 : size(similarM_fill,2)%this deal with the row(horizontal line)
        rowTmp = firstBlob;
        colTmp = i;
        if(similarM_fill(rowTmp,colTmp) > 0) %there is the edge
            similarM_fill(rowTmp,colTmp) =  1 - (getTwoBoundBoxArea(blobBoxes(colTmp,:),blobBoxes(rowTmp,:)) - (sizeM(rowTmp) + sizeM(colTmp)) )/ totalSize;
        end
    end %this pair is the standard pair of accessing one's neighbours

    for i = 1 : firstBlob - 1 %this deal with the column(vertical line)
        rowTmp = i;
        colTmp = firstBlob;
        if(similarM_fill(rowTmp,colTmp) > 0) %recauculate the number
            similarM_fill(rowTmp,colTmp) = 1 - (getTwoBoundBoxArea(blobBoxes(colTmp,:),blobBoxes(rowTmp,:)) - (sizeM(rowTmp) + sizeM(colTmp)) )/ totalSize;
        end

    end
 

end

