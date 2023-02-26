clc;clear
exact = [1,5/6,3/4,7/10,2/3,9/14,5/8];
m = 10;
x0 = 1/2;
x1 = (5+15^(0.5))/10;
x2 = (5-15^(0.5))/10;
w0 = 4/9;
w1 = 5/18;
w2 = 5/18;
K = 1:7;
e_S = zeros(1,7);
e_G = zeros(1,7);

for k=1:7
    S = simpon(0,1,m,k);
    G = w0*g(x0,k)+w1*g(x1,k)+w2*g(x2,k);
    e_S(k) = abs(S - exact(k));
    e_G(k) = abs(G - exact(k));
end
disp(e_S)
disp(e_G)

plot(K,e_S,K,e_G)
legend('Gauss Quadratrue', 'Simpson Rule')
    

function F = simpon(A,B,m,k)
    h = (B-A)/m;
    F = 0;
    for i = 1:m
        a = A + (i-1)*h;
        b = A + i*h;
        F = F + h/6*( g(a,k) + g(b,k) + 4 * g((a+b)/2,k));
    end
end

function F = g(x,k)
    F = x^k+x;
end
