clear; close all; clc;

[A,b,m,n,Gray_Image]=Conv_Blur_Img('images.jpg');
[AT,ATA,Lipschitz,S_A] = Elements_Calc(A);
lambda = 1;
%Initial step
X0 = zeros(S_A(2),1);  X02 = X0;
NumOfIter = 200;

for i = 1:NumOfIter
    %Iterative step 
    Xk  = GradStep(Lipschitz,X0,AT,ATA,b); 
    Xk2 = GradX1Step(Lipschitz,X02,AT,ATA,b,lambda);  %with norm1
    X0=Xk;    X02=Xk2;
    if i==5
        Img_Per_Iter(Xk,Xk2,m,n,Gray_Image,i)
        Fi(A,Xk,Xk2,b,i)
    elseif i==50
        Img_Per_Iter(Xk,Xk2,m,n,Gray_Image,i)
        Fi(A,Xk,Xk2,b,i)
    elseif i==100
        Img_Per_Iter(Xk,Xk2,m,n,Gray_Image,i)
        Fi(A,Xk,Xk2,b,i)
    end
end

Img_Per_Iter(Xk,Xk2,m,n,Gray_Image,i)
Fi(A,Xk,Xk2,b,i)
