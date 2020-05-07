clearvars;
z = [    0, 500,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000,11000,12000];
cV = [5050,4980,4930,4890,4870,4865,4860,4860,4865,4875,4885,4905,4920,4935, 4950, 4970, 4990];
format short g;
syms p1 p2 p3 p4;

%c = @(x,y,z) 4800 + p1 + p2 .* (z/1000) + p3 .* exp(-p4 .* (z/1000));

%A = [1  0 1; 1  1  1/exp(1); 1 12 0];
%b = [250;130;190];

for i=1:1:size(z')
    A(i,:) = [1 z(i)/1000 exp(-1 .* (z(i)/1000))];
    b(i,:) = cV(i) - 4800;
end  
p = A\b %start gissningar
test = @(z) 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-1 .* (z/1000));
for i=1:1:size(z')
    f(i) = test(z(i));
    error(i) = abs(f(i) - cV(i));
end  

plot(z, cV, 'b');
hold on;
plot(z, f, 'r');
legend("Data Points","Approximation");
grid on;


%a) v2

%Från assen: begynnelse data vid t0, vi har en andra, skriv on till första ordning. Derivator i vänster, skicka in höger


%Hur ska vi använda Gauss Newton när vi har 17 (storlek av z) ekvationer med olika z?
%%%fGN = 0;
%%Stoppa in hela skiten

jGN = @(p) p(2)/1000 - (p(3).*exp(z/1000))/1000;
fGN = @(p) cV - 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-1 .* (z/1000));
while 1
    %Evaluera f
    b = fGN(p);
    %Evaluera jacobian
    A = jGN(p);
    d = -A\b; 
    p = p + d(1:3)
  if norm(d)<=1e-15  % stop iteration if norm(d)<=StepTolerance
    break
  end

end

%b)

% c = @(z) 4800 + 5.6596 + 14.582 .* (z/1000) + 257.43 .*  exp(-1 .* (z/1000));
% z0 = 5000; %feet
% beta0 = 13.5; %grader
% zprim = tan(beta0);
% ray = 30 * 6076;
% q0 = (c(z0)/(cos(beta0)))^2;
% cprim = @(z) 14.582/1000 - (257.43*exp(-z/1000))/1000;
% zbis = @(z) -q0 .* (cprim(z)/c(z)^3);
% 
% u = [z0, zprim];

% 
% F = @(x,y,z) 4800 + 5.6596 + 14.582 .* (z/1000) + 257.43 .*  exp(-1 .* (z/1000));
% J = @(x,y,z) 7291/500000 - (25743*exp(-z/1000))/100000;
% 
% 
% x=[40.2837];
% tau=1e-10;
% dxnorm=1;
% iter=0;
% while (dxnorm>tau && iter<100)
%     dx = -J(0,0,x)\F(0,0,x);
%     dxnorm = norm(dx);
%     x = x + dx;
%     iter = iter+1;
% end
% 
% iter
% x
% 



% test = @(z, g1, g2, g3) 4800 + g1 + g2 .* (z/1000) + g3 .*  exp(-1 .* (z/1000));
% 
% counter = 1;
%     for g1=413.1-10:1:413.1+10
%         for g2=-223.1-10:1:-223.1+10
%             for g3=-163.1-10:1:-163.1+10
%                 clear error;
%                 for i=1:1:size(z')
%                     error(i) = abs(test(z(i),g1,g2,g3) - cV(i));
%                 end  
%                 
%                 totalError(counter) = sum(error);
%                 counter = counter + 1;
%                 
%             end
%         end
%         
%     end

%error 