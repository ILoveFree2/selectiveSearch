clc;clear;
k = 200;
para_size = 1;
para_fill = 2;
para_color = 1;
para_texture = 1;

for i = 1 : length(para_texture)
    testWithPara(k,para_size, para_fill, para_color, para_texture(i));
    path = ['my' num2str(k) '_' num2str(para_size) '_' num2str(para_fill) '_' num2str(para_color) '_' num2str(para_texture(i)) '_labhsv'];
    command = ['./evaluateAndBackupFiles.sh' ' ' path];
    [status cmdout] = system(command);
    fprintf('%d %d \n%s\n',i,status,cmdout);
end