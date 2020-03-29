format long g

maxIt = 50;
tolerance = 0.001;
counterc = 1;

for j=-1:0.01:3
    guess = j;
    a(1) = guess - f(guess)/fx(guess);
    error(1) = abs(a(1) - guess);
    counter = 2;
    current = 0;
    %log log error
    while (error(counter-1) >= tolerance) && (counter <= maxIt)
        i = counter;
        current = a(i-1) - (f(a(i-1))./fx(a(i-1)));
        a(i) = current;
        %disp(['counter: ', num2str(i), '   ', num2str(a(i))]);
        error(i) = abs(a(counter) - a(counter-1));
        counter = counter +1;
        
    end
    b(counterc) = current;
    counterc = counterc + 1;
    
end
disp(["Max: ", max(b),"Min: ", min(b)]);
%disp(b)


function y = f(x)
y = power(x,2)-3.*sin(3.*x+2)-1;
%y = x.^3 - 4.*x.^2 +1;
end

function yx = fx(x)
yx = 2.*x - 9.*cos(3.*x + 2);
%yx = 3*x^2 - 8*x;
end