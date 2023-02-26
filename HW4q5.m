a = (1-1)+10^(-16);
b = 1 - (1+ 10^(-16));

fprintf('%2.20f\n', a);
fprintf('%2.20f\n', b);

%% 
for c = [5, 10, 20]
    e = ones(c);
    x = norm(hilb(c)*(inv(hilb(c))*e)-e);
    y = cond(hilb(c));
    disp('The norm is');
    fprintf('%2.20f\n', x);
    disp('Condition number is');
    fprintf('%2.20f\n', y);
end

%% 
x = pi/4;
fx = exp(x)/((cos(x))^3+(sin(x))^3);
h_vector = [];
error_vector = [];
closest = 100;
for c = 1:16
    h = 10^(-c);
    fh = exp(x+h)/((cos(x+h))^3+(sin(x+h))^3);
    df = (fh-fx)/h;
    h_vector(c) = h;
    dif = abs(df - 3.101766393836051);
    error_vector(c) = dif;
    exact = 3.101766393836051*ones(c);
    if dif <= closest
        closest = dif;
        num = c;
    end
end
disp('The best estimation is when h = 1^(-c), c =');
disp(num);
disp('The error is');
disp(closest);
loglog(h_vector,error_vector);
xlabel('h');
ylabel('error');
title("Error between analytical result and exact result for f'(x0)");
legend({'Error'},'FontSize',14);

