function [ sizeM ] = getSizeMatrix( blobIndIm, neighbours )
%getSizeMatrix: this function calulate the size Matrix
%blobIndIm: the marking result of the segmetation of the original image
%neighbours: the result neighbours matrix of the segmetation
%sizeM : the result size matrix

sizeM = zeros(size(neighbours,1),1);
for i = 1: size(neighbours,1)
    sizeM(i) = length(find(abs(blobIndIm - i) < eps));
end

end

