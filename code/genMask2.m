function mask = genMask2(Im, N)
    [~,threshold] = edge(Im,'sobel');
    fudgeFactor = 0.5;
    BWs = edge(Im,'sobel',threshold * fudgeFactor);
    
    se90 = strel('line',3,90);
    se0 = strel('line',3,0);
    for i=1:N
        BWs = imdilate(BWs,[se90 se0]);
        BWs = imfill(BWs,'holes');
    end
    
    seD = strel('diamond',1);
    for i=1:N
        BWs = imerode(BWs,seD);
        BWs = imerode(BWs,seD);
    end
    mask = bwareaopen(BWs,10000);
end