clc
load eiffel1.mat
%load eiffel2.mat
%load eiffel3.mat
%load eiffel4.mat

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

