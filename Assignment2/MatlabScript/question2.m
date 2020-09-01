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