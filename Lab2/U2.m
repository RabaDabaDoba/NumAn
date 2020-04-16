% a)

clear x f q;
syms x;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
q = integral(f, -1, 1)
area(a, f(a),'FaceColor','flat');
hold on;
plot(x, f(x), 'r');
title("Area: " + q);

%b
% format short
% n = 10;
% limits = [-1 1]; %a b
% %h = (limits(2)-limits(1))/n %Ska vara myckte mindre �n 1;
% hs = [1, 0.5, 0.25, 0.125, 0.0625]
% h = hs(5);
% Ih = 0;
% counter = 0;
% disp("Counter     increment    x value     I    |T(h) - I|");
% sum = abs(limits(1)) + abs(limits(2));
% T = zeros(1,1/h);
% error = zeros(1,1/h);
% while (h*counter <= 1)
%     
%     position = 0;
%     increment = 0;
%     if(counter == 0 || counter*h == 1) %Special fallen
%         if(counter == 0)
%             position = limits(1);
%             increment = f(limits(1))/2;
%             Ih = Ih + increment;
%             
%         end
%         if(counter*h == 1)
%             position = limits(2);
%             increment = f(limits(2))/2;
%             Ih = Ih + increment;
%         end
%         
%     else
%         T(counter-1) = h*((f(limits(1) + counter*h*sum) + limits(1) + (counter+1)*h*sum)/2);
%         position = limits(1) + counter*h*sum;
%         increment = f(limits(1) + counter*h*sum);
%         Ih = Ih + increment;
%         
%     end 
%     %drawRect(limits(1) + counter*h*sum,0,limits(1) + (counter+1)*h*sum,f(limits(1) + (counter+1)*h*sum));
%     error(counter+1) = abs(T(counter+1) - q);
%     disp([counter increment position Ih error(counter+1)]);
%     counter = counter + 1;
% end
% disp("     Res   2x Res")
% %Varf�r �r den f�r liten???
% resultat = Ih*h;
% disp([resultat, resultat*2])

format short
n = 100;
limits = [-1 1]; %a b
%h = (limits(2)-limits(1))/n %Ska vara myckte mindre �n 1;
hs = [1, 0.5, 0.25, 0.125, 0.0625]
h = hs(5);
Ih = 0;
counter = 1;
disp("Counter     increment    x value     Ih    |T(h) - I|");
sum = abs(limits(1)) + abs(limits(2));
T = zeros(1,1/h);
error = zeros(1,1/h);

position0 = limits(1);
increment0 = f(limits(1))/2;
Ih = Ih + increment0;
disp([0 increment0 position0 increment0 abs(increment0-q)]);

positionN = limits(2);
incrementN = f(limits(2))/2;
%Ih = Ih + increment;

while (h*counter < 1)  %L�gger till xN p� slutet
    position = 0;
    increment = 0;
    %T(counter-1) = h*((f(limits(1) + counter*h*sum) + limits(1) + (counter+1)*h*sum)/2);
    position = limits(1) + counter*h*sum;
    increment = f(limits(1) + counter*h*sum);
    Ih = Ih + increment;
    


error(counter) = abs(increment - q);
disp([counter increment position Ih error(counter)]);
counter = counter + 1;
end
disp([((1/h)) incrementN positionN Ih abs(incrementN-q)]);
disp("     Res   2x Res")
resultat = (Ih + incrementN)*h;
disp([resultat, resultat*2])


%Fattar inte vad jag g�r f�r fel med om man tar g�nger 2 s� f�r man det
%r�tta v�rdet.