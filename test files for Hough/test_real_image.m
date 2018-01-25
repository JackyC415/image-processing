% Test script for detecting the most prominent line in an image using the
% Hough transform.

clear all;

% Read image.
i = imread( 'runway_image.tif' );

% Display image.
figure;
imshow(i);

% Compute edge image using Canny edge detector.
i_edge = edge(i, 'canny');

% Edge function produces 0,1 image so covert to 0,255 image which is what
% our Hough tranform function expects.
i_edge = i_edge * 255;

% Display edge image.
figure;
imshow(i_edge);
imwrite( i_edge, 'runway_image_edge.tif' );

% Detect most prominent line.
[theta_est, rho_est, accumulator] = hough_transform( i_edge );

% Report true and estimated line parameters.
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
imwrite( accumulator_log, 'runway_image_accumulator.tif' );

% Draw estimated line on image.
image_with_line = draw_line_on_image2( i, theta_est, rho_est );
figure;
imshow(image_with_line);
imwrite( image_with_line, 'runway_image_with_line.tif' );



