clear; close all; clc;

data = xlsread('data');
% define variables
X = data(:,4:5);
y = data(:,6);

T=10000;
lambda = 0.015;

mdl = SVM_solver(X,y);
[wT,loss,b]=Pegasos_solver(X,y,lambda,T);
