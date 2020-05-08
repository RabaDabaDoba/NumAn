clc;format short;
z = [    0, 500,1000,1500,2000,2500,3000,3500,4000,5000,6000,7000,8000,9000,10000,11000,12000]';
cV = [5050,4980,4930,4890,4870,4865,4860,4860,4865,4875,4885,4905,4920,4935, 4950, 4970, 4990]';
a =5.6596; b = 14.582; c = 257.43; d = 1;
clear p;
p = [a b c]';
hnorm = 1;
tolerans = 1e-8;
jGN = @(p) p(2)/1000 - (p(3).*exp(z/1000))/1000;
fGN = @(p) -cV + 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-1 .* (z/1000));
while hnorm < tolerans
    hnorm
    j =  b/1000 - (c.*exp(z/1000))/1000;
    f =  -cV + 4800 + a + b .* (z/1000) + c .*  exp(-1 .* (z/1000));
    h = -j\f;
    hnorm = norm(h, inf);
    p = p + h;
    a = p(1); b = p(2); c = p(3);
    p
end
p

test = @(z) 4800 + p(1) + p(2) .* (z/1000) + p(3) .*  exp(-1 .* (z/1000));
for i=1:1:size(z)
    f(i) = test(z(i));
end

%sida 338 p8-15 '(350)

plot(z, cV, 'b');
hold on;
plot(z, f, 'r');
legend("Data Points","Approximation");
grid on;