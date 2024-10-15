function result = epi(image1,image2)
% edge preserving index: correlation of laplacian image.
% by shujun fu, 08/20/2015.

w = [0 1 0;1 -4 1;0 1 0]; 
delta_image1 = imfilter(image1,w,'replicate');%laplaceÂË²¨Æ÷
delta_image2 = imfilter(image2,w,'replicate');
result = corr2(delta_image1,delta_image2);
%r = corr2(A,B) computes the correlation coefficient between A and B, where A and B are matrices or vectors of the same size.

