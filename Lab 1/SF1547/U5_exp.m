load minidigits.mat
format long g
xaxis = [];
yaxis = [];
yaxis2 = [];

yaxiscc = [];
yaxisff = [];


ratio = [];
for k=0:0.1:10
    xaxis = [xaxis k];
    
    ccCounter = 0;
    cfCounter = 0;
    ffCounter = 0;
    fcCounter = 0;
    A = C'*C; %RÅKADE TA BORT I FILEN VI SKICKA IN
    for j = 1:1:1000
        b = C'*testdata(:,j);
        x = A\b;
        nv(j) = norm(C*x-testdata(:,j)); %Calculations
        if(nv(j) < k)%Vi tror att det är en tvåa!
            if testdatad(j) == 2
                ccCounter = ccCounter + 1;
            else
                cfCounter = cfCounter + 1;
            end
        else %Vi tror inte att det är en tvåa
            if testdatad(j) == 2
                fcCounter = fcCounter + 1;
            else
                ffCounter = ffCounter + 1;
            end
            
        end
    end
    yaxis = [yaxis (ccCounter./101 .* ffCounter./899)];
    yaxiscc = [yaxiscc ccCounter./101];
    yaxisff = [yaxisff ffCounter./899];
    %disp([ccCounter/101 (cfCounter/899) ffCounter/899 (fcCounter/101)]);
    
end
%x = 5.1 --> bästa threshold
plot(xaxis, yaxis, 'b');
hold on;
plot(xaxis, yaxiscc, 'g');
hold on;
plot(xaxis, yaxisff, 'r');
hold off;
legend("Ratio", "Successful correct", "Successful false");
title("Best estimation of k");
ylabel("Score");
xlabel("Threshold value (k)");
