function [  ] = drawRectangleOnDifferentImage( inputIm, boundingbox, imageNum )
%drawRectangleOnImage : can draw all the bounding boxes with random color
%on im, there may be too much rectangle on the same image , so that I split
%them into different images
% inputIm: the input image
% boundingbox: the input bounding boxes, it is an n*4 matrix
% imageNum: the number of different images

for j = 1:imageNum
    
    im = inputIm;
    for i = j:imageNum:size(boundingbox,1)

        coor1 = boundingbox(i,1);
        coor2 = boundingbox(i,2);
        coor3 = boundingbox(i,3);
        coor4 = boundingbox(i,4);

        %this is the random color for the
        R = uint8(randi(255,1,1));
        G = uint8(randi(255,1,1));
        B = uint8(randi(255,1,1));

        %left line
        im(coor1:coor3,coor2,1) = R;
        im(coor1:coor3,coor2,2) = G;
        im(coor1:coor3,coor2,3) = B;

        %right line
        im(coor1:coor3,coor4,1) = R;
        im(coor1:coor3,coor4,2) = G;
        im(coor1:coor3,coor4,3) = B;

        %above line
        im(coor1,coor2:coor4,1) = R;
        im(coor1,coor2:coor4,2) = G;
        im(coor1,coor2:coor4,3) = B;


        %above line
        im(coor3,coor2:coor4,1) = R;
        im(coor3,coor2:coor4,2) = G;
        im(coor3,coor2:coor4,3) = B;

    end
    figure()
    imshow(im);
    
    resultName = ['resultImage' num2str(j) '.jpg'];
    imwrite(im,resultName);
    
    
end

end