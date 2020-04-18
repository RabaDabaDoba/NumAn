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


%b)
limits = [-s s];
%h = 0.025;
h= 0.2;
Ih = 0;
counter = 1;    
sum = 2 * s;



%Svar 784.8848
taljare = 784.8848;
Ih = Ih * h
mBar = taljare/namnare

