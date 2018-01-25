% Test script for detecting a randomly oriented line in an image using the
% Hough transform.

clear all;

% Create a blank image.
size_x = 100;
size_y = 100;
blank_image = zeros(size_x, size_y);

% Diagonal size of image.
size_d = floor(sqrt( size_x^2 + size_y^2 ));

% Can't detect lines that have too few edge points (i.e., ones that only
% pass throug the corner of an image) or ones that don't even cross the
% image. So, set a threshold that the line should constitute 20 percent of
% diagonal size of image.
percent_edge_points = 0.2;

% Draw a randomly oriented line through the image.
% Keep creating sample images until enough of the line appears in the image
% for the Hough transform to work.
num_edge_pixels = 0;
while num_edge_pixels < (percent_edge_points * size_d)

    % Compute random theta from -89 to 90 inclusive.
    theta_true = randi( [-89 90] );
    
    % Compute random rho from -size_d to size_d. Note, though, that many of
    % these lines will not actually cross the image. Thus the test for a
    % line of minimum length.
    rho_true = randi( [-size_d size_d]);
    
    image_with_line = draw_line_on_image2( blank_image, theta_true, rho_true );
        
    % Count the number of edge pixels.
    num_edge_pixels = nnz( image_with_line );
end
    
% View and write image.
imshow( image_with_line );
imwrite( image_with_line, 'random_line1.tif' );

% Find (most prominent) line using Hough transform.
[theta_est, rho_est, accumulator] = hough_transform( image_with_line );

% Report true and estimated line parameters.
fprintf( 1, 'True theta = %d, true rho = %d\n', theta_true, rho_true );
fprintf( 1, 'Estimated theta = %d, estimated rho = %d\n', theta_est, rho_est );

% Compute log of accumulator matrix because its dynamic range is typically
% too large to visualize details.
accumulator_log = log( accumulator );

% Scale it to [0,1].
accumulator_log = accumulator_log / max(accumulator_log(:));

% View log of accumulator.
figure;
imshow(accumulator_log, [0 max(accumulator_log(:))]);

% Write log of accumulator to file.
imwrite( accumulator_log, 'random_line1_accumulator.tif' );



