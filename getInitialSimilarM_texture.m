function [ similarM_texture ] = getInitialSimilarM_texture( neighbours,textureM )
%   getInitialSimilarM_texture calculate the initial similar matrix of
%   texture
%   neighbours: the neighbour matrix got by segmentation
%   texture: the texture matrix for each segmentation

pos = find(neighbours);
similarM_texture = zeros(size(neighbours));

for i = 1: length(pos)
    index = pos(i);
    [row,col] = ind2sub(size(neighbours),index);
    if col > row % the col should always be larger than the row
        %fprintf('%d %d %d %d\n',index,row,col,neighbours(row,col)); 
        similarM_texture(index) = sum( min(textureM(row,:),textureM(col,:)) );
    end
end

end
