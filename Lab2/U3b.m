tic;
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

namnare = integral(func2, -s, s)


%b)
limits = [-s s];
%h = 0.025;
clear results1;
for k=1:1:size(hs')
    h= hs(k);
    Ih2 = 0;
    Ih1 = 0;
    counter = 1;
    sum = abs(limits(1)) + abs(limits(2));
    Ih2 = Ih2 + func2(limits(1))/2;
    Ih1 = Ih1 + func1(limits(1))/2;
    
    while (h*counter < 1)
        
        Ih2 = Ih2 + func2(limits(1) + counter*h*sum);
        Ih1 = Ih1 + func1(limits(1) + counter*h*sum);
        
        counter = counter + 1;
    end
    
    Ih2 = Ih2 + func2(limits(2))/2;
    Ih2 = Ih2*h*2*2
    Ih1 = Ih1 + func1(limits(2))/2;
    Ih1 = Ih1*h*2*2
    
    mBar = Ih1/Ih2;
    results1(k) = mBar;
    disp(["Done with " + hs(k)])
end

loglog(hs, results1-10499.9999999996, 'r*')
hold on;
%Svar 784.8848
% taljare = 784.8848;
% Ih = Ih * h
% mBar = taljare/namnare

