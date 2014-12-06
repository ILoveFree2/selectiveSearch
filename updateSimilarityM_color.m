
function [ similarM_color] = updateSimilarityM_color(similarM_color,histM,firstBlob)
%updateSimilarityM_color updates the similarity matrix M of color
%   this function updates the similarity matrix of the color
%   similarM_color: output the initial similar matrix 
%   firstBlob : the index of the first segmentation
%   histM: the histogram matrix !!! you must provide the
%   new sizeM vector to this function !!!

cosineDistanceFlag = 1; %this is a flag indicating we are using the cosine distance

    %we need to recalculate the similatity matrix

    for i = firstBlob + 1 : size(similarM_color,2)%this deal with the row(horizontal line)
        rowTmp = firstBlob;
        colTmp = i;
        if(similarM_color(rowTmp,colTmp) > 0) %there is the edge
            
            if cosineDistanceFlag > 0
                tmpHist = [histM(rowTmp,:);histM(colTmp,:)];
                similarM_color(rowTmp,colTmp) = 1 - pdist(tmpHist,'cosine');
            else
                similarM_color(rowTmp,colTmp) =  sum( min(histM(rowTmp,:),histM(colTmp,:)) );
            end
        end
    end %this pair is the standard pair of accessing one's neighbours

    for i = 1 : firstBlob - 1 %this deal with the column(vertical line)
        rowTmp = i;
        colTmp = firstBlob;
        if(similarM_color(rowTmp,colTmp) > 0) %recauculate the number
            
            if cosineDistanceFlag > 0
                tmpHist = [histM(rowTmp,:);histM(colTmp,:)];
                similarM_color(rowTmp,colTmp) = 1 - pdist(tmpHist,'cosine');
            else
                similarM_color(rowTmp,colTmp) = sum( min(histM(rowTmp,:),histM(colTmp,:)) );
            end
        end

    end
    
end

