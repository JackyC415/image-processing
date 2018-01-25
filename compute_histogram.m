%function outputs vector h with values from 0-1 and inputs grayscale image 
function [h] = compute_histogram(grayscale_image)
%matrix of input image
[nRows,nCols] = size(grayscale_image);
%vector h with length 256
h(1:256) = 0;
%Determines number of elements in the grayscale image
for k = 0:255
    for i = 1:nRows
        for j = 1:nCols
            if grayscale_image(i,j) == k
                h(k+1) = h(k+1)+1;
            end
        end
    end
end
%normalized histogram of values in grayscale image
h = h/(nRows*nCols);
end
