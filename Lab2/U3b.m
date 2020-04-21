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

%Lös med function från 2an istället

namnare = integral(func2, -s, s);


%b)
% limits = [-s s];
% hs = [1, 0.5, 0.25, 0.125, 0.0625];
% %h = 0.025;
% clear results1;
% for k=1:1:size(hs')
%     h= hs(k);
%     Ih2 = 0;
%     Ih1 = 0;
%     counter = 1;
%     sum = abs(limits(1)) + abs(limits(2));
%     Ih2 = Ih2 + func2(limits(1))/2;
%     Ih1 = Ih1 + func1(limits(1))/2;
%     
%     while (h*counter < 1)
%         
%         Ih2 = Ih2 + func2(limits(1) + counter*h*sum);
%         Ih1 = Ih1 + func1(limits(1) + counter*h*sum);
%         
%         counter = counter + 1;
%     end
%     
%     Ih2 = Ih2 + func2(limits(2))/2;
%     Ih2 = Ih2*h*2*2
%     Ih1 = Ih1 + func1(limits(2))/2;
%     Ih1 = Ih1*h*2*2
%     
%     mBar = Ih1/Ih2;
%     results1(k) = mBar;
%     disp(["Done with " + hs(k)])
% end
% 
% loglog(hs, results1-10499.9999999996, 'r*')
% hold on;
% %Svar 784.8848
% % taljare = 784.8848;
% % Ih = Ih * h
% % mBar = taljare/namnare
limits = [-s s];
number = 3;
hs = [];

for a=0:1:number
    
    h = 1 ./ power(2,a);
    disp(["Jobbar på " h])
    hs(a+1) = h; %Lista av alla h
    %h = hs(a);
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
    disp(["Färdig med: " h])
    %errorTrap(a+1) = abs(Ih-I);
end

disp(["h"  "| Ih(h) - Ih(h/2) |"])
for i=2:1:size(hs')
    errorTrap(i-1) = abs(mBarTrap(i-1) - mBarTrap(i));
    disp([hs(i) errorTrap(i-1)]);
end
