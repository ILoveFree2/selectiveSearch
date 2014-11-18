function [ histM ] = getHistMatrix( blobIndIm, neighbours, colourIm, histSize_color )
%   getHistMatrix, get the histgram of matrix of the image segmentation
%   blobIndIm: the marking result of the segmetation of the original image
%   neighbours: the result neighbours matrix of the segmetation
%   colourIm: the colour image 
%   output: histM is the colour histgram of matrix of the image segmentation
%this url tell something about the histogram: https://nf.nci.org.au/facilities/software/Matlab/toolbox/images/imhist.html
%if the image is double, the imhist will always give the histogram from 0
%to 1
%histSize_color: the parameter that control the size of the histogram, it
%will refer to one chanel size, and in the paper it is 25

histM = zeros(length(neighbours),histSize_color * 3);%we should have a hist for each segmentation

for j = 1:3 % for each channel
    imageChannel = colourIm(:,:,j);
    for i = 1: length(neighbours) 
        pos = find(abs(blobIndIm - i) < eps);
        segSize = length(pos);
        beginNum = 1 + histSize_color * (j - 1);
        endNum = histSize_color + histSize_color * (j - 1);
        [counts,~] = imhist(imageChannel(pos),histSize_color);
        histM(i,beginNum:endNum) = counts / (segSize * 3);
    end
end

end

