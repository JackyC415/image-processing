% Program description:
% To perform spatial filtering on a grayscale image and by taking the magnitude gradient to create an edge
version of the original image through applying a specific threshold to detect various edges desired. As the
edges and threshold appear to be inversely proportional, i.e, lower threshold, more edges.

% Parameters:
% grayscale_image - input grayscale image (matrix)
% filter - input filter (matrix)
% outImage - type double/uint8 image with same dimension as grayscale image
% threshold - a value specified by user; magnitude gradient of grayscale image

% Author : Jacky Z. Chen
% CSE 107 - Introduction to digital image processing
% Professor : Shawn Newsam
% TA: Yerlan Idelbayev
% November, 17th 2017
% Email: jchen255@ucmerced.edu

%function spatial filtering on any given image
function output = spatial_filter(image,filter)

%Zero paddings for matrix
rowPad  = size(filter,1)-1;
colPad  = size(filter,2)-1;
%Zero padding for temporary matrix
temp  =  zeros(rowPad + size(image,1), colPad+size(image,2));

%Loop through the matrix of 
for i = 1 + rowPad:size(temp,1) - rowPad
    for j =  1 + colPad:size(temp,2)-rowPad
        temp(i,j) = image(i-rowPad, j-rowPad);
    end
end

%size of output image
output = zeros(size(image,1),size(image,2));

%Computes spatial filtering for the output image using equation 3.40 provided 
%by the textbook Digital Image Processing by Rafel C. Gonzalez, 3rd edition
    for i = 1:size(image,1)
        for j = 1:size(image,2)
            for k = 1:size(filter,1)
                for l = 1:size(filter,2)
                    output(i,j) = output(i,j)+temp(i+k-1, j+k-1) * filter(k,l);
                end
            end
        end
    end
end
