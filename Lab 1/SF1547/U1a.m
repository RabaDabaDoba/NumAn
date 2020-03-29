function [] = U1a()
%1A Summary of this function goes here
%   Detailed explanation goes here
title('power(x,2)-3.*sin(3.*x+2)-1')
x = -2*pi:0.01:2*pi;
y = power(x,2)-3.*sin(3.*x+2)-1;
plot(x, y, 'r');
grid on
hold on
yl = yline(0);


end

