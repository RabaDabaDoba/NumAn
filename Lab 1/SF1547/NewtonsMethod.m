function NewtonsMethod(f,df,start,maxIt,tolerance)


a = zeros(1,maxIt);
error = zeros(1,maxIt);
a(1) = start - f(start)./df(start);
error(1) = abs(a(1) - start);
counter = 2; 




while (error(counter-1) >= tolerance) && (counter <= maxIt)
   i = counter;
   a(i) = a(i-1) - (f(a(i-1))./df(a(i-1)));
   disp(['counter: ', num2str(i), '   ', num2str(a(i))]);
   error(i) = abs(a(counter) - a(counter-1));
   counter = counter +1;

end
end

