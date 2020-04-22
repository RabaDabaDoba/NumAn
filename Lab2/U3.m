tic;
theta = 40;
s = 2;
beta = 1;
maxgen = @(x) max(generator(theta + x, 0));
func1 = @(t) exp(-beta .* power(t,2)) * maxgen(t);
func2 = @(t) exp(-beta .* power(t,2));
test = @(x) x.*x;
%a)

%Lös med function från 2an istället

namnare = integral(func2, -s, s,'RelTol',0.001,'AbsTol',0.1)


%Svar 784.8848
taljare = 784.8848;
Ih = Ih * h
mBar = taljare/namnare

