clearvars;
theta = 40;
s = 2;
beta = 1;
maxgen = @(x) max(generator(theta + x, 0));
func1 = @(t) exp(-beta .* power(t,2)) * maxgen(t);
func2 = @(t) exp(-beta .* power(t,2));
test = @(x) x.*x;
func3 = @(t) exp(-beta .* power(t,2)) * 10482.058030598;
%a)


namnare = integral(func2, -s, s);

limits = [-s s];
%Ändra denna för få flera h

number = 3;
hs = [];

for a=0:1:number
    
    h = 1 ./ power(2,a);
    dsip("asda");
    disp(["Jobbar på " h]);
    hs(a+1) = h; %Lista av alla h
    Ih2 = 0;
    Ih1 = 0;
    itter = 0;
    for i=limits(1):h:limits(2)
        itter = itter + 1;
        if(i == limits(1))
            Ih1 = Ih1 + func1(i)/2;
            Ih2 = Ih2 + func2(i)/2;
        end
        
        if(i == limits(2))
            Ih1 = Ih1 + func1(i)/2;
            Ih2 = Ih2 + func2(i)/2;
        end
        
        if(i > limits(1) && i < limits(2))
            Ih1 = Ih1 + func1(i);
            Ih2 = Ih2 + func2(i);
        end
    end
    itter;
    Ih1 = Ih1 .* h;
    Ih2 = Ih2 .* h;
    resTrap1(a+1) = Ih1;
    resTrap2(a+1) = Ih2;
    mBarTrap(a+1) = Ih1/Ih2;
    disp(["Färdig med: " h]);
end

disp(["h"  "| Ih(h) - Ih(h/2) |"])
for i=2:1:size(hs')
    errorTrap(i-1) = abs(mBarTrap(i-1) - mBarTrap(i));
    disp([hs(i) errorTrap(i-1)]);
end
