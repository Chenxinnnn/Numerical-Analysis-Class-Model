r = 1:15;
c = -poly(r);
b = flip(c)';
r = roots(c);

A = zeros(15,14);
for k = 2:15
    A(k,k-1) = 1;  
end
A = [A b(1:15)];
x = eig(A);
disp(x)

%Here I compared eig(A) to the exact roots of p, namely {1,2,..,15}
%Could also compare it to the numerically computed roots using root(), but
%the value itself contains an error as well
error = zeros(15,1);
for i = 1:15
    error = abs(i-x(i));
    disp(error)
end
%Either way, the error is not very large



