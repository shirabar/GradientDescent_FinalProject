function Xk=GradStep(Lipschits,X0,AT,ATA,b)
	Xk= X0-(1/Lipschits)*(2*ATA*X0-2*AT*b); 
end