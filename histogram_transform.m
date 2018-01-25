%function takes input histogram and outputs transformation
function [T] = histogram_transform(h)
T = zeros(256);
pixels = 256;
 
%pixel value of input image offset by 1
for i=1:pixels
    if (i == 1)
        T(i) = (h(i) * (pixels-1));
    else
        T(i) = (T(i-1) + (h(i) * (pixels-1)));
    end
end
T = round(T);
end