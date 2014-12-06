function [ similarM_color ] = getInitialSimilarM_color( neighbours,histM )
%   getInitialSimilarM_color calculate the initial similar matrix of color
%   neighbours: the neighbour matrix got by segmentation
%   histM: the histogram matrix

cosineDistanceFlag = 1; %this is a flag indicating we are using the cosine distance

pos = find(neighbours);
similarM_color = zeros(size(neighbours));

for i = 1: length(pos)
    index = pos(i);
    [row,col] = ind2sub(size(neighbours),index);
    if col > row % the col should always be larger than the row
        %fprintf('%d %d %d %d\n',index,row,col,neighbours(row,col)); 
        if cosineDistanceFlag > 0
            tmpHist = [histM(row,:);histM(col,:)];
            similarM_color(index) = 1 - pdist(tmpHist,'cosine');
        else
            similarM_color(index) = sum( min(histM(row,:),histM(col,:)) );
        end
    end
end

end

