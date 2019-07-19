function Fi(A,Xk,Xk2,b,i)
fprintf('Iteration: %d, |A*X-b|= %d',i,norm(A*Xk-b)^2);
fprintf(', |A*X-b|+|x|_1= %d\n',norm(A*Xk2-b)^2 + norm(Xk2,1));
end
