function [ similarM_size ] = updateSimilarityM_size( similarM_size, firstBlob, sizeM, totalSize )
%updateSimilarityM_size updates the similarity matrix M 
%   this function updates the similarity matrix of the size
%   similarM_size: output the initial similar matrix 
%   firstBlob : the index of the first segmentation
%   sizeM: the size of each segmentation(vector)  !!! you must provide the
%   new sizeM vector to this function !!!
%   totalSize: the total size of the image in pixel


    %after that,we need to recalculate the similatity

    for i = firstBlob + 1 : size(similarM_size,2)%this deal with the row(horizontal line)
        rowTmp = firstBlob;
        colTmp = i;
        if(similarM_size(rowTmp,colTmp) > 0) %there is the edge
            similarM_size(rowTmp,colTmp) = 1 - (sizeM(rowTmp) + sizeM(colTmp)) / totalSize;
        end
    end %this pair is the standard pair of accessing one's neighbours

    for i = 1 : firstBlob - 1 %this deal with the column(vertical line)
        rowTmp = i;
        colTmp = firstBlob;
        if(similarM_size(rowTmp,colTmp) > 0) %recauculate the number
            similarM_size(rowTmp,colTmp) = 1 - (sizeM(rowTmp) + sizeM(colTmp)) / totalSize;
        end

    end
    
end

