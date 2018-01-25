%function gradient magnitude inputs grayscale image and outputs a new image
function outImage = gradient_magnitude(grayscale_image)

%Derivative Gaussian approximation kernel
G_X =[-1 -2 -1; 0 0 0; 1 2 1];
G_Y =[-1 0 1; -2 0 2; -1 0 1];

%Compute spatial filter functions on two images with kernel x and y
%respectively
filterX = spatial_filter(grayscale_image, G_X);
filterY = spatial_filter(grayscale_image, G_Y);

outImage = double(grayscale_image);
%square root of the summation of filter x and y
outImage = sqrt((filterX).^2 + (filterY).^2);

%end function
end