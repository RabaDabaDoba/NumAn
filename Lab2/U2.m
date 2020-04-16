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
format short
n = 10;
limits = [-1 1]; %a b
h = (limits(2)-limits(1))/n %Ska vara myckte mindre än 1;
%h = 0.5;
I = 0;
counter = 0;
disp("Counter     increment    x value     I    |T(h) - I|");
sum = abs(limits(1)) + abs(limits(2));
T = zeros(1,1/h);
while (h*counter <= 1)
    T(counter + 1) = h*((f(limits(1) + counter*h*sum) + limits(1) + (counter + 1)*h*sum)/2);
    position = 0;
    increment = 0;
    if(counter == 0 || counter*h == 1) %Special fallen
        if(counter == 0)
            position = limits(1);
            increment = f(limits(1))/2;
            I = I + increment;
            
        end
        if(counter*h == 1)
            position = limits(2);
            increment = f(limits(2))/2;
            I = I + increment;
        end
        
    else
        position = limits(1) + counter*h*sum;
        increment = f(limits(1) + counter*h*sum);
        I = I + increment;
        
    end 
    %drawRect(limits(1) + counter*h*sum,0,limits(1) + (counter+1)*h*sum,f(limits(1) + (counter+1)*h*sum));
    disp([counter increment position I abs(T(counter+1) - increment)]);
    counter = counter + 1;
end

Ih = I *h
2*Ih


function drawRect(a, b, c, d)
rectangle('Position',[a b c d])
end

%Fattar inte vad jag gör för fel med om man tar gånger 2 så får man det
%rätta värdet.