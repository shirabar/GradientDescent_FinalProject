function [mdl]=SVM_solver(X,y)
%%%%%%%fit SVM model%%%%%%%%%%%%%%%%%%%%%%%%%
mdl = fitcsvm(X,y);
sv = mdl.SupportVectors;
%%%%%%%presenting results of svm model%%%%%%%
figure
gscatter(X(:,1),X(:,2),y)
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
d = 0.02;
[X1Grid,X2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),min(X(:,2)):d:max(X(:,2)));
XGrid = [X1Grid(:),X2Grid(:)];
[~,scores] = predict(mdl,XGrid);
contour(X1Grid,X2Grid,reshape(scores(:,2),size(X1Grid)),[0 0],'k');
legend('Cupcake','Muffin','Support Vector','Optimal hyperplane')
fprintf('The hyperplane defined by SVM is [(%.2f,%.2f)X %.2f\n',mdl.Beta,mdl.Bias);
end