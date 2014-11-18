function [ histM ] = mergeHistM( histM, sizeM ,firstBlob, secondBlob)
%mergeHistM : merge the histogram Matrix 
%   firstBlob : the index of the first segmentation
%   secondBlob : the index of the second segmentation
% histM : is the histogram matrix
% sizeM: is the size Matrix of each segmentation !!! this must be the
% original size matrix, so that this function must be called before the
% merge the size matrix

histM(firstBlob,:) = ( sizeM(firstBlob) * histM(firstBlob,:) + sizeM(secondBlob) * histM(secondBlob,:) ) / (sizeM(firstBlob) + sizeM(secondBlob));
histM(secondBlob,:) = [];

end

