function [BWfinal, RGB_label] = segment2(Im, T)
level = graythresh(Im); 
Im = im2bw(Im,level);
Im=1-Im;
%title('Binarized Image');

Im=imfill(Im,'holes');
BWfinal=bwareaopen(Im,T);
%title('segmented Image');

cc = bwconncomp(BWfinal,4);
labeled = labelmatrix(cc);
RGB_label = label2rgb(labeled,'spring','c','shuffle');
%title('Labeled RGB Image')
end