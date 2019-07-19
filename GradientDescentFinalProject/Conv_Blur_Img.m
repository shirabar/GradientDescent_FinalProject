%This function reads an image, blur it via convolution 
%and return this action as a system of linear equations.
function [A,b,m,n,Image]=Conv_Blur_Img(image_name)
%Convert to gray image
Image=double(rgb2gray(imread(image_name)));
%Generate a Gaussian kernel of size 9*9 std=4, and convulate it with the image
h = fspecial('gaussian',9,4); 
Blur_Img=conv2(h,Image);
%reshape a matrix as a vector column
m=size(Image,1);
n=size(Image,2);
p=size(Blur_Img,1);
q=size(Blur_Img,2);
b=double(reshape(Blur_Img,p*q,1));
%Generate a matrix operator of Blurr 
A=convmtx2(h,m,n);

subplot(1,2,1)
imshow(uint8(Image))
title('Original Image');
subplot(1,2,2)
imshow(uint8(Blur_Img))
title('Blurred Image')
