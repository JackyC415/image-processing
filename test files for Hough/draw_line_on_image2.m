function image_out = draw_line_on_image2( image_in, theta, rho )
% draw_line_on_image2  Draw a line on an image. The line is specified using
% the theta and rho parameters of its normal form. The pixels corresponding
% to the line are set to 255. The other pixels are not touched. The input
% should be a grayscale image.
%
% Syntax:
%   image_out = draw_line_on_image2( image_in, theta, rho )
%
% Input:
%   in_image = The grayscale image on which to draw the line.
%   theta = The angle of the line in degrees. Horizonal is 0.
%   rho = The length of the perpendicular bisector in pixels.
%
% Output:
%   image_out = The image with the line drawn.
%
% History:
%   S. Newsam     11/12/2017   created

% Determine size of image.
[size_x, size_y] = size(image_in);

% Output has same size and same pixel values except where line is drawn.
image_out = image_in;

% If theta is between -45 and 45, vary y.
if abs(theta) <= 45
    % Range over all values of y in image.
    for y=0:size_y
        % Determine x location of line point using normal form.
        x = round( ((rho-1) - (y * sind(theta))) / cosd(theta) );
        % Make sure not off edge of image.
        if 0 <= x && x <= size_x - 1
            % Write line point.
            image_out( x+1, y+1 ) = 255;
        end
    end
    
% If theta is not between 45 and 45, vary x    
else
    % Range over all values of x in image.
    for x=0:size_x
        % Determine y location of line point using normal form.
        y = round( ((rho-1) - (x * cosd(theta))) / sind(theta) );
        % Make sure not off edge of image.
        if 0 <= y && y <= size_y - 1
            % Write line point.
            image_out( x+1, y+1 ) = 255;
        end
    end
end

end

