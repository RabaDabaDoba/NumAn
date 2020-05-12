clc; clf; clearvars; clear all;
global grader;
%a) Version 1
%V�rden p� z
z = [    0, 500,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000,11000,12000]';
%V�rden p� c(z)
cV = [5050,4980,4930,4890,4870,4865,4860,4860,4865,4875,4885,4905,4920,4935, 4950, 4970, 4990]';
%Funktionen
f = @(p) -cV + 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-p(4) .* (z/1000))
%Stargissningarna
p = [0 0 0 1]; %p(4) = 1;
%Vi anv�nder oss av MATLAB's metod f�r att l�sa MKM
p = lsqnonlin(f,p)
%disp("Points with lsqnonlin: "  + x1(1) + " " + x1(2) + " " + x1(3) + " ");

%Plotta kurvan c(z)
g = @(z) 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-p(4) .* (z/1000));
for i=1:1:size(z)
    summa(i) = g(z(i)');
end  

syms p1 p2 p3 p4
g = @(p1,p2,p3,p4) 4800 + p1 + p2 .* (z/1000) + p3 .*  exp(-p4 .* (z/1000)) - cV;
%J = jacobian(g, [p1 p2 p3 p4]);
J1 = @(p1,p2,p3,p4)[
[ 1,   0,              1,                        0];
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


%Plotta kurvan c(z)
g = @(z) 4800 + X(1) + X(2) .* (z/1000) + X(3) .*  exp(-X(4) .* (z/1000));
for i=1:1:size(z)
    sum2(i) = g(z(i)');
end
disp("Plot 1");
subplot(4,2,1);
plot(z, cV, 'b');
hold on;
plot(z, sum2, '*');
legend("Data Points","Approximation");
xlabel("Value of c(z) (feet)");
ylabel("Value of z (feet)")
grid on;






disp("Plot 2");
subplot(4,2,2);
%Vi g�r fr�n 0 till 30 nautical miles
x=0:10:6076*30;
%Ode45
grader = 13.5;
[X,Z]=ode45(@diffekv,x,[5000 tand(grader)]);
%Plotta z(x)
plot(X,Z(:,1)); 
legend("Ray with initial angle" + grader)
xlabel("Travel distance (feet)");
ylabel("Depth (feet)")
hold on
%Plotta punkten vi 30 nautical miles, som ligger n�ra ett djup p� 4000 feet
plot(182000,4000,'.-');






disp("Plot 3");
subplot(4,2,3);

clear endpoints endvalues;

degreesinterval = -14.5:0.5:19;
iter = 1;
for i=degreesinterval
    x=0:10:6076*30;
    grader = i;
    [X,Z]=ode45(@diffekv,x,[5000 tand(grader)]);
    endvalues(iter) = Z(end,1);
    if mod(iter,2) == 0
        plot(X,Z(:,1), 'r') 
    end
    
    hold on
    iter = iter + 1;
end
legend("Rays with different initial angles")
xlabel("Travel distance (feet)");
ylabel("Depth (feet)")


disp("Plot 4");
subplot(4,2,4);
plot(degreesinterval, endvalues, 'b*');
yline(4000);
legend("End depth at beta0")
xlabel("Initial angle - beta0");
ylabel("End depth")

%c;
startg = [-13, -12; 4 ,5; 13,14; 17,18];

for i=1:1:size(startg)
    counter = 2;
    M = 4000;
    clear a;
    a(1) = startg(i,1);
    a(2) = startg(i,2);
    disp('    a            e          ');
    maxIt = 100;
    tolerance = 1e-8;
    error(1) = abs(a(2) - a(1));
    disp([a(2) error(1)]);
    
    while(error(counter-1) >= tolerance) && (counter <= maxIt)
        x=0:10:6076*30;
        grader = a(counter);
        [X,Z]=ode45(@diffekv,x,[5000 tand(a(counter))]);
        fxn = Z(end,1) - M; %f(x)
        
        grader = a(counter-1);
        [X,Z]=ode45(@diffekv,x,[5000 tand(a(counter-1))]);
        fxn1 = Z(end,1) - M; %(f(x-1))
        
        
        current = a(counter) - fxn .* ((a(counter)-a(counter-1))./(fxn-fxn1));
        
        
        a(counter+1) = current;
        error(counter) = abs(a(counter) - a(counter-1));
        maxValues(counter-1) = error(counter);
        disp([current error(counter)]);
        counter = counter + 1;
    end
    results(i) = a(end);
    
end

disp("Plot 5");
subplot(4,2,5);
for i=1:1:size(results')
    x=0:10:6076*30;
    grader = results(i);
    [X,Z]=ode45(@diffekv,x,[5000 tand(grader)]);
    plot(X,Z(:,1)) 
    hold on
end
xlabel("Travel distance (feet)");
ylabel("Depth (feet)")



%Visualize the uncertainty
fUncertainty = @(p) 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-p(4) .* (z/1000));



subplot(4,2,6);
for i=-15:1:15
    clear pTemp cVTemp;
    pTemp = (1 + (i/100)) .* p;
    cVTemp = fUncertainty(pTemp);
    if i < 0
       plot(z, cVTemp,'b'); 
    elseif i > 0
       plot(z, cVTemp,'r'); 
    else
       plot(z, cVTemp,'g'); 
    end
    hold on
end
xlabel("Depth (feet)");
ylabel("Speed of sound at depth z")

%Estimate the resulting uncertainty in beta0
%Vi m�ste g�ra en st�rningsanalys

p
exaktCV = fUncertainty(p);

uncertaintyLimit = 100;
uncertaintyInterval = -uncertaintyLimit:1:uncertaintyLimit;
clear cVp1_vektor cVp2_vektor cVp3_vektor cVp4_vektor

for i=uncertaintyInterval
storningsfaktor = (1 + (i/100));
clear p_p1 p_p2 p_p3 p_p4 cVp1 cVp2 cVp3 cVp4
p_p1 = [p(1)*storningsfaktor p(2:4)];
p_p2 = [p(1) p(2)*storningsfaktor p(3:4)];
p_p3 = [p(1:2) p(3)*storningsfaktor p(4)];
p_p4 = [p(1:3) p(4)*storningsfaktor];

%Ber�kna st�rda l�sningar, d�r parametrarna st�rs en i taget.
cVp1 = fUncertainty(p_p1);
cVp2 = fUncertainty(p_p2);
cVp3 = fUncertainty(p_p3);
cVp4 = fUncertainty(p_p4);

%Summera ihop absolutbeloppen av l�sningarnas st�rningar
cVp1_vektor(i + (uncertaintyLimit + 1)) = sum(abs(cVp1 - exaktCV));
cVp2_vektor(i + (uncertaintyLimit + 1)) = sum(abs(cVp2 - exaktCV));
cVp3_vektor(i + (uncertaintyLimit + 1)) = sum(abs(cVp3 - exaktCV));
cVp4_vektor(i + (uncertaintyLimit + 1)) = sum(abs(cVp4 - exaktCV));
end

subplot(4,2,7);
plot(uncertaintyInterval, cVp1_vektor);
hold on;
plot(uncertaintyInterval, cVp2_vektor);
hold on;
plot(uncertaintyInterval, cVp3_vektor);
hold on;
plot(uncertaintyInterval, cVp4_vektor);
hold on;
legend("p1", "p2", "p3", "p4");
xlabel("Different % shifts")
ylabel("Error")
function res=diffekv(x,Z)
    %Gissningar
    x = [-20.209       17.337       272.91      0.75278]; 
    %Funktionen
    c = @(z) 4800 + x(1) + x(2) .* (z/1000) + x(3) .*  exp(-x(4) .* (z/1000));
    %z0 i feet
    z0 = Z(1);
    %beta0 i grader
    global grader;
    beta0 = grader;
    zprim = Z(2);
    q0 = (c(5000)/(cosd(beta0)))^2;
    %cprim = @(z) x(2)/1000 - (x(3)*exp(-z/1000))/1000;
    cprim = @(z) x(2)/1000 - (x(3)*x(4)*exp(-(x(4)*z)/1000))/1000;
    zbis = @(z) -q0 .* (cprim(z)/c(z)^3);
    
    %Det vi returnerar
    res=zeros(2,1);
    res(1) = zprim;
    res(2) = zbis(z0);
end

