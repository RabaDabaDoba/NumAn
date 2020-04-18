format long
syms x;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
q = integral(f, -1, 1)

n = 1000000;
limits = [-1 1]; %a b
%h = (limits(2)-limits(1))/n %Ska vara myckte mindre �n 1;
%h = 0.5;
hs = [1, 0.5, 0.25, 0.125, 0.0625];


%disp(["Counter" "increment" "x value" "I" "|T(h) - I|"]);
sum = abs(limits(1)) + abs(limits(2));
clear finalError;
for k=1:1:size(hs')
    h = hs(k);
    I = 0;
    counter = 1;
    summaOdd = 0;
    summaEven = 0;
    disp("Error");
    
    while (h*counter < 1)
        %h*counter
        currentValue = limits(1) + counter*h*sum;
        increment = 0;
        if(rem(counter, 2) == 0)
            %J�mna
            %disp("Even");
            incr(counter+1) = f(currentValue);
            summaEven = summaEven + incr(counter+1);
        else
            %Udda
            %disp("Odd");
            incr(counter+1) = f(currentValue);
            summaOdd = summaOdd + incr(counter+1);
        end
        error(counter+1) = abs(incr(counter+1) - q);
        disp(error(counter+1) );
        counter = counter + 1;
    end
    
    I = (h./3).*(f(limits(1)) + 4.*summaOdd + 2.*summaEven + f(limits(2)));
    finalError1(k) = abs(I*2 - q);
end
disp("Error(i)/Error(i-1)        Error(i)/Error(i-1) * 16 ");

for i=2:1:size(finalError1')
    disp([finalError1(i)/finalError1(i-1) finalError1(i)/finalError1(i-1)*16])
    
end
loglog(hs, finalError1, 'g*')
hold on
loglog(hs, 16 * finalError1, 'g')
% 
% syms x;
% x = -2:0.1:2;
% a = -1:0.1:1;
% f = @(x) sqrt(x+2);
% q = integral(f, -1, 1)
% 
% n = 1000000;
% limits = [-1 1]; %a b
% %h = (limits(2)-limits(1))/n %Ska vara myckte mindre �n 1;
% %h = 0.5;
% hs = [1, 0.5, 0.25, 0.125, 0.0625];
% h = hs(1);
% I = 0;
% counter = 0;
% %disp(["Counter" "increment" "x value" "I" "|T(h) - I|"]);
% sum = abs(limits(1)) + abs(limits(2));
% clear summaOdd summaEven;
% summaOdd = 0;
% summaEven = 0;
% disp("Error");
% 
% for k=h:h:1-h
%     %h*counter
%     currentValue = limits(1) + counter*h*sum;
%     increment = 0;
%     if(rem(counter, 2) == 0)
%         %J�mna
%         %disp("Even");
%         incr(counter+1) = f(h);
%         summaEven = summaEven + incr(counter+1);
%     else
%         %Udda
%         %disp("Odd");
%         incr(counter+1) = f(h);
%         summaOdd = summaOdd + incr(counter+1);
%     end
%     error(counter+1) = abs(incr(counter+1) - q);
%     disp(error(counter+1) );
%     counter = counter + 1;
% end
% counter
% I = (h./3).*(f(limits(1)) + 4.*summaOdd + 2.*summaEven + f(limits(2)))
% Ih = I*2