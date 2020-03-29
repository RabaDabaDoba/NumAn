load minidigits.mat

xaxis = [];
yaxis = [];

for k=0:0.01:10
    xaxis = [xaxis k];
    clear g;
    g = [];
    A = C'*C;
    for j = 1:1000
        b = C'*testdata(:,j);
        x = A\b;
        nv(j) = norm(C*x-testdata(:,j));
        %Filter out values of nv(k) that are smaller than the 
        if(nv(j) < k)
            g = [g j];
        end
    end
    
    clear counterC;
    clear counterF;
    counterC=0;
    counterF=0;
    for i=1:1:length(g)
        if 2 == testdatad(g(i))
            counterC = counterC+1;
        else
            counterF = counterF + 1;
        end
        
    end
    yaxis = [yaxis (counterC/(counterF+counterC))];
    
end
plot(xaxis, yaxis);
%disp(["Ration:", counterC, counterF,counterC/(counterF+counterC)])