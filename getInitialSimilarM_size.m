function [ similarM_size ] = getInitialSimilarM_size( neighbours, sizeM, totalSize )
%getInitialSimilarM_size calculate the initial similar matrix 
%   neighbours: the neighbour matrix got by segmentation
%   sizeM: the size of each segmentation(vector)
%   totalSize: the total size of the image in pixel
%   similarM_size: output the initial similar matrix 
pos = find(neighbours);
similarM_size = zeros(size(neighbours));


for i = 1: length(pos)
    index = pos(i);
    [row,col] = ind2sub(size(neighbours),index);
    if col > row % the col should always be larger than the row
        %fprintf('%d %d %d %d\n',index,row,col,neighbours(row,col)); 
        similarM_size(index) = 1 - (sizeM(row) + sizeM(col)) / totalSize;
    end
end

end

