
%Detect red object
image_rgb = imread('sample3.png');
imageDetectRed = image_rgb;
image1 = image_rgb(:,:,1) > 230;
imshow(image1);
image2 = image_rgb(:,:,2) < 10;
image3 = image_rgb(:,:,3) < 10;
mask = image1 & image2 & image3;
mask = bwareaopen(mask,700);
rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
c = cat(1,rp.Centroid);
%imageDetectRed = imageDetectRed.*uint8(mask);
%imshow(imageDetectRed);
figure(1);
imshow(image_rgb);
[n,~]  = size(c);
i = 1;
while i < n+1
    xchar = int2str(c(i,1));
    ychar = int2str(c(i,2));
    str = strcat({'('}, xchar, {', '}, ychar, {')'});
    hold on; plot(c(i,1),c(i,2),'*');
    hold on; text(c(i,1)-80, c(i,2)-40, str, 'Color', 'r', 'FontSize', 6);
    i = i + 1;
end

%Detect yellow object
image_rgb = imread('sample3.png');
imageDetectYellow = image_rgb;
image1 = image_rgb(:,:,1) > 100;
image2 = image_rgb(:,:,2) > 100;
image3 = image_rgb(:,:,3) < 10;
mask = image1 & image2 & image3;
mask = bwareaopen(mask,700);
rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
c = cat(1,rp.Centroid);
hold on; plot(c(:,1), c(:,2), 'g*');
%imageDetectYellow = imageDetectYellow.*uint8(mask);
%imshow(imageDetectYellow);
[n,~]  = size(c);
i = 1;
while i < n+1
    xchar = int2str(c(i,1));
    ychar = int2str(c(i,2));
    str = strcat({'('}, xchar, {', '}, ychar, {')'});
    hold on; plot(c(i,1),c(i,2),'*');
    hold on; text(c(i,1)-80, c(i,2)-40, str, 'Color', 'y', 'FontSize', 6);
    i = i + 1;
end

%Detect green object
image_rgb = imread('sample3.png');
imageDetectGreen = image_rgb;
image1 = image_rgb(:,:,1) < 10;
image2 = image_rgb(:,:,2) > 250;
image3 = image_rgb(:,:,3) < 10;
mask = image1 & image2 & image3;
mask = bwareaopen(mask,700);
%imshow(mask);
rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
c = cat(1,rp.Centroid);
hold on; plot(c(:,1), c(:,2), 'g*');
%imageDetectGreen = imageDetectGreen.*uint8(mask);
%imshow(imageDetectGreen);
[n,~]  = size(c);
i = 1;
while i < n+1
    xchar = int2str(c(i,1));
    ychar = int2str(c(i,2));
    str = strcat({'('}, xchar, {', '}, ychar, {')'});
    hold on; plot(c(i,1),c(i,2),'*');
    hold on; text(c(i,1)-80, c(i,2)-40, str, 'Color', 'g', 'FontSize', 6);
    i = i + 1;
end

%Detect black object
image_rgb = imread('sample3.png');
imageDetectBlack = image_rgb;
image1 = image_rgb(:,:,1) < 10;
image2 = image_rgb(:,:,2) < 10;
image3 = image_rgb(:,:,3) < 10;
mask = image1 & image2 & image3;
imshow(mask);
mask = bwareaopen(mask,700);
rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
c = cat(1,rp.Centroid);
hold on; plot(c(:,1), c(:,2), 'g*');
[n,~]  = size(c);
i = 1;
while i < n+1
    xchar = int2str(c(i,1));
    ychar = int2str(c(i,2));
    str = strcat({'('}, xchar, {', '}, ychar, {')'});
    hold on; plot(c(i,1),c(i,2),'*');
    hold on; text(c(i,1)-80, c(i,2)-40, str, 'Color', 'k', 'FontSize', 6);
    i = i + 1;
end

