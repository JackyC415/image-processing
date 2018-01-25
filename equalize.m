%function inputs grayscale image and outputs equalized image
function [equalized_image] = equalize(grayscale_image)
[nRows,nCols] = size(grayscale_image);
%Calling compute_histogram, plot_histogram and histogram_transform for grayscale images
h = compute_histogram(grayscale_image);
plot_histogram(h);
bar(h);
T = histogram_transform(h);
grayscale_image = double(grayscale_image);
 
%Transforms grayscale image into equalized image
equalized_image = zeros(nRows,nCols);
for i = 1:nRows
    for j = 1:nCols
        equalized_image(i,j) = T(grayscale_image(i,j)+1);
    end
end
 
%Calling compute_histogram, plot_histogram and for equalized images
equalizeh = compute_histogram(equalized_image);
plot_histogram(equalizeh);
bar(equalizeh);
%Convert image type into double before computing mean and std
equalized_image = double(equalized_image);
%Computing mean of equalized image
Mean = mean(equalized_image(:));
%Computing standard deviation of equalized image
Standard_Deviation = std(equalized_image(:));
%display mean value
disp('Mean value: ');
disp(Mean);
%display standard deviation value
disp('Standard deviation value: ');
disp(Standard_Deviation);
%Convert equalized image into type uint8
equalized_image = uint8(equalized_image); 
end
