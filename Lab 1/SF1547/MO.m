subplot(2,1,1);
x = -2*pi:0.01:2*pi;
y = power(x,2)-3.*sin(3.*x+2)-1;
plot(x, y)
grid on
hold on
subplot(2,1,2);
i=1;
x(i)=0;
%error(i)=9999;
error = 9999;

while error >= 0.00000000000000000000001
   x(i+1)=(1/9) .* (power(x(i),2) - 3.*sin(3.*x(i)+2)-1) + x(i); 
   if i > 2
    error = abs(x(i)-x(i-1));
   end
   
   i = i + 1
end
