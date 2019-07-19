function Img_Per_Iter(Xk,Xk2,m,n,Image,i)
    figure
    subplot(1,2,1);
    imshow(uint8(reshape(Xk,m,n)));
    t =  sprintf('PSNR after %d ietrations: ',i);    
    str1 = sprintf('|Ax-b|= %d',psnr(uint8(reshape(Xk,m,n)),uint8(Image)));
    title({t;str1})

    subplot(1,2,2);
    imshow(uint8(reshape(Xk2,m,n)));
    str2 = sprintf('|Ax-b|+|x|_1= %d',psnr(uint8(reshape(Xk2,m,n)),uint8(Image)));
    title(str2)
    
end