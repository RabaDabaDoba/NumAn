load minidigits.mat

xaxis = [];
yaxis = [];
yaxisInv = [];

for k=0:0.1:10
    xaxis = [xaxis k];
    clear g;
    g = [];
    A = C'*C;
    for j = 1:1:1000
        b = C'*testdata(:,j);
        x = A\b;
        nv(j) = norm(C*x-testdata(:,j)); %Calculations
        if(nv(j) < k)%Filtrerar ut värden mindre än toleransen
            g = [g j]; %Add values to list
        end
    end
    
    clear counterC;
    clear counterF;
    counterC=0;
    counterF=0;
    for i=1:1:length(g) %Calculate the hit rate
        if testdatad(g(i)) == 2
            counterC = counterC+1;
        else
            counterF = counterF + 1;
        end
        
    end
    yaxis = [yaxis (counterC/(counterF+counterC))];
    yaxisInv = [yaxisInv 1-(counterC/(counterF+counterC))];
    
    
    
end
plot(xaxis, yaxis, 'b');
hold on;
plot(xaxis, yaxisInv, 'r');
hold off
legend("Hits","Misses");
title("Hit/miss rate");
ylabel("Percentage (%)");
xlabel("Threshold value (k)");

%disp(["Ration:", counterC, counterF,counterC/(counterF+counterC)])