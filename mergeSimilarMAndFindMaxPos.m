function [ firstBlob, secondBlob ] = mergeSimilarMAndFindMaxPos( similarM_size,similarM_fill,similarM_color,similarM_texture, parameter_suite )
%mergeSimilarMAndFindMaxPos: this function calculate the main similar
%matrix from the four similar matrix and parameters
%   similarM_size,similarM_fill,similarM_color,similarM_texture: those four
%   similar matrix
% parameter_suite: the paramters which determine the important of the four
% factors
% firstBlob, secondBlob: the two index of segmentations which are most
% similar
%we make sure the first one is smaller than the second
    
    %get those parameters
    para_size = parameter_suite(1);
    para_fill = parameter_suite(2);
    para_color = parameter_suite(3);
    para_texture = parameter_suite(4);
    
    %fprintf('%d %d %d %d\n',para_size,para_fill,para_color,para_texture);
    
    %this is the whole similar matrix
    similarM = para_size*similarM_size + para_fill*similarM_fill + para_color*similarM_color + para_texture*similarM_texture;
    %it does not matter this similarM is not in the [0,1] range
    
    [~,maxIndex] = max(similarM(:));
    [row,col] = ind2sub(size(similarM),maxIndex);
    
    firstBlob = min([row,col]);
    secondBlob = max([row,col]);%we make sure the first one is smaller than the second
    
end

