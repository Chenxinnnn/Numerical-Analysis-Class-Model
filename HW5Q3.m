% a
clc;clear;format long
n = 7; %Enter n
A = rand(n);
A = A'*A;
x = ones(n,1);
K = 5;
x_k = zeros(n,K);
lambda_k = nan(1,K);
x_k(:,1) = x;
for k = 2:K
    x = A*x/ norm(A*x);
    lambda = x'*A*x/(x'*x);
    x_k(:,k) = x;
    lambda_k(k) = lambda;
end
disp(x_k)
disp(lambda_k)

%% b[1; 2; -1]
clc;clear;format long
A = [-2 1 4;
    1 1 1;
    4 1 -2];
x = [1; 2; -1]; 
K = 5;
n = 3;
x_k = zeros(n,K);
lambda_k = nan(1,K);
x_k(:,1) = x;
for k = 2:K
    x = A*x/ norm(A*x);
    lambda = x'*A*x/(x'*x);
    x_k(:,k) = x;
    lambda_k(k) = lambda;
end
disp("x_k converge to:")
disp(x_k)
disp("lambda_k converge to:")
disp(lambda_k)
%% builtin eig
clc;clear;format long
A = [-2 1 4;
    1 1 1;
    4 1 -2];
[X,lambda_matlab] = eig(A);
disp('MATLAB: ')
disp(X)
disp(lambda_matlab)

%% b[1; 2; 1]
clc;clear;format long
A = [-2 1 4;
    1 1 1;
    4 1 -2];
x = [1; 2; 1]; 
K = 5;
n = 3;
x_k = zeros(n,K);
lambda_k = nan(1,K);
x_k(:,1) = x;
for k = 2:K
    x = A*x/ norm(A*x);
    lambda = x'*A*x/(x'*x);
    x_k(:,k) = x;
    lambda_k(k) = lambda;
end
disp("x_k converge to:")
disp(x_k)
disp("lambda_k converge to:")
disp(lambda_k)
%% c,d
clc;clear;format long
A = [-2 1 4;
    1 1 1;
    4 1 -2];
[n,~] = size(A);
K = 5;

% Try different x0 and alpha
x0 = [0; 0; 1];
alpha1 = -6.1;
alpha2 = 0.1;
alpha3 = 3.1;

[x1,lambda1] = IPM(A,x0,alpha1,K);
[x2,lambda2] = IPM(A,x0,alpha2,K);
[x3,lambda3] = IPM(A,x0,alpha3,K);

disp("The eigenvalues are:")
disp([lambda1, lambda2, lambda3])
disp("The corresponding eigenvectors:")
disp([x1, x2, x3])

function [x,lambda] = IPM(A,x0,alpha,K)
[n,~] = size(A);
B = A-alpha*eye(n);
x = x0;
for k = 1:K
    disp(['k = ' num2str(k)])
    x = B\x;
    %disp(x)
    x = x/norm(x);
    disp(x)
    lambda = x'*A*x/(x'*x);
    disp(lambda)
end
end



