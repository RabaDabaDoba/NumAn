x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);

n = 1000000;
limits = [-1 1]; %a b
h = (limits(2)-limits(1))/n %Ska vara myckte mindre än 1;
%h = 0.5;
I = 0;
counter = 0;
%disp(["Counter" "increment" "x value" "I" "|T(h) - I|"]);
sum = abs(limits(1)) + abs(limits(2));



summaOdd = 0;
summaEven = 0;



while (h*counter <= 1)
    %h*counter
    currentValue = limits(1) + counter*h*sum;
    
    if(rem(counter, 2) == 0)
        %Jämna
        %disp("Even");
        summaEven = summaEven + f(currentValue);
    else
        %Udda
        %disp("Odd");
        summaOdd = summaOdd + f(currentValue);
    end

    counter = counter + 1;
end

I = (h./3).*(f(limits(1)) + 4.*summaOdd + 2.*summaEven + f(limits(2)))
Ih = I*2