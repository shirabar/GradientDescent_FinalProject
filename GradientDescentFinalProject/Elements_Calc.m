function [AT,ATA,Lipschitz,S_A] = Elements_Calc(A)
AT = A.';
ATA = AT*A;
S_A=size(A);
Lipschitz = 2*eigs(ATA,1);   %%Lip = 2*max_eighenvalue
end