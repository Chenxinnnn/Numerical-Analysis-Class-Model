clc;clear
E = zeros(4,1);
M = zeros(4,1);


for i = 1:4
    m = 10 * 2^(i-1);
    M(i) = m;
    F = trapez(0.1,1,m);
    % For part c, change the first parameter to 0
    e = abs(F - (2/3-1/(15*10^(0.5))));
    E(i) = e;
end

loglog(M,E)

%% b
A = ones(4,2);
b = ones(4,1);
for i = 1:4
    A(i,2) = log(M(i));
    b(i) = log(E(i));
end
p = (A'*A)\(A'* b);
disp(p)



function F = trapez(A,B,m)
    h = (B-A)/m;
    F = 0;
    for i = 1:m
        a = A+(i-1)*h;
        b = A+i*h;
        F = F + h/2*(g(a)+g(b));
    end
end

function f = g(x)
    f = x^(1/2);
end

