clf;
R = 1;
theta = [0 0];
xe = @(R, t1, t2) R .* cos(t1) + R .* cos(t2);
ye = @(R, t1, t2) R .* sin(t1) + R .* sin(t2);


f = @(x) [cos(x(1)) + cos(x(2)) - 1.3; sin(x(1)) + sin(x(2)) - 1.3];
J = @(x) [-sin(x(1)), -sin(x(2));cos(x(1)),  cos(x(2))];

grid on;
format long;

%Från bilden kan man anta typ 75 och 20
start = [pi/2;pi/12];

x=inf;
tolerance=1e-10;

%loop
%abs?
while (abs(x)>tolerance)
    
A=J;
b = f;
%Ax = b --> x = A\b
x=A(start)\b(start);
start=start-x;
end

disp(['theta1:', start(1),"theta2:", start(2)]);
plot_robotarm(start);

%Fancy pancy saker

hold on
ang([0 0], 0.3, [0 start(1)], 'k-');
hold on
ang([cos(start(1)) sin(start(1))], 0.3, [0 start(2)], 'k-');





function h = ang(centre,radius,span,style)
% ANG
% Plots an angle arc with specified position and circumference.
% Example:
%                 ang([3 2],5,[0 pi/2],'k-')
% Plots an arc with centre (3,2) and radius (5) that represents
% The angle specified from 0 to pi/2, and with the preferred style 'k-'.
% Draws heavily from Zhenhai Wang's circle function on the File Exchange.
%
% Husam Aldahiyat, October, 2008.
theta = linspace(span(1),span(2),100);
rho = ones(1,100) * radius;
[x,y] = pol2cart(theta,rho);
x = x + centre(1);
y = y + centre(2);
h = plot(x,y,style);
end
