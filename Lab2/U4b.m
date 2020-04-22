%"theta1:"    "1.1901"    "theta2:"    "0.38074"
clf;

theta = [(1.1901); (0.38074)];
gamma = 4;
beta = 0.5;
omega = 3.*pi;
alpha = 2;
time=15;
h=0.01;
ts1 = theta(1);
ts2 = theta(2);

z = [pi/2; 0; pi/6; 0];

counter = 0;
xlim([-10 10])
ylim([-10 10])

for t=0:h:time
    
    robotF = h * f_robotarm(z, t, ts1, ts2, alpha, beta, gamma, omega);
    
    uF = z(1:2) + robotF(1:2);
    vF = z(3:4) + robotF(3:4);
   
    vektor = [uF(1) vF(1)];
    
    if (mod(counter,10)==1)
        
        plot_robotarm(vektor);
        
    end

    z=[uF(1); uF(2); vF(1); vF(2)];
    counter = counter + 1;
end
grid on;

hold on;
viscircles([1.3 1.3], 0.1, "Color", 'g');

%%%%Robot arm

%Teori
% y' = F(y, t)
% 
% (1) y'' = -2(y(t) - y*) - 4y'(t) + 0.5sin(3*pi*t)
% (2) y''(t) = -2(y(t) - y*) - 4(y'(t) + abs(y'(t))) + 0.5sin(3*pi*t)
% 
% (1) F(y, t) = -1/2(y(t) - y*) + 1/8sin(3*pi*t) - y''
% (2) F(y, t) + abs(F(y, t)) = -1/2(y(t) - y*) + 1/8sin(3*pi*t) - y''
% (2) F(y, t) = -1/4(y(t) - y*) + 1/16sin(3*pi*t) - y''
% 
% 
% System med fyra första ordningen
% u1 = y(t)
% u2 = y'(t)
% grad(u) = [y'(t) ; y''(t)] = P(t,u)
% 
% grad(u) = [F1(y,t ) ; -2(y(t) - y*) - 4y'(t) + 0.5sin(3*pi*t)] = P(t,u)
% 
% v1 = y(t)
% v2 = y'(t)
% grad(u) = [y'(t) ; y''(t)] = Q(t,u)
% 
% grad(v) = [F2(y, t), -2(y(t) - y*) - 4(y'(t) + abs(y'(t))) + 0.5sin(3*pi*t)]


%Kod

% f=zeros(size(z0));
% f(1)=z0(2);
% f(2)=-alpha*(z0(1)-ts1) - gamma .* z0(2) + beta .* sin(omega .* t);
% f(3)=z0(4);
% f(4)=-alpha*(z0(3)-ts2) - gamma .* (z0(4) + abs(z0(2))) + beta .* sin(omega .* t);




