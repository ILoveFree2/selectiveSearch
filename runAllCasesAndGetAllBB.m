addpath('../Challenge2_Training_Task12_Images');

for i = 100:328
    imageName = strcat(int2str(i),'.jpg');
    path = '../Challenge2_Training_Task12_Images/';
    path = strcat(path,imageName);
    fileInfo = dir(path);
    fileSize = fileInfo.bytes / 1024 ;
    if fileSize < 800
        [boxes, height, width] = selectiveSearch(imageName);
        fileName = strcat(int2str(i),'.txt');
        fileID = fopen(fileName,'w');
        fprintf(fileID,'%3d %3d\n',height,width);
        fprintf(fileID,'%3d %3d %3d %3d\n',boxes');
        fclose(fileID);
        fprintf('%d\n',i);
    end
end