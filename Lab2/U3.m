theta = 40;
s = 2;
beta = 1;
gen = max(generator(theta + 0, 0));
maxgen = @(t) max(generator(theta + t, 0));
func1 = @(t) exp(-beta .* power(t,2)) * maxgen(t);
func2 = @(t) exp(-beta .* power(t,2));
test = @(x) x.*x;
%a)

%Lös med function från 2an istället

numerator = integral(func1, -s, s)
