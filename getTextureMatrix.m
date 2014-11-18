function [ textureM ] = getTextureMatrix(colourIm, blobBoxes, neighbours, histSize_texture)
%   getTextureMatrix, get the texture histgram of matrix of the image segmentation
%   blobBoxes: the bouding box result of the segmetation of the original image
%   neighbours: the result neighbours matrix of the segmetation
%   colourIm: the colour image 
%   output: textureM is the texture histgram of matrix of the image segmentation
%   histSize_texture: the parameter that control the size of the histogram, it
%   will refer to one chanel and one direction size, and in the paper it is
%   10

textureM = zeros(length(neighbours),histSize_texture * 3 * 8);%we should have a hist for each segmentation

for j = 1:3 % for each channel
    imageChannel = colourIm(:,:,j);
    for i = 1: length(neighbours)%for each segmentation
        poi = imageChannel( blobBoxes(i,1):blobBoxes(i,3),blobBoxes(i,2):blobBoxes(i,4) );
        poiSize = size(poi,1) * size(poi,2);
        for k = 1 : 8 % for each orientation
            out = anigauss(poi, 1, 1, (k-1) * 45, 1, 1);
            [counts,~] = hist(out(:),histSize_texture);
            counts = counts / (poiSize * 3 * 8);
            beginIndex = 1 + ((j-1) * 8 + (k-1)) * histSize_texture;
            endIndex = histSize_texture + ((j-1) * 8 + (k-1)) * histSize_texture;
            textureM(i,beginIndex:endIndex) = counts;
        end
    end
end


end

