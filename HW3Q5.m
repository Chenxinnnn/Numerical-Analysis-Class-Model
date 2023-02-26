A = [9 -6
    12 -8
    0 20];
[Q,R] = qr(A, 0);
disp(Q);
disp(R);
b = [300
    600
    900];
c = Q.' * b;
y = R\c;
disp(y);

x = -20:100;
y1 = 3/2*x - 50;
y2 = 3/2*x - 75;
yline(45); hold on
plot(x,y1,x,y2);
plot(y(1),y(2),'r*','displayName', '(74,45)');
legend({'20y = 900','9x - 6y = 300','12x - 8y = 600'},'Location','southeast');