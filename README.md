# EEE4022F-Final-year-project

#MATLAB Image Processing and Analysis Scripts
This repository contains a set of MATLAB scripts for various image processing and analysis tasks, including video frame extraction, image extraction from ROS bags, stereo image rectification, length and width per pixel calculation, size estimation, and edge detection. Below is a description of each script and its functionality.

#File Descriptions
VideoFrameExtraction.m
This script extracts frames from a specified video file and saves them as JPEG images in a designated output folder.

Usage:
Update the videoFile variable with the path to your video file.
Specify the outputFolder for saving the extracted frames.
Run the script to extract and save the frames.
rosebag_image_extraction.m
This script extracts images from a ROS bag file and saves them in specified folders for left and right camera images.

Usage:
Update the bag variable with the path to your ROS bag file.
Set the topics for left and right camera images.
Specify the folders to save the extracted images.
Run the script to extract and save the images.
stereoRectification.m
This script performs stereo rectification on a pair of stereo images and computes the disparity maps for both unrectified and rectified images.

Usage:
Load or capture the stereo images.
Perform feature detection, matching, and rectification.
Compute and display the disparity maps.
LWperPixel.m
This script calculates the length and width per pixel for a given reference object in an image based on user input.

Usage:
Load the image file.
Select two points for length and width measurement.
Define the physical dimensions of the reference object.
Run the script to calculate and display the length and width per pixel.
sizeEstimate.m
This script estimates the size of an object in a stereo image pair using disparity information and stereo camera parameters.

Usage:
Load the stereo camera parameters.
Capture or load the stereo images.
Perform image preprocessing and segmentation.
Calculate and display the object size and area.
edge detect.m
This script detects pancake ice floes in an image using various image processing techniques, including adaptive thresholding, morphological operations, and roundness analysis.

Usage:
Load the image file.
Perform adaptive thresholding, morphological closing, and hole filling.
Trace the exterior boundaries and analyze the roundness of detected objects.
Display the results with roundness metrics.
General Instructions
Ensure MATLAB is installed on your system.
Place the scripts in your MATLAB working directory.
Update the file paths and parameters as needed in each script.
Run the scripts in MATLAB to perform the desired image processing and analysis tasks.
Dependencies
MATLAB with Image Processing Toolbox
ROS Toolbox (for rosebag_image_extraction.m)
License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
These scripts were developed for various image processing and analysis tasks in MATLAB. Special thanks to the MATLAB documentation and community for their valuable resources and support.
