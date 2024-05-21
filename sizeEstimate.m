% Load the stereo parameters
load('stereoParams.mat');

% Capture stereo images (replace with actual image capture code)
I1 = imread('Experiment_1\left\left_image_10.jpg');
I2 = imread('Experiment_1\right\right_image_10.jpg');

% Preprocess the images: downscale and convert to grayscale
leftImageGray = rgb2gray(I1);
rightImageGray = rgb2gray(I2);

% Remove noise using median filtering
leftImageFiltered = medfilt2(leftImageGray);
rightImageFiltered = medfilt2(rightImageGray);

% Here, open the Image Segmenter app and manually segment the object:
% 1. Open the Image Segmenter app: `imageSegmenter(leftImageFiltered)`
% 2. Draw an ROI around the object and create a binary mask.
% 3. Export the mask to the workspace as `BW`.
% 4. Repeat for the right image and export the mask as `BW1`.

% For demonstration, the masks are assumed to be saved as BW and BW1
% Uncomment the following lines after generating the binary masks manually:
imageSegmenter(leftImageFiltered); % Manually segment and export as BW
imageSegmenter(rightImageFiltered); % Manually segment and export as BW1

% Check if the masks have been generated and loaded
if ~exist('BW', 'var') || ~exist('BW1', 'var')
    error('Segmentation masks BW and BW1 not found. Please generate them using the Image Segmenter app.');
end

% Connected component analysis to segment objects using the masks
leftStats = regionprops(BW, 'BoundingBox', 'Centroid');
rightStats = regionprops(BW1, 'BoundingBox', 'Centroid');

% Check if any objects are detected in the masks
if isempty(leftStats) || isempty(rightStats)
    error('No objects detected in one or both of the binary masks.');
end

% Assuming one object of interest, find its disparity
leftCentroid = leftStats(1).Centroid;
rightCentroid = rightStats(1).Centroid;
disparity = abs(leftCentroid(1) - rightCentroid(1)); % Disparity in pixels

% Calculate distance using disparity
baseline = norm(stereoParams.TranslationOfCamera2); % Baseline in meters
focalLength = stereoParams.CameraParameters1.FocalLength(1); % Focal length in pixels

% Calculate object size
leftBBox = leftStats(1).BoundingBox;
widthInPixels = leftBBox(3);
heightInPixels = leftBBox(4);

% Assuming linear relationship between size and disparity
widthPerPixel = 0.004348; % Replace with calculated value
heightPerPixel = 0.006453; % Replace with calculated value
objectWidth = widthPerPixel * widthInPixels;
objectHeight = heightPerPixel * heightInPixels;

% Calculate the area of the object
objectArea = objectWidth * objectHeight;

% Display results
fprintf('Object width: %.2f meters\n', objectWidth);
fprintf('Object height: %.2f meters\n', objectHeight);
fprintf('Object area: %.2f square meters\n', objectArea);


