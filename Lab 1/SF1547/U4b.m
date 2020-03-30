clc
load eiffel1.mat
Mat(1) = A;
load eiffel2.mat
Mat(2) = A;
load eiffel3.mat
Mat(3) = A;
load eiffel4.mat
Mat(4) = A;

disp(["N" "A\b" "inv(A)*b"])

for j=1:1:4
    currentA = Mat(j);
    
    N = size(currentA, 1);
b = randn(N, 1); % godtyckligt tal b

laps = 50;
i = 1;
elapsedTime1 = 0;
elapsedTime2 = 0;

while(i <= laps)
disp(i)

tic;
x1 = currentA \ b;
toc;

elapsedTime1 = elapsedTime1 + toc;

tic;
x2 = inv(A) * b;
toc;

elapsedTime2 = elapsedTime2 + toc;

i = i + 1;
end

%mean = elapsedTime / laps;
%disp("Mean value: " + mean)
disp([N elapsedTime1/laps elapsedTime2/laps])
    
end








