%function inputs grayscale image and threshold value, outputs image
function [outImage] = find_edges(grayscale_image, threshold)
%output image is same dimension as input grayscale image
%threshold is the magnitude gradient of input grayscale image
magnitude = gradient_magnitude(grayscale_image);
%output image detects edge with specified threshold above
outImage = (magnitude*threshold);
%output image is type uint8
outImage = uint8(outImage);
end