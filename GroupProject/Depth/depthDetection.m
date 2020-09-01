image_rgb = imread('blackRGB.jpg');
image_Depth = imread('black.jpg');
imageDetectBlack = image_rgb;
image1 = image_rgb(:,:,1) < 20;
image2 = image_rgb(:,:,2) < 20;
image3 = image_rgb(:,:,3) < 30;
mask = image1 & image2 & image3;
mask = bwareaopen(mask,1500);
index = find(mask == 1);
figure(1);
imshow(mask); hold on;
rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
c = cat(1,rp.Centroid);
plot(c(:,1), c(:,2), 'b*');


