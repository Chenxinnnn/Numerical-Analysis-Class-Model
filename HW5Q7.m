n = 100;
I = eye(n);
A = 0.5*I(randperm(n),:)  + (max(2,randn(n,n))-2);
A = A - diag(diag(A));
L = A*diag(1./(max(1e-10,sum(A,1))));
spy(L);

%% 
r = real(eig(L));
i = imag(eig(L));
plot(r,i,"o");
hold on
plotcircle(1,0,0);
hold off

%% 
k = 0.85;
% Try different k
% k = 10;
% k = 20;
E = 1/n*ones(n);
S = k*L + (1-k)*E;
plot(eig(S),"o");
hold on
plotcircle(1,0,0);
hold off

function plotcircle(r,x,y)
th = 0:pi/100:2*pi;
f = r * exp(j*th) + x+j*y;
plot(real(f), imag(f)); 
end

