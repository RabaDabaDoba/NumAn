clc; clf; clearvars;

%a) Version 1
%Värden på z
z = [    0, 500,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000,11000,12000]';
%Värden på c(z)
cV = [5050,4980,4930,4890,4870,4865,4860,4860,4865,4875,4885,4905,4920,4935, 4950, 4970, 4990]';
%Funktionen
f = @(p) -cV + 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-p(4) .* (z/1000))
%Stargissningarna
p = [0 0 0 1]; %p(4) = 1;
%Vi använder oss av MATLAB's metod för att lösa MKM
p = lsqnonlin(f,p)
%disp("Points with lsqnonlin: "  + x1(1) + " " + x1(2) + " " + x1(3) + " ");

%Plotta kurvan c(z)
g = @(z) 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-p(4) .* (z/1000));
for i=1:1:size(z)
    sum(i) = g(z(i)');
end  
subplot(3,1,1);
plot(z, cV, 'b');
hold on;
plot(z, sum, 'r');
legend("Data Points","Approximation");
grid on;

%Jacobian
%J= @(p) p(2)/1000 - (p(3)*exp(-z/1000))/1000;
syms p1 p2 p3 p4
g = @(p1,p2,p3,p4) 4800 + p1 + p2 .* (z/1000) + p3 .*  exp(-p4 .* (z/1000)) - cV;
%J = jacobian(g, [p1 p2 p3 p4]);
J1 = @(p1,p2,p3,p4)[[ 1,   0,              1,                        0];
[ 1, 1/2,     exp(-p4/2),       -(p3*exp(-p4/2))/2];
[ 1,   1,       exp(-p4),             -p3*exp(-p4)];
[ 1, 3/2, exp(-(3*p4)/2), -(3*p3*exp(-(3*p4)/2))/2];
[ 1,   2,     exp(-2*p4),         -2*p3*exp(-2*p4)];
[ 1, 5/2, exp(-(5*p4)/2), -(5*p3*exp(-(5*p4)/2))/2];
[ 1,   3,     exp(-3*p4),         -3*p3*exp(-3*p4)];
[ 1, 7/2, exp(-(7*p4)/2), -(7*p3*exp(-(7*p4)/2))/2];
[ 1,   4,     exp(-4*p4),         -4*p3*exp(-4*p4)];
[ 1,   5,     exp(-5*p4),         -5*p3*exp(-5*p4)];
[ 1,   6,     exp(-6*p4),         -6*p3*exp(-6*p4)];
[ 1,   7,     exp(-7*p4),         -7*p3*exp(-7*p4)];
[ 1,   8,     exp(-8*p4),         -8*p3*exp(-8*p4)];
[ 1,   9,     exp(-9*p4),         -9*p3*exp(-9*p4)];
[ 1,  10,    exp(-10*p4),       -10*p3*exp(-10*p4)];
[ 1,  11,    exp(-11*p4),       -11*p3*exp(-11*p4)];
[ 1,  12,    exp(-12*p4),       -12*p3*exp(-12*p4)]];

X=[0;0;0;1];
tau=1e-10;
dxnorm=1;
iter=0;

while (dxnorm>tau && iter<100)
    dx = -J1(X(1),X(2),X(3),X(4))\g(X(1),X(2),X(3),X(4));
    dxnorm = norm(dx);
    X = X + dx
    iter = iter+1;
    disp([iter dxnorm])
end
X;

%Plotta kurvan c(z)
g = @(z) 4800 + X(1) + X(2) .* (z/1000) + X(3) .*  exp(-X(4) .* (z/1000));
for i=1:1:size(z)
    sum2(i) = g(z(i)');
end  
subplot(3,1,2);
plot(z, cV, 'b');
hold on;
plot(z, sum2, '*');
legend("Data Points","Approximation");
grid on;

subplot(3,1,3);
%Vi går från 0 till 30 nautical miles
x=0:1000:6076*30;
%Ode45
[X,Z]=ode45(@diffekv,x,[5000 tand(13.5)]);
%Plotta z(x)
plot(X,Z(:,1)) 
hold on
%Plotta punkten vi 30 nautical miles, som ligger nära ett djup på 4000 feet
plot(180000,4000,'.-');

function res=diffekv(x,Z)
    %Gissningar
    x = [-20.209       17.337       272.91      0.75278]; 
    %Funktionen
    c = @(z) 4800 + x(1) + x(2) .* (z/1000) + x(3) .*  exp(-x(4) .* (z/1000));
    %z0 i feet
    z0 = Z(1);
    %beta0 i grader
    beta0 = atan(Z(2));
    zprim = Z(2);
    q0 = (c(z0)/(cosd(beta0)))^2;
    cprim = @(z) x(2)/1000 - (x(3)*exp(-z/1000))/1000;
    zbis = @(z) -q0 .* (cprim(z)/c(z)^3);
    
    %Det vi returnerar
    res=zeros(2,1);
    res(1)=zprim;
    res(2) = zbis(z0);
end

