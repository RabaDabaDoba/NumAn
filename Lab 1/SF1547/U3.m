
%ÄNDRAT
p1 = [93 63];
p2 = [6 16];
r = [55.1 46.2];
viscircles(p1, r(1));
viscircles(p2, r(2));
grid on;
%ÄNDRAT

format long g;

%equations
f = @(x)[(93 - x(1)).^2 + (63 - x(2)).^2 - 55.1.^2;(6 - x(1)).^2 + (16 - x(2)).^2 - 46.2.^2];
%Jacobian
J = @(x)[2.*x(1) - 186, 2*x(2)-126; 2.*x(1)-12, 2.*x(2)-32];

guess1 = [50;27]; %First poing
guess2 = [39;50]; %Second point

start = guess2;

x=inf;
tolerance=1e-8;

%loop
while (norm(x)>tolerance)
A=J;
b = f;
%Ax = b --> x = A\b
x=A(start)\b(start)
start=start-x;
end

%Results
disp(['x:', start(1),"y:", start(2)]);



