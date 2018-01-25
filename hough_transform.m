% Program description:
% To implement Hough transform function on an edge grayscale image using accumulator matrix and determining the most prominent line in the image based on the highest votes detected in the accumulator matrix cell.

% Parameters:
% theta_in: compute theta values output
% rho_in: compute rho pixel values output
% accumulator: computed accumulator matrix values output
% i_edge: input edge grayscale image
% diagonalSize: diagonal size dimension of input image
% mostVotes: highest votes detected in accumulator matrix

% Author : Jacky Z. Chen
% CSE 107 - Introduction to Digital Image Processing
% Professor : Shawn Newsam
% TA: Yerlan Idelbayev
% Dec, 6th 2017
% Email: jchen255@ucmerced.edu

%hough_transform function inputs edged image and outputs theta, rho & accumulator
function [theta_out, rho_out, accumulator] = hough_transform(i_edge)
 
%%PART A) empty accumulator matrix, one column for each theta degree (-89~90),
%%one row for each rho value, rho ranges between -D & D
 %initalization%
%Input image is a matrix
[Irows,Icols] = size(i_edge);
%diagonal size of input image
diagonalSize = round(hypot(Irows,Icols));
%negative diagonal of image
negativeDiagonal = -1*diagonalSize;
%empty accumulator matrix with specified dimensions by instructions
accumulator = zeros((2*diagonalSize)+1, 180);
%range of theta values [-89,90]
theta_range = -89.0:90.0;
%theta offset value to prevent subscript indices error
offset = 90;
 
%%PART B) edge point -> (x,y) -> rho and theta -> equation, theta ranges
%%values (-89 to 90) and compute rho. Determine votes for accumulator,
%%ensure cos and sine in degrees, remember ranges of indices for
%%accumulator
 %Loop through input image matrix
for x = 1:Irows
    for y = 1:Icols
        %value 255 stands for edge points; for every edge points in image
        if i_edge(x,y) == 255
            %for theta ranging from values -89 to 90
            for theta_in = theta_range
                %compute equation of rho; cos and sine in degree format
                rho_in = int32(ceil(x*cosd(theta_in)) + (y*sind(theta_in)));
                %accumulator increments by one every time with accumulator
                %indices being computed rho + diagonal size of image and theta values with its offset
accumulator(rho_in+diagonalSize,theta_in+offset)= accumulator(rho_in+diagonalSize,theta_in+offset) + 1;
            end
        end
    end
end
 
%%PART C)once visited every edge points, determine the max votes in
%%accumulator -> obtain theta/rho for most prominent line in image,
%%remember ranges of indices.
%accumulator matrix
[accumulatorRows,accumulatorCols] = size(accumulator);
%determines the cell with highest votes in the accumulator;
mostVotes = 0;
%Loop through the accumulator matrix with rho_in and theta_in
for rho_in = 1:accumulatorRows
    for theta_in = 1:accumulatorCols
 %Keep checking for highest votes in accumulator and return that value
            if (accumulator(rho_in, theta_in) > mostVotes)
 %determine the most prominent line in the image by finding the highest votes in accumulator   cell then obtain theta_out and rho_out based on that set of data
            mostVotes = accumulator(rho_in, theta_in);
            rho_out = (rho_in- diagonalSize);
            theta_out = (theta_in - offset);
        end
    end
end