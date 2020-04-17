theta = 40;
s = 2;
beta = 1;
maxgen = @(x) max(generator(theta + x, 0));
func1 = @(t) exp(-beta .* power(t,2)) * 1;
func2 = @(t) exp(-beta .* power(t,2));
test = @(x) x.*x;
%a)

%Lös med function från 2an istället

numerator = integral(func1, -s, s,'RelTol',0.001,'AbsTol',0.1)
