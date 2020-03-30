
load eiffel1.mat

n = 261;
j = 180;

plot(xnod(j), ynod(j), '*'), hold on; % plottar vald nod
trussplot(xnod, ynod, bars), hold on;

% högerriktad kraft = 1 för något j
b = zeros(2*n, 1); 
b(2 * j - 1) = 1; 

% A = styvhetsmatrisen, b = givna yttre krafter som verkar på noderna
% löser Ax = b för att få fram förskjutningarna i alla punkter
x = A \ b; 

xbel = xnod + x(1:2:end); 
ybel = ynod + x(2:2:end);

trussplot(xbel, ybel, bars, 'b')








