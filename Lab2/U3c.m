theta = 40;
s = 2;
beta = 1;
maxgen = @(x) max(generator(theta + x, 0));
func1 = @(t) exp(-beta .* power(t,2)) * maxgen(t);
func2 = @(t) exp(-beta .* power(t,2));
test = @(x) x.*x;
func3 = @(t) exp(-beta .* power(t,2)) * 10482.058030598;
%a)

%Lös med function från 2an istället

namnare = integral(func2, -s, s);
hs = [1, 0.5, 0.25, 0.125, 0.0625];

%b)
limits = [-s s];
%h = 0.025;
clear results;
for k=1:1:size(hs')
    h= hs(k);
    Ih2 = 0;
    Ih1 = 0;
    counter = 1;
    sum = abs(limits(1)) + abs(limits(2));
    summaOdd1 = 0;
    summaEven1 = 0;
    summaOdd2 = 0;
    summaEven2 = 0;
    
    while (h*counter < 1)
        %h*counter
        currentValue = limits(1) + counter*h*sum;
        if(rem(counter, 2) == 0)
            %Jämna
            %disp("Even");
            summaEven1 = summaEven1 + func1(currentValue);
            summaEven2 = summaEven2 + func2(currentValue);
        else
            %Udda
            %disp("Odd");
            summaOdd1 = summaOdd1 + func1(currentValue);
            summaOdd2 = summaOdd2 + func2(currentValue);
        end
        %error(counter+1) = abs(incr(counter+1) - q);
        %disp(error(counter+1) );
        counter = counter + 1;
    end
    
    Ih1 = (h./3).*(func1(limits(1)) + 4.*summaOdd1 + 2.*summaEven1 + func1(limits(2)))*4
    Ih2 = (h./3).*(func2(limits(1)) + 4.*summaOdd2 + 2.*summaEven2 + func2(limits(2)))*4
    mBar = Ih1/Ih2;
    results(k) = mBar;
    disp(["Done with " + hs(k)])
end

loglog(hs, results, 'r*');

%40.8696451741481
%10499.9999999996

