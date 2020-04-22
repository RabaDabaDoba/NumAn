%OBS!

%Kör U2Log för att få komplett svar för hela fråga 2



% a)
subplot(2,1,1);
clear x f q;
syms x;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
q = integral(f, -1, 1);
area(a, f(a),'FaceColor','flat');
hold on;

plot(x, f(x), 'r');
title("Area: " + q);
