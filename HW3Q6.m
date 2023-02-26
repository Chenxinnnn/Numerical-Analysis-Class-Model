% Polynomial Fit
clc;clear
x = [0 0.5 1 1.5 2 2 2.5];
y = [0 0.2 0.27 0.30 0.32 0.35 0.27];
figure;
hold on
hand(1) = plot(x,y,'ok');
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')

A = zeros(7,4);
for i = 1:7
    A(i,1) = exp(x(i));
    A(i,2) = x(i)^2;
    A(i,3) = x(i);
    A(i,4) = 1;
end
disp(A);
b = y.';
p = (A'*A)\(A'*b);
disp(p);
a = p(1);b = p(2);c = p(3);d = p(4);

% MATLAB polyfit
%p_MATLAB = polyfit(x,y,3);
%a_MATLAB = p_MATLAB(1);b_MATLAB = p_MATLAB(2);c_MATLAB = p_MATLAB(3);d_MATLAB = p_MATLAB(4);

x_fitplot = linspace(-1,5,30);
hand(2) = plot(x_fitplot,a*exp(x_fitplot)+b*x_fitplot.^2+c*x_fitplot+d,'-r');
%hand(3) = plot(x_fitplot,a_MATLAB*exp(x_fitplot)+b_MATLAB*x_fitplot.^2+c_MATLAB*x_fitplot+d_MATLAB,'--','color',[0 0.7 0]);

legend(hand,{'data points','$y=a*exp(x)+bx^2+cx+d$'},'interpreter','latex','location','south')
legend boxoff
box on