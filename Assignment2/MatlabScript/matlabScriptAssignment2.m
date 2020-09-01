 
%% Part 1

% Question 1, Part 1
image = imread('toysflash.png');
[h, w, d] = size(image);
info = imfinfo("toysflash.png");

% Question 2, Part 1
image = imread('toysflash.png');
imageRed = image(:,:,1) > 80;
imageGreen = image(:,:,2) > 220;
imageBlue = image(:,:,3) < 80;

mask = zeros(684,912);
mask(330:end,635:850) = 1;

image = imcomplement (imageRed | imageGreen | imageBlue);
imageCup = image.*mask;
figure(1);
imshow(imageCup);

% Question 3, Part 1
image = imread('toysflash.png');
imageRed = image(:,:,1) > 170;
imageGreen = image(:,:,2) > 120;
imageBlue = image(:,:,3) > 75;
imageBall = imageRed & imageGreen & imageBlue;
imageBall = bwareaopen(imageBall, 22000);
figure(2);
imshow(imageBall);

% Question 3, Part 1
toyFlash = imread('toysflash.png');
Mask = imageCup | imageBall;
figure(3);
imshow(toyFlash.*uint8(Mask));

%% Part 2
image = rgb2gray(imread('chess_knights_run.png'));
points = detectSURFFeatures(image);
[features, valid_points] = extractFeatures(image, points);
figure(1);
imshow(image);
hold on;
plot(valid_points.selectStrongest(20), 'showOrientation', true);

image1 = rgb2gray(imread('chess_knights_run.png'));
image2 = rgb2gray(imread('knight.png'));
%find the SURF features
points1 = detectSURFFeatures(image1);
points2 = detectSURFFeatures(image2);
%extract the features
[f1,vpts1] = extractFeatures(image1,points1);
[f2,vpts2] = extractFeatures(image2,points2);
%
[indexPairs, matchMetric] = matchFeatures(f1,f2);
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));
figure(2); 
showMatchedFeatures(image1,image2,matchedPoints1,matchedPoints2, 'montage');

indexLeftFaceKnight = find(matchMetric < 0.001);
indexRightFaceKnight =  find((0.0030 < matchMetric) & (matchMetric < 0.0031));

matchedPointsLFKnight = vpts1(indexPairs(indexLeftFaceKnight), :);
matchedPointsRFKnight =  vpts1(indexPairs(indexRightFaceKnight), :);

xLocationLFKnight = mean(matchedPointsLFKnight.Location(:,1));
yLocationLFKnight = mean(matchedPointsLFKnight.Location(:,2));
xLocationRFKnight = mean(matchedPointsRFKnight.Location(:,1));
yLocationRFKnight = mean(matchedPointsRFKnight.Location(:,2));

distance = sqrt((xLocationLFKnight-xLocationRFKnight)^2+(yLocationLFKnight-yLocationRFKnight)^2);

index = [indexLeftFaceKnight; indexRightFaceKnight];
figure(3); 
showMatchedFeatures(image1,image2,vpts1(indexPairs(index,1)),vpts2(indexPairs(index,2)), 'montage');


%% Question 1, Part 3
% orange1 = imread('oranges.jpg');
% orange = rgb2gray(orange1);
% bw_orange = imbinarize(orange);
% bw_orange = imerode(bw_orange,strel('disk',8));
% % bw_orange = bwareaopen(bw_orange,200);
% bw_orange = imclose(bw_orange,strel('disk',14));
% bw_orange = imerode(bw_orange,strel('disk',2));
% % imshow(bw_orange);
% % hold on;
% rp = regionprops(bw_orange, 'centroid','Circularity','Area','Perimeter');
% i = find(cat(1,rp.Circularity) > 0.372 & cat(1,rp.Area) > 210);
% c = cat(1,rp.Centroid);
% imshow(orange1);
% hold on;
% plot(c(i,1),c(i,2),'g*');

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

%% Question 2, Part 3

orange1 = imread('oranges.jpg');
orange = rgb2gray(orange1);
orange = imbinarize(orange);
orange = imerode(orange,strel('disk',9));
orange = bwareaopen(orange,400);
orange = imopen(orange,strel('disk',4));
rp = regionprops(orange, 'centroid','Circularity','Area','PixelIdxList');
i = find(cat(1,rp.Circularity) > 0.45 & cat(1,rp.Area) > 220);
c = cat(1,rp.Centroid);
pixelRemove = cat(1, rp(i).PixelIdxList);
orange(pixelRemove) = 0;
orange = imopen(orange,strel('disk',2));
mask = imcomplement(orange);
imshow(mask);
orange1(:,:,1) = orange1(:,:,1).*uint8(mask);
orange1(:,:,2) = orange1(:,:,2).*uint8(mask);
orange1(:,:,3) = orange1(:,:,3).*uint8(mask);
figure;
imshow(orange1);

%% Question 3, Part 3

% orange1 = imread('oranges.jpg');
% orange = rgb2gray(orange1);
% bw_orange = imbinarize(orange);
% bw_orange = imerode(bw_orange,strel('disk',9));
% bw_orange = bwareaopen(bw_orange,400);
% bw_orange = imopen(bw_orange,strel('disk',4));
% rp = regionprops(bw_orange, 'centroid','Circularity','Area','PixelIdxList');
% i = find(cat(1,rp.Circularity) > 0.45 & cat(1,rp.Area) > 220);
% c = cat(1,rp.Centroid);
% pixel = cat(1, rp(i).PixelIdxList);
% bw_orange(pixel) = 0;
% bw_orange = imopen(bw_orange,strel('disk',2));
% bw_orange = imclose(bw_orange,strel('disk',150));
% % imshow(bw_orange); hold on;
% bw_orange = imcomplement(bw_orange);
% rp = regionprops(bw_orange, 'centroid','Circularity','Area','PixelIdxList', 'Perimeter', 'Solidity', 'MinorAxisLength');
% i = find(cat(1,rp.Area) > 85500 & cat(1,rp.Area) < 238650 & cat(1,rp.Circularity) > 0.7604 & cat(1,rp.Circularity) < 0.9780 & cat(1,rp.Perimeter) > 1093 & cat(1,rp.Perimeter) < 1778 & cat(1,rp.MinorAxisLength) > 469); %& cat(1,rp.MinorAxisLength) < 428 & cat(1,rp.MinorAxisLength) > 505
% ii = find(cat(1,rp.Area) > 85500 & cat(1,rp.Area) < 238650 & cat(1,rp.Circularity) > 0.7604 & cat(1,rp.Circularity) < 0.9780 & cat(1,rp.Perimeter) > 1093 & cat(1,rp.Perimeter) < 1778 & cat(1,rp.MinorAxisLength) < 444 & cat(1,rp.Solidity) > 0.97);
% i = [i; ii];
% index = [1:1:24];
% index(i) = [];
% pixelUnuse = cat(1,rp(index).PixelIdxList);
% bw_orange(pixelUnuse) = 0;
% bw_orange = imcomplement(bw_orange);
% imshow(bw_orange);
% orange1(:,:,1) = orange1(:,:,1).*uint8(bw_orange);
% orange1(:,:,2) = orange1(:,:,2).*uint8(bw_orange);
% orange1(:,:,3) = orange1(:,:,3).*uint8(bw_orange);
% figure;
% imshow(orange1);

orange1 = imread('oranges.jpg');
orangeRed = orange1(:,:,1) < 150;
orangeGreen = orange1(:,:,2) < 80;
orangeBlue = orange1(:,:,3) < 80;
orange = imcomplement (orangeRed | orangeGreen | orangeBlue);
orange = imerode(orange,strel('disk',8));
orange = imclose(orange,strel('disk',11));
orange = bwareaopen(orange, 500);
orange = padarray(orange,[1 1],1,'post');
orange = padarray(padarray(orange,[1 0],1,'post'),[0 1],1,'pre');

orange = imfill(orange,'holes');
orange =orange(1:end-1,2:end);
orange(1,:) = false;
orange(end,:) = false;
orange(:,1) = false;
orange(:,end) = false;
orange = bwareaopen(orange, 48000);
%imshow(bw_orange);
orange = imcomplement(orange);
imshow(orange);
orange(:, 2401) = [];
orange(1601, :) = [];
orange1(:,:,1) = orange1(:,:,1).*uint8(orange);
orange1(:,:,2) = orange1(:,:,2).*uint8(orange);
orange1(:,:,3) = orange1(:,:,3).*uint8(orange);

figure;
imshow(orange1);