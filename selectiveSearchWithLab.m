function [ conbineResult, height,width ] = selectiveSearchWithLab( imageName, theK, para_size, para_fill, para_color,para_texture )
% selectiveSearch : the function that will do the  selectiveSearch for one
% image
%   imageName: the name of the input image
% resultBoundingBox: the result bounding boxes

addpath('Dependencies');


% Thresholds for the Felzenszwalb and Huttenlocher segmentation algorithm.
% Note that by default, we set minSize = k, and sigma = 0.8.
k = theK; % controls size of segments of initial segmentation. 
minSize = k;
sigma = 0.8;
histSize_color = 25;% how many bins to use in a color histogram
histSize_texture = 25;% how many bins to use in a single texture histogram
% As an example, use a single image
images = {imageName};
im = imread(images{1});

%change the image to lab color map
colorTransform = makecform('srgb2lab');
imageToSegment = applycform(im, colorTransform);
colourIm = double(imageToSegment) / 255;
imageHeight = size(colourIm,1);
imageWidth = size(colourIm,2);

    
% Get initial segmentation, boxes, and neighbouring blobs
[blobIndIm blobBoxes neighbours] = mexFelzenSegmentIndex(imageToSegment, sigma, k, minSize);
originalBoxes = blobBoxes;%this is the original boxes saved after segmentation

sizeM = getSizeMatrix( blobIndIm, neighbours );
histM  = getHistMatrix( blobIndIm, neighbours, colourIm, histSize_color );
textureM = getTextureMatrix(colourIm, blobBoxes, neighbours, histSize_texture);
height = size(blobIndIm,1);
width = size(blobIndIm,2);
totalSize = size(blobIndIm,1) * size(blobIndIm,2);

similarM_size = getInitialSimilarM_size(neighbours,sizeM,totalSize);
similarM_fill = getInitialSimilarM_fill(neighbours,sizeM,totalSize,blobBoxes);
similarM_color = getInitialSimilarM_color(neighbours,histM);
similarM_texture  = getInitialSimilarM_texture( neighbours,textureM );


parameter_suite = [para_size,para_fill,para_color,para_texture];

resultBoundingBox = zeros(length(similarM_size) - 2,4);
index = 1;

while(length(similarM_size) > 2)
        
    [firstBlob,secondBlob] = mergeSimilarMAndFindMaxPos(similarM_size,similarM_fill,similarM_color,similarM_texture,parameter_suite);
    
    histM = mergeHistM( histM, sizeM ,firstBlob, secondBlob);%this function must be call before the merge the size matrix
    textureM  = mergeTextureM( textureM, blobBoxes ,firstBlob, secondBlob);%this function must be called before the merge of bounding box
    sizeM = mergeSizeM( sizeM, firstBlob, secondBlob );
    blobBoxes  = mergeBoudingBox( blobBoxes,firstBlob,secondBlob );
    
   
    resultBoundingBox(index,:) = blobBoxes(firstBlob,:); %this function must be called after the merge of the bounding box
    
    [similarM_size,similarM_fill,similarM_color,similarM_texture] = mergeSimilarityMatrixes(similarM_size,similarM_fill,similarM_color,similarM_texture,firstBlob,secondBlob);
    similarM_size = updateSimilarityM_size(similarM_size,firstBlob,sizeM,totalSize);
    similarM_fill = updateSimilarityM_fill(similarM_fill,blobBoxes,firstBlob,sizeM,totalSize);
    similarM_color = updateSimilarityM_color(similarM_color,histM,firstBlob);
    similarM_texture = updateSimilarityM_texture(similarM_texture,textureM,firstBlob);
    
    %at last, add the index
    index = index + 1;
end

%we also need to add the original boxes after segmentation into it
conbineResult = [originalBoxes;resultBoundingBox];

duplicateThreshold = 0.01;
conbineResult = deduplicate(conbineResult, imageHeight*duplicateThreshold, imageWidth*duplicateThreshold);

end