clc
value = 10;
%maxValues = zeros(1,value);
%sumValues = zeros(1,value);
clear maxValues;
clear sumValues;
counter = 2;
% for i=0:10:100
%    u = generator(i,0);
%    clear max
%    maxGen = max(u);
%    if(maxGen >= 1.05e+04)
%       disp(["Theta:",i]);
%       maxValues(counter) = maxGen;
%       clear sum
%       sumValues(counter) = 1.05.*10^4 - maxGen;
%       counter = counter + 1;      
%    end
% end

% xn = 41;
% xn1 = 40;
% fxn = max(generator(xn,0));
% fxn1 = max(generator(xn1,0));
% a(1) = xn - fxn .* ((xn - xn1)./(fxn - fxn1)); 

% clear f;
% f = @(x)x^7 - 1000;
% a(1) = 2;
% a(2) = 3;
% while(counter <= 10)
%  a(counter+1) = a(counter) - ((f(a(counter)))/((f(a(counter))-f(a(counter-1)))./(a(counter)-a(counter-1))))
%  counter = counter + 1;
% end

M = 1.05e04;
clear f;
clear a;
clear error;
a(1) = 40;
a(2) = 41;

% maxIt = 50;
% tolerance = 0.001;
% error(1) = abs(a(2) - a(1));
% while(error(counter-1) >= tolerance) && (counter <= maxIt)
while(counter <= 5)
 fxn = max(generator(a(counter),0)) - M;
 fxn1 = max(generator(a(counter-1),0))- M;
 a(counter+1) = a(counter) - fxn .* ((a(counter)-a(counter-1))./(fxn-fxn1))
 %error(counter+1) = abs(a(counter) - a(counter-1))
 counter = counter + 1;
end


% subplot(2,1,1);
% plot(maxValues)
% title("MaxValues");
% subplot(2,1,2);
% plot(sumValues)
% title("SumValues");