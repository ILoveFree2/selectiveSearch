function [] = testWithPara(theK,para_size,para_fill,para_color,para_texture)

%this is a script that will run the selective search on all the
%files(pictures) in a directory, all you have to do is to provide the name
%of the directory. 

%I add a size limit of the picture file here, just because that in my old
%computer, some big picutre will cause out of memory problem, this is a to
%do in the future



dirName = {'../icdar1003/SceneTrialTest/ryoungt_13.08.2002', '../icdar1003/SceneTrialTest/ryoungt_05.08.2002','../icdar1003/SceneTrialTest/sml_01.08.2002'};


for j = 1:length(dirName)

    theDir = dir(dirName{j});

    for i = 1:size(theDir,1)
        if ~theDir(i).isdir


            if theDir(i).bytes / 1024 < 800

                path = strcat(dirName{j},'/');
                path = strcat(path,theDir(i).name);
       
                [boxes1, ~, ~] = selectiveSearch(path,theK,para_size,para_fill,para_color,para_texture);
                [boxes2, height, width] = selectiveSearchWithLab(path,theK,para_size,para_fill,para_color,para_texture);
                boxes = [boxes1; boxes2];
                duplicateThreshold = 0.01;
                boxes = deduplicate(boxes, height*duplicateThreshold, width*duplicateThreshold);

                
                outputFileName = strcat(dirName{j},'/');
                outputFileName = strcat(outputFileName, theDir(i).name(1:size(theDir(i).name,2)-4) );
                outputFileName = strcat(outputFileName,'.txt');
                
%                 %draw the bounding boxes on the image
%                 theImage = imread(path);
%                 theImage = drawRectangleOnImage(theImage,boxes);
%                 outputPath = '../icdar1003/SceneTrialTest/withBoxes/';
%                 outputPath = strcat(outputPath,theDir(i).name);
%                 imwrite(theImage,outputPath);

                fileID = fopen(outputFileName,'w');
                fprintf(fileID,'%3d %3d\n',height,width);
                fprintf(fileID,'%3d %3d %3d %3d\n',boxes');
                fclose(fileID);
                fprintf('%d %s\n',i,theDir(i).name);
            end
        end
    end


end

end