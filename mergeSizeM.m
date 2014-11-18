function [ sizeM ] = mergeSizeM( sizeM,firstBlob, secondBlob )
%mergeSizeM: merge the sizeM matrix, according to the firstBlob and
%secondBlob
%   firstBlob : the index of the first segmentation
%   secondBlob : the index of the second segmentation
%   sizeM: the size of each segmentation(vector)

sizeM(firstBlob) = sizeM(firstBlob) + sizeM(secondBlob);
sizeM(secondBlob) = [];  %delete the last one so that we can merge into the first one

end

