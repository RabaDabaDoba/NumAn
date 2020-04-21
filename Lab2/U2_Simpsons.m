format long
syms x;
clear resSimp errorSimp hs;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
I = integral(f, -1, 1);

limits = [-1 1]; %a b
%h = (limits(2)-limits(1))/n %Ska vara myckte mindre än 1;
%h = 0.5;
number = 10;
hs = [];

for a=0:1:number
    h = 1 ./ power(2,a);
    hs(a+1) = h; %Lista av alla h
    %h = hs(a);
    Ih = 0;
    itter = 0;
    even = 0; 
    odd = 0;
    for i=limits(1):h:limits(2)
        
        if(i == limits(1))
            Ih = Ih + f(i);
        end
        
        if(i == limits(2))
            Ih = Ih + f(i);
        end
        
        if(i > limits(1) && i < limits(2))
            if(mod(itter,2)==0) %Even
                even = even + f(i);
            else
                odd = odd + f(i);
            end
        end
        itter = itter + 1;
    end
    itter;
    Ih = (h./3) .* (Ih + 4 .* odd + 2 .* even);
    resSimp(a+1) = Ih;
    errorSimp(a+1) = abs(Ih-I);
    
    %Ih(i)-Ih(i-1)
end

for i=2:1:size(errorSimp')
   errorSimpFel(i-1)=errorSimp(i-1)/errorSimp(i);
   disp(errorSimpFel(i-1));
end


subplot(2,1,2);
loglog(hs, errorSimp, 'r*');
legend("SamTrap", "Simpson");



















% format long
% syms x;
% x = -2:0.1:2;
% a = -1:0.1:1;
% f = @(x) sqrt(x+2);
% q = integral(f, -1, 1)
% 
% n = 1000000;
% limits = [-1 1]; %a b
% %h = (limits(2)-limits(1))/n %Ska vara myckte mindre än 1;
% %h = 0.5;
% hs = [1, 0.5, 0.25, 0.125, 0.0625, 0.0625/2, 0.0625/4, 0.0625/8];
% 
% 
% %disp(["Counter" "increment" "x value" "I" "|T(h) - I|"]);
% sum = abs(limits(1)) + abs(limits(2));
% clear finalError;
% for k=1:1:size(hs')
%     h = hs(k);
%     I = 0;
%     counter = 1;
%     summaOdd = 0;
%     summaEven = 0;
%     disp("Error");
%     
%     while (h*counter < 1)
%         %h*counter
%         currentValue = limits(1) + counter*h*sum;
%         increment = 0;
%         if(rem(counter, 2) == 0)
%             %Jämna
%             %disp("Even");
%             incr(counter+1) = f(currentValue);
%             summaEven = summaEven + incr(counter+1);
%         else
%             %Udda
%             %disp("Odd");
%             incr(counter+1) = f(currentValue);
%             summaOdd = summaOdd + incr(counter+1);
%         end
%         error(counter+1) = abs(incr(counter+1) - q);
%         disp(error(counter+1) );
%         counter = counter + 1;
%     end
%     
%     I = (h./3).*(f(limits(1)) + 4.*summaOdd + 2.*summaEven + f(limits(2)));
%     finalError1(k) = abs(I*2 - q);
% end
% disp("Error(i)/Error(i-1)        Error(i)/Error(i-1) * 16 ");
% 
% for i=2:1:size(finalError1')
%     disp([finalError1(i)/finalError1(i-1) finalError1(i)/finalError1(i-1)*16])
%     
% end
% loglog(hs, finalError1, 'g*')
% hold on
% loglog(hs, 16 * finalError1, 'g')
% % 
% % syms x;
% % x = -2:0.1:2;
% % a = -1:0.1:1;
% % f = @(x) sqrt(x+2);
% % q = integral(f, -1, 1)
% % 
% % n = 1000000;
% % limits = [-1 1]; %a b
% % %h = (limits(2)-limits(1))/n %Ska vara myckte mindre än 1;
% % %h = 0.5;
% % hs = [1, 0.5, 0.25, 0.125, 0.0625];
% % h = hs(1);
% % I = 0;
% % counter = 0;
% % %disp(["Counter" "increment" "x value" "I" "|T(h) - I|"]);
% % sum = abs(limits(1)) + abs(limits(2));
% % clear summaOdd summaEven;
% % summaOdd = 0;
% % summaEven = 0;
% % disp("Error");
% % 
% % for k=h:h:1-h
% %     %h*counter
% %     currentValue = limits(1) + counter*h*sum;
% %     increment = 0;
% %     if(rem(counter, 2) == 0)
% %         %Jämna
% %         %disp("Even");
% %         incr(counter+1) = f(h);
% %         summaEven = summaEven + incr(counter+1);
% %     else
% %         %Udda
% %         %disp("Odd");
% %         incr(counter+1) = f(h);
% %         summaOdd = summaOdd + incr(counter+1);
% %     end
% %     error(counter+1) = abs(incr(counter+1) - q);
% %     disp(error(counter+1) );
% %     counter = counter + 1;
% % end
% % counter
% % I = (h./3).*(f(limits(1)) + 4.*summaOdd + 2.*summaEven + f(limits(2)))
% % Ih = I*2