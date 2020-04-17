%"theta1:"    "1.1901"    "theta2:"    "0.38074"
clf;
theta = [rad2deg(1.1901); rad2deg(0.38074)];
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

for t=0:h:t
    
    robotF = h * f_robotarm(z, t, ts1, ts2, alpha, beta, gamma, omega);
    Hallo
    uF = z(1:2) + robotF(1:2);
    vF = z(3:4) + robotF(3:4);
   
    vektor = [uF(1) vF(1)];
    
    if (mod(counter,10)==1)
        hold on
        plot_robotarm(vektor);
    end

    z=[uF(1); uF(2); vF(1); vF(2)];
    counter = counter + 1;
end


%v




