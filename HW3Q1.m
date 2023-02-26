n = 50;
N = zeros(1,7);
T1= zeros(1,7);
T2= zeros(1,7);
for k = 1:7
    n = 2*n;
    N(k) = n;

    A = rand(n,n);
    tic
    one = norm(A,1);
    infi = norm(A,inf);
    T1(k) = toc;

    tic
    s1 = sum(abs(A),1);
    s2 = sum(abs(A),2);
    onenorm = max(s1);
    infinitynorm = max(s2);
    T2(k) = toc;
end
disp(N);
disp('Matlab inbuilt result');
disp(T1);
disp('My Own algorism result');
disp(T2);

plot(N,T1,N,T2);
xlabel('Matrix Size (n*n)')
ylabel('Computation Time (t)')
legend({'Matlab Inbuilt Norm Function','My Own Algorism'},'Location','northwest');
%% 

plot(log(N),log(T1),log(N),log(T2),log(N),2*log(N)-20);
xlabel('ln(n)')
ylabel('ln(t)')
legend({'Matlab Inbuilt Norm Function','My Own Algorism','2ln(n)+k'},'Location','northwest');