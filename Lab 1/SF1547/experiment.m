
load eiffel1.mat

% n = 261;
% trussplot(xnod,ynod,bars)
% hold on;
% belastning = 3;
% nod = 180;
% 
% b=zeros(2*n,1); 
% b(nod*2-1)=belastning;
% 
% x=A\b;
% 
% xbel = xnod + x(1:2:end); 
% ybel = ynod + x(2:2:end);
% 
% trussplot(xbel,ybel,bars, "r")
% 
% clc

N = size(A, 1);
b = randn(N, 2); % godtyckligt tal b

