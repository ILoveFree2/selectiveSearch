function [ similarM_texture ] = updateSimilarityM_texture(similarM_texture,textureM,firstBlob)
%updateSimilarityM_texture updates the similarity matrix M of texture
%   this function updates the similarity matrix of the texture
%   similarM_texture: output the texture matrix
%   firstBlob : the index of the first segmentation
%   textureM: the histogram matrix of texture!!! you must provide the
%   new textureM matrix to this function !!!

    %we need to recalculate the similatity matrix

    for i = firstBlob + 1 : size(similarM_texture,2)%this deal with the row(horizontal line)
        rowTmp = firstBlob;
        colTmp = i;
        if(similarM_texture(rowTmp,colTmp) > 0) %there is the number edge in graph
            similarM_texture(rowTmp,colTmp) =  sum( min(textureM(rowTmp,:),textureM(colTmp,:)) );
        end
    end %this pair is the standard pair of accessing one's neighbours

    for i = 1 : firstBlob - 1 %this deal with the column(vertical line)
        rowTmp = i;
        colTmp = firstBlob;
        if(similarM_texture(rowTmp,colTmp) > 0) %recauculate the number
            similarM_texture(rowTmp,colTmp) = sum( min(textureM(rowTmp,:),textureM(colTmp,:)) );
        end

    end
    
end