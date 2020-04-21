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

% %Lös med function från 2an istället
% 
% namnare = integral(func2, -s, s);
% hs = [1, 0.5, 0.25, 0.125, 0.0625];
% 
% %b)
% limits = [-s s];
% %h = 0.025;
% clear results;
% for k=1:1:size(hs')
%     h= hs(k);
%     Ih2 = 0;
%     Ih1 = 0;
%     counter = 1;
%     sum = abs(limits(1)) + abs(limits(2));
%     summaOdd1 = 0;
%     summaEven1 = 0;
%     summaOdd2 = 0;
%     summaEven2 = 0;
%     
%     while (h*counter < 1)
%         %h*counter
%         currentValue = limits(1) + counter*h*sum;
%         if(rem(counter, 2) == 0)
%             %Jämna
%             %disp("Even");
%             summaEven1 = summaEven1 + func1(currentValue);
%             summaEven2 = summaEven2 + func2(currentValue);
%         else
%             %Udda
%             %disp("Odd");
%             summaOdd1 = summaOdd1 + func1(currentValue);
%             summaOdd2 = summaOdd2 + func2(currentValue);
%         end
%         %error(counter+1) = abs(incr(counter+1) - q);
%         %disp(error(counter+1) );
%         counter = counter + 1;
%     end
%     
%     Ih1 = (h./3).*(func1(limits(1)) + 4.*summaOdd1 + 2.*summaEven1 + func1(limits(2)))*4
%     Ih2 = (h./3).*(func2(limits(1)) + 4.*summaOdd2 + 2.*summaEven2 + func2(limits(2)))*4
%     mBar = Ih1/Ih2;
%     results2(k) = mBar;
%     disp(["Done with " + hs(k)])
% end
% 
% loglog(hs, results2, 'r*');






number = 1;
hs = [];
limits = [-s s];
disp("asd")
for a=0:1:number
    h = 1 ./ power(2,a);
    disp(["Jobbar på " h])
    hs(a+1) = h; %Lista av alla h
    %h = hs(a);
    itter = 0;
    Ih1 = 0;
    even1 = 0; 
    odd1 = 0;
    Ih2 = 0;
    even2 = 0; 
    odd2 = 0;
    for i=limits(1):h:limits(2)
        
        if(i == limits(1))
            Ih1 = Ih1 + func1(i);
            Ih2 = Ih2 + func2(i);
        end
        
        if(i == limits(2))
            Ih1 = Ih1 + func1(i);
            Ih2 = Ih2 + func2(i);
        end
        
        if(i > limits(1) && i < limits(2))
            if(mod(itter,2)==0) %Even
                even1 = even1 + func1(i);
                even2 = even2 + func2(i);
            else
                odd1 = odd1 + func1(i);
                odd2 = odd2 + func2(i);
            end
        end
        itter = itter + 1;
    end
    itter;
    Ih1 = (h./3) .* (Ih1 + 4 .* odd1 + 2 .* even1);
    Ih2 = (h./3) .* (Ih2 + 4 .* odd2 + 2 .* even2);
    resSimp1(a+1) = Ih1;
    resSimp2(a+1) = Ih2;
    mBarSimp(a+1) = Ih1/Ih2;
    disp(["Färdig med: " h])
    %errorSimp(a+1) = abs(Ih1-I);
end

disp(["h"  "| Ih(h) - Ih(h/2) |" "|Ih(h/2)-I| - |Ih(h/2)-Ih|"])
for i=2:1:size(hs')
    errorSimp1(i-1) = abs(mBarSimp(i-1) - mBarSimp(i));
    errorSimp2(i-1) = abs(mBarSimp(i) - 10500) - errorSimp1(i-1);
    disp([hs(i) errorSimp1(i-1) errorSimp2(i-1)])
end


 




%40.8696451741481
%10499.9999999996

