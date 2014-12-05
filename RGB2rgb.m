function [ colourIm ] = RGB2rgb( im )


     singleIm = single(im);
     R = singleIm(:,:,1);
     G = singleIm(:,:,2);
     B = singleIm(:,:,3);

     NormalizedRed = R(:,:)./sqrt(R(:,:).^2+G(:,:).^2+B(:,:).^2);
     NormalizedGreen = G(:,:)./sqrt(R(:,:).^2+G(:,:).^2+B(:,:).^2);
     NormalizedBlue = B(:,:)./sqrt(R(:,:).^2+G(:,:).^2+B(:,:).^2);

     colourIm(:,:,1) = NormalizedRed(:,:);
     colourIm(:,:,2) = NormalizedGreen(:,:);
     colourIm(:,:,3) = NormalizedBlue(:,:);
     colourIm(isnan(colourIm))=0;
     


end