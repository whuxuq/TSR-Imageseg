function mask = genMask1(Im,nD)
    mask=Im; 
    mean=mean2(mask(1:100,1:100));
    std=std2(mask(1:100,1:100));
    T=mean-2*std;
    mask(mask<T)=0;
    mask(mask>T)=255;
    mask=255-mask;
    mask = bwareaopen(mask,100);
    se90 = strel('line',nD,90);
    se0 = strel('line',nD,0);
    mask = imdilate(mask,[se90 se0]);
    mask=imfill(mask, 'holes');
    mask = imerode(mask,[se90 se0]);
    mask = bwareaopen(mask,100000);
end