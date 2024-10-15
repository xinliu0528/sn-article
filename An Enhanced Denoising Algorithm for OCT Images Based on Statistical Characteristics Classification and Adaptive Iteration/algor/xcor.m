function result = xcor(image1,image2)
% cross correlation between image1 and image2. 
% by shujun fu, 08/20/2015.

result = sum(sum(image1.*image2))/sqrt(sum(sum(image1.*image1))*sum(sum(image2.*image2)));