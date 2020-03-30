format long g;
Startgissning = 1;
counter = 1;
clear x;
clear error;
x(1) = Startgissning;
while counter < 10
    clear answer;
    answer = (1/9) .* (power(x(counter),2) - 3.*sin(3.* x(counter) + 2) - 1) + x(counter);
    
    %Linjär konvergens
    x(counter + 1) = answer;
    error(counter) = abs(x(counter+1) - x(counter));
    %disp(["Error:" error]);
    counter = counter + 1;
end
loglog(sort(error));
disp(["Answer" answer])
%Vi får två rötter: 1.617302479860036,   -0.720353075847192