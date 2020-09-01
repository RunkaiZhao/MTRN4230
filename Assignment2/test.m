orange1 = imread('oranges.jpg');
orange = rgb2gray(orange1);
orange = imbinarize(orange);
orange = imopen(orange,strel('disk',10));
orange = imclose(orange,strel('disk',20));
orange = bwareaopen(orange,900);
orange = bwareafilt(orange,[0 15000]);
orange = bwareaopen(orange,650);

rp = regionprops(orange, 'centroid','Circularity','Area','Perimeter');
i = find(cat(1,rp.Circularity) > 0.573);
c = cat(1,rp.Centroid);

figure;
imshow(orange1);
hold on;
plot(c(i,1),c(i,2),'g*');