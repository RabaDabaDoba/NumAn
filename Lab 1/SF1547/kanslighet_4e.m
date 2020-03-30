
% Kanslighet
% 4e

 load eiffel1.mat
% load eiffel2.mat
% load eiffel3.mat
% load eiffel4.mat
subplot(2,1,1);
spy(A);

A = sparse(A); % talar om f�r MATLAB att matrisen �r gles

N = size(A,1);
forsk=zeros(N/2,1);


tic;
%[L, U] = lu(A);
for j=1:N/2
  b = zeros(N,1); b(2*j) = -1;  % Applicera kraft i nod j
  
  %x = U \ (L \ b);            % Ber�kna f�rskjutningarna
  x = A\b;   
  
  forsk(j) = norm(x); % Spara normen av f�rskjutningen i forsk-vektorn
end
toc

[fmax, jmax] = max(forsk);  % Maximala f�rskjutningen med index
[fmin, jmin] = min(forsk);  % Minimala f�rskjutningen med index

% Plotta tornet med de maximalt ('o') och
% minimalt ('*') k�nsliga noderna markerade

subplot(2,1,2);
trussplot(xnod,ynod,bars); hold on
plot(xnod(jmax),ynod(jmax),'ro',xnod(jmin),ynod(jmin),'r*');
hold off
