%this is a script that will run the selective search on all the
%files(pictures) in a directory, all you have to do is to provide the name
%of the directory. 

%I add a size limit of the picture file here, just because that in my old
%computer, some big picutre will cause out of memory problem, this is a to
%do in the future

clc;clear all;

% the parameter you need to provide
dirName = '../icdar1003/SceneTrialTest/ryoungt_05.08.2002';


theDir = dir(dirName);
 
for i = 1:size(theDir,1)
    if ~theDir(i).isdir
        
        
        if theDir(i).bytes / 1024 < 800
            
            path = strcat(dirName,'/');
            path = strcat(path,theDir(i).name);
            
            [boxes, height, width] = selectiveSearch(path);
            
            outputFileName = strcat(dirName,'/');
            outputFileName = strcat(outputFileName, theDir(i).name(1:size(theDir(i).name,2)-4) );
            outputFileName = strcat(outputFileName,'.txt');
            
     
            fileID = fopen(outputFileName,'w');
            fprintf(fileID,'%3d %3d\n',height,width);
            fprintf(fileID,'%3d %3d %3d %3d\n',boxes');
            fclose(fileID);
            fprintf('%d %s\n',i,theDir(i).name);
        end
    end
end