# Hough Transformation

# Abstract:

The goal of this project is to implement the Hough transform function which seeks aligned coordinates in an image that generate lines. The input image is converted to its edged version which is required prior to applying the Hough transform on that image. The concept of Hough transform is to essentially extract features of an image. Through applying the technique of Hough transform, it is useful for detecting any parametric curves, such as lines, circles, and ellipses of an object; however, our goal is primary focused on lines detection. Moreover, when given a set of edge points, the algorithm will be able to find the most prominent lines that effectively describe a set of data. The objective is to implement the Hough transform function with three parameters; specifically, rho, theta and accumulator, that will be tested among the test scripts and to generate the results from running test_random_line.m  three times. Finally, we conclude by discussing the most difficult aspect of implementing Hough transform in our discussion results section.

# Technical discussion:

The implementation required for Hough transform is an empty row times column (dimension is equivalent to the amount of unknown parameters) matrix accumulator which detects the existence of a line represented by the equation rho = x*cos(theta) + y*cos(theta). Essentially, the Hough transform algorithm determines the existence of a line within the neighborhood pixels and increments the accumulator based on the parameters of rho and theta. By discovering local maxima in the accumulator space, we will be able to obtain and extract those lines. Figure 10.32 shown below represents: a) two different coordinates (Xi,Yi) and (Xj,Yj) which constitute a straight line essentially in the form of a line equation (y = ax+b) and the theta angle between the line and the image (x,y). b) the intersections of those two coordinates mentioned and their representation of given parameters in terms of sinusoidal waves. c) transcends from (x,y) image coordinate system to a new (theta,rho) system where theta and rho are discretized; essentially this represents the hough transformation of an image via the rho equation and the sinusoidal curves in this accumulator cell will be in terms of “votes” and these votes are proportionally to the amount of lines accumulated. Finally, we will determine the maxima vote(s); the lines that produce the greatest intersections

# Result:

The most difficult aspect of implementing the Hough transform function was getting the accumulator matrix to work. At the beginning, I ran into numerous subscript indices error which prevented me from testing my program. Furthermore. My theta and rho values were extremely off compared to the actual results due to not casting my computations properly. Part A of the project was quite straightforward as the instruction provided all the initializations required for the implementation. Thus, I spent majority of my time on part B of the project. Overall, the results for rho and theta came out significantly close to the expected results with values 1~2 pixels/degrees off at times. The provided test matlab files were useful for debugging and ensuring that my values were computed accurately, therefore these elements were essential in the computation process. Based on the results from testing test_random_line.m three times, all three estimated values of theta agree with the true values and with rho values off by 1 on two of the three results. On the other hand, my hough transform function was tested on the test_real_image.m and the result closely resembled the ones shown in Lab5. Overall, the computed values adhere closely to the true results.




# Histogram Equalization

# Abstract:

The goal of this project is to implement three different functions; specifically, compute_histogram, plot_histogram, and histogram_transform to perform histogram equalization on grayscale images. The idea of equalization is to increase the global contrast of the images by enhancing the value intensity through performing symmetrical distribution of frequent intensity values across the histogram, thus creating an equalization effect resulting in an equally spread out bell curve. The method of equalizing works effectively on bright and dark images and quite useful for processing scientific images, such as X-ray and satellite.   

# Technical Discussion:

The concept of histogram equalization derives from the idea of cumulative histogram, where the frequencies, also known as number of pixels, are accumulated at each intensity value. In the process of histogram equalization, the intensity value of input grayscale image is being transformed by function, say T, where it takes frequency of intensity values, nj (number of pixels) and divided it by the sum of total frequencies (total pixels). L indicates the total gray levels of the grayscale image, typically 256. By computing the histogram of the grayscale image, it first calculates the normalized sum of the histogram in compute_histogram and then transform the grayscale image to the transformed output image. The equalize histogram function calls all three functions compute_histogram, plot_histogram and histogram_transform to perform both the original and equalized version of input grayscale image on provided test image files, Lab_03_image1_dark.tif and Lab_03_image2_light.tif. 

# Result:

Based on the results obtained from generating an equalized image from a grayscale image from both the light and dark version of the grayscale images, it is determined that the equalized version of the images is definitely a huge improvement from that of pre-equalized. For instance, shall we look at the histogram plot for original dark image, it is shown that the most frequent intensity values happened approximately in range between values of 5 and 75 with PMF of minimum of 0.006 to maximum of 0.014, whereas compared to the equalized version of the histogram plot which is scattered towards the range between intensity values of 100 and 250, creating a distributed symmetry of the plots; thus, equalizing the original grayscale image. From comparing the equalized version of images to the original’s, it is quite similar surprisingly. Because the equalized images are essentially an enhancement of poor resolution images which adjusts the intensity distribution over the histogram, these images becomes much more appealing visually.





# Edge Detection

# Abstract:

The goal of this project is to implement an edge detection scheme which determine boundaries of objects within an image. The motivation behind detecting changes in images primarily captures important properties that are interesting to analyze for purposes of image processing and in areas of computer vision. The technique of edge detection is essentially used for image segmentation. The objective of this project is to implement a function for gradient magnitude to determine the existence of pixels on edges, but first I have to implement linear spatial filtering for boundary checking and applying algorithms to define neighbor pixels correspondence. To conclude, I wrap up by computing the find_edges function which in return will call the two functions mentioned above and to derive a solution based on the threshold values of an edge image.

# Technical Discussion:

The algorithm used to implement linear spatial filtering is by dealing with the concept of correlation, which essentially takes an image with a filter size of m rows times n cols, padding m-1 rows of 0’s on top and bottom, and n-1 columns on left and right of grid. This equation means for values of displacement variable x and y, all the elements of w(x,y) visit every pixels in f(x,y). There is also another method to implement linear filtering, which is through the convolution algorithm; a slight twist from correlation. However, since we are required to implement using the algorithm from section 3.4-1, we will have to stick with the correlation method. The effects of threshold value are inversely proportional to edge detections of an output image, because for higher threshold values, in theory, the amount of edges detected are minimized, and vice versa for lower threshold. 

# Result:

Based on the results obtained from applying my edge function with threshold value of 0.1, I discovered a noticeable difference between my own image and the image computed with matlab’s built-in edge function via canny. The primary difference between the two is the number of edge detections from the segmentation. Based on the concept discussed in the technical discussion section, it is obvious that with the higher threshold value, the less edge detections and vice versa for lower threshold; thus, inversely proportional. Because I applied a threshold value of 0.1 on my water tower image, it appears to detect more edges compared to the visual effect of matlab’s. For the function of spatial_filter, I implemented the equation of convolution linear filtering 3.4-1 specified by the instructions from the textbook using Sobel masks gradient and then performed the magnitude gradient measurement by utilizing spatial filtering function. Finally, I called both functions implemented previously on the find_edges function which takes in a specified threshold value, in my case, value of 0.1, for the input image to output an edged version of the grayscale image.

