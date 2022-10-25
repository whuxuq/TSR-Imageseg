clc;
clear;

file_path =  'E:\xiao_feng\BreastCaP\Res\';
files = dir(strcat(file_path,'original\','*.bmp'));
Length = length(files);
Ratio=zeros(Length, 1);
A_object=zeros(Length, 1);
A_background=zeros(Length, 1);

for i=1:Length
    I = imread(strcat(file_path,'original\',files(i).name));
    mask=imread(strcat(file_path, 'mask\',files(i).name));
    Im=rgb2gray(I);
    [BWfinal, RGB_label] = segment2(Im,100);
    Bwlabeled=labeloverlay(I,BWfinal);
    imwrite(Bwlabeled, strcat(file_path, 'labeled\', files(i).name));
    imwrite(BWfinal, strcat(file_path, 'segmented\', files(i).name));
    imwrite(RGB_label, strcat(file_path, 'RGB\', files(i).name));
    A_object(i)=bwarea(BWfinal);
    A_background(i)=bwarea(mask);
    Ratio(i)=A_object(i)/A_background(i);
end

save res.mat Ratio files
