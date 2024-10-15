function result = cnr(image,background)
% contrast-to-noise ratio, image and background are the region of interest 
% and background noise region, respectively. 
% by shujun fu, 08/20/2015.

mju_r = mean2(image); mju_b = mean2(background);    %均值
sigma_r = std2(image); sigma_b = std2(background);  %标准差
result = (mju_r-mju_b)/sqrt(sigma_r^2+sigma_b^2);

