function [w,lossval,b]=Pegasos_solver(X,y,lambda,T)
[n,~] = size(X);
%%%initial values%%%
w = zeros(2,1); 
lossval=zeros(T,1);
b=sum(y-X*w)/n;
for t= 1:T

    eta = 1/(lambda*t);
    permi = randperm(n);
    for i = 1:n
        j=permi(i);
        if y(j)*(dot(w,X(j,:)')+b) < 1
           w = (1-eta*lambda)*w + eta*y(j)*X(j,:)';
           b = b + eta*y(j);
        else
           w = (1-eta*lambda)*w;
        end
    end     
    l=max(0,1 - (y.*(X*w)));
    lossval(t) = 0.5*lambda*w'*w + (1/n)*sum(l);
end

figure
step = 100;
semilogy( 1:step:T, lossval(1:step:end), 'r-.','LineWidth',1.5 );
xlabel('iteration');
ylabel('Loss function value');
axis([1 T 0 max(lossval)]);
title('Convergence of Pegasos algorithm');

% visualize
figure
xp  = linspace(min(X(:,1)), max(X(:,1)));
yp  = - (w(1)*xp +b    )/ w(2);
yp1 = - (w(1)*xp +b - 1)/ w(2); % margin boundary for support vectors for y=1 (muffin)
yp0 = - (w(1)*xp +b + 1)/ w(2); % margin boundary for support vectors for y=-1 (cupcake)

i_cupcake = find(y==-1);% index of cupcake samples
i_muffin = find(y==1);% index of muffin samples
plot(X(i_cupcake,1), X(i_cupcake,2), 'ro'); 
hold on
plot(X(i_muffin,1), X(i_muffin,2), 'bo');
plot(xp, yp, '-k' , xp, yp1, '--g', xp, yp0, '--r');
title(sprintf('Pegasos classifier with its boundary, lambda = %g', lambda));

fprintf('The hyperplane defined by Pegasos is (%.2f,%.2f)X %.2f\n',w,b);
end