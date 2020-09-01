q = 'What is the number of picks? ';
numPicks = input(q);

colors = zeros(1, numPicks);
shapes = zeros(1, numPicks);
colors = string(colors);
shapes = string(colors);
objectColor = 'Please type in color: ';
objectShape = 'Please type in shape: ';

for i = 1:numPicks
    str = sprintf('Object %d', i);
    disp(str);
    str1 = input(objectColor, 's');
    colors(i) = str1;
    str2 = input(objectShape, 's');
    shapes(i) = str2;
    
    disp(newline);
end

% image_rgb = imread('tes1t.jpg');
% imageDetectBlack = image_rgb;
% image1 = image_rgb(:,:,1) > 50;
% image2 = image_rgb(:,:,2) < 25;
% image3 = image_rgb(:,:,3) < 50;
% mask = image1 & image2 & image3;
% figure(1);
% imshow(mask);
% rp1 = regionprops(mask, 'Area', 'Centroid', 'Circularity', 'Perimeter');
% 
% image_rgb = imread('test2.jpg');
% imageDetectGreen = image_rgb;
% image1 = image_rgb(:,:,1) < 50;
% image2 = image_rgb(:,:,2) > 200;
% image3 = image_rgb(:,:,3) < 50;
% mask = image1 & image2 & image3;
% figure(2);
% imshow(mask);
% rp2 = regionprops(mask, 'Area', 'Centroid', 'Circularity', 'Perimeter');
% 
% image_rgb = imread('test4.jpg');
% imageDetectYellow = image_rgb;
% image1 = image_rgb(:,:,1) > 150;
% image2 = image_rgb(:,:,2) > 150;
% image3 = image_rgb(:,:,3) < 100;
% mask = image1 & image2 & image3;
% figure(3);
% imshow(mask);
% rp3 = regionprops(mask, 'Area', 'Centroid', 'Circularity', 'Perimeter');
% 
% % image_rgb = imread('bug1.jpg');
% % imageDetectYellow = image_rgb;
% % image1 = image_rgb(:,:,1) < 20;
% % image2 = image_rgb(:,:,2) < 20;
% % image3 = image_rgb(:,:,3) < 30;
% % mask = image1 & image2 & image3;
% % mask = bwareaopen(mask,1500);
% % index = find(mask == 1);
% % figure(1);
% % imshow(mask);
% % rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
% % c = cat(1,rp.Centroid);
% 
% % image_rgb = imread('sample3.png');
% % imageDetectBlack = image_rgb;
% % image1 = image_rgb(:,:,1) > 75;
% % image2 = image_rgb(:,:,2) < 50;
% % image3 = image_rgb(:,:,3) < 50;
% % mask = image1 & image2 & image3;
% % index = find(mask == 1);
% % figure(1);
% % imshow(mask);
% % rp = regionprops(mask, 'Area', 'Centroid', 'Circularity');
% % c = cat(1,rp.Centroid);
% % 
% % image_rgb = imread('test.jpg');
% % imageDetectBlack = image_rgb;
% % image1 = image_rgb(:,:,1) > 50;
% % image2 = image_rgb(:,:,2) < 25;
% % image3 = image_rgb(:,:,3) < 50;
% % mask = image1 & image2 & image3;
% % figure(2);
% % imshow(mask);
% % rp1 = regionprops(mask, 'Area', 'Centroid', 'Circularity');


