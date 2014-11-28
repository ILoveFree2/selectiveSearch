function [ im ] = drawRectangleOnImage( im, boundingbox )
%drawRectangleOnImage : can draw all the bounding boxes with random color
%on im
% im: the input image
% boundingbox: the input bounding boxes, it is an n*4 matrix
% im: the output image with all the bounding boxes on them


for i = 1:size(boundingbox,1)

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

end