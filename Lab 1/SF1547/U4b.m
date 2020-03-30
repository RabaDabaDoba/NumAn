clc
load eiffel1.mat
A1 = A;
load eiffel2.mat
A2 = A;
load eiffel3.mat
A3 = A;
load eiffel4.mat
A4 = A;

N = size(A, 1);
b = randn(N, 1); % godtyckligt tal b

laps = 50;
i = 1;
elapsedTime = 0;

while(i <= laps)
disp(i)

tic;
x = A \ b;
%x = inv(A) * b;
toc;

elapsedTime = elapsedTime + toc;
i = i + 1;
end

mean = elapsedTime / laps;
disp("Mean value: " + mean)

