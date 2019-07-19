function Xk=GradX1Step(Lipschits,X0,AT,ATA,b,lambda)
	Xk = X0-(1/Lipschits)*(2*ATA*X0-2*AT*b+lambda*sign(X0));
end