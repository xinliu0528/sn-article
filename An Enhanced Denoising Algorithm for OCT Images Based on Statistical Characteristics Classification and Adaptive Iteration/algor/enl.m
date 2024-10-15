function result = enl(image)
% equivalent number of looks, a measure of the smoothness of 
% a homogeneous region of interest. 
% by shujun fu, 08/20/2015.

mju = mean2(image);   %��ֵ
sigma = std2(image);  %��׼��
result = (mju/sigma)^2;

