% Test script for detecting a vertical line in an image using the Hough
% transform.

clear all;

% Create a blank image.
size_x = 100;
size_y = 100;
blank_image = zeros(size_x, size_y);

% Draw a vertical line one quarter through image. Specify line
% using normal form: theta=90 (degrees), rho=quarter image width. This line
% image is what we would get from edge detection as it only has two values,
% edge=255 and non-edge=0.
theta_true = 90;
rho_true = round( size_y / 4);
image_with_line = draw_line_on_image2( blank_image, theta_true, rho_true );

% View and write image.
imshow( image_with_line );
imwrite( image_with_line, 'vertical_line.tif' );

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
imwrite( accumulator_log, 'vertical_line_accumulator.tif' );