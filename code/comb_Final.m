clc;
clear;

I1(:,:,1)=0*ones(2718,2718);
I1(:,:,2)=250*ones(2718,2718);
I1(:,:,3)=250*ones(2718,2718);
I2(:,:,1)=250*ones(2718,2718);
I2(:,:,2)=0*ones(2718,2718);
I2(:,:,3)=250*ones(2718,2718);

file_path =  'E:\BreastCaP\Res\';
files = dir(strcat(file_path,'original\','*.bmp'));
Length = length(files);
Ratio=zeros(Length, 1);

for i=1:Length
    mask=imread(strcat(file_path, 'mask\',files(i).name));
    Mask(:,:,1)=mask;Mask(:,:,2)=mask;Mask(:,:,3)=mask; 
    seg=imread(strcat(file_path, 'segmented\',files(i).name));
    Seg(:,:,1)=seg;Seg(:,:,2)=seg;Seg(:,:,3)=seg;
    obj=Seg.*I2;back=(1-Seg).*I1;
    Final=(obj+back).*Mask;
    imwrite(Final, strcat(file_path, 'Final\', files(i).name));
end