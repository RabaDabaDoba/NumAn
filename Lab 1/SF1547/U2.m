clc
counter = 2;
M = 1.05e04;
%Genom att studera en graf med v�den fr�n alla maxv�rden f�r olika theta
%mellan 0-100. S� kan man observera att max(generator(40,0)) �r ungef�r
%lika med M
a(1) = 40;
a(2) = 41;
disp('    a            e          ');
maxIt = 10;
tolerance = 1e-8;
error(1) = abs(a(2) - a(1));
disp([a(2) error(1)]);

while(error(counter-1) >= tolerance) && (counter <= maxIt)
 fxn = max(generator(a(counter),0)) - M; %f(x)
 fxn1 = max(generator(a(counter-1),0))- M; %(f(x-1))
 current = a(counter) - fxn .* ((a(counter)-a(counter-1))./(fxn-fxn1));
 a(counter+1) = current;
 error(counter) = abs(a(counter) - a(counter-1));
 maxValues(counter-1) = error(counter);
 disp([current error(counter)]);
 counter = counter + 1;
end
