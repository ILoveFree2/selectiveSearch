function [similarM_size,similarM_fill,similarM_color,similarM_texture] = mergeSimilarityMatrixes(similarM_size,similarM_fill,similarM_color,similarM_texture,firstBlob,secondBlob)
%mergeSimilarityMatrixes merge the matrix
%   similarM_size,similarM_fill,similarM_color,similarM_texture: are the
%   four similar matrix
%   firstBlob : the index of the first segmentation
%   secondBlob : the index of the second segmentation

    %this part find the neighours of the second one, and mark it with 1, so
    %that it can be updated
    for i = secondBlob + 1 : size(similarM_size,2)%this deal with the row(horizontal line)
        rowTmp = secondBlob;
        colTmp = i;
        if(similarM_size(rowTmp,colTmp) > 0)
            %fprintf('%d %d %d\n',rowTmp,colTmp,similarM_size(rowTmp,colTmp)); 
            %fprintf('%d\n',i);
            if(i ~= firstBlob)%it seems we do not have to do that, because it will be larger
                similarM_size(min(i,firstBlob),max(i,firstBlob)) = 1; %this merge the whole thing
                similarM_fill(min(i,firstBlob),max(i,firstBlob)) = 1;
                similarM_color(min(i,firstBlob),max(i,firstBlob)) = 1;
                similarM_texture(min(i,firstBlob),max(i,firstBlob)) = 1;
            end
        end

    end
    % fprintf('\n');
    for i = 1 : secondBlob - 1 %this deal with the column(vertical line)
        rowTmp = i;
        colTmp = secondBlob;
        if(similarM_size(rowTmp,colTmp) > 0)
            %fprintf('%d %d %d\n',rowTmp,colTmp,similarM_size(rowTmp,colTmp)); 
            %fprintf('%d\n',i);
            if(i ~= firstBlob)
                similarM_size(min(i,firstBlob),max(i,firstBlob)) = 1;
                similarM_fill(min(i,firstBlob),max(i,firstBlob)) = 1;
                similarM_color(min(i,firstBlob),max(i,firstBlob)) = 1;
                similarM_texture(min(i,firstBlob),max(i,firstBlob)) = 1;
            end
        end

    end
    
    
    %remove the larger one and merge the whole thing
    similarM_size(secondBlob,:) = [];
    similarM_size(:,secondBlob) = [];
    
    similarM_fill(secondBlob,:) = [];
    similarM_fill(:,secondBlob) = [];
    
    similarM_color(secondBlob,:) = [];
    similarM_color(:,secondBlob) = [];
    
    similarM_texture(secondBlob,:) = [];
    similarM_texture(:,secondBlob) = [];

end

