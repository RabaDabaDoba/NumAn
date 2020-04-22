
%OBS!

%Kör U2Log för att få komplett svar för hela fråga 2


format long
syms x;
clear resTrap errorTrap hs;
x = -2:0.1:2;
a = -1:0.1:1;
f = @(x) sqrt(x+2);
I = integral(f, -1, 1);

limits = [-1 1];
number = 10;
hs = [];
for a=0:1:number
    h = 1 ./ power(2,a);
    hs(a+1) = h; %Lista av alla h
    Ih = 0;
    itter = 0;
    for i=limits(1):h:limits(2)
        itter = itter + 1;
        if(i == limits(1))
            Ih = Ih + f(i)/2;
        end
        
        if(i == limits(2))
            Ih = Ih + f(i)/2;
        end
        
        if(i > limits(1) && i < limits(2))
            Ih = Ih + f(i);
        end
    end
    itter;
    Ih = Ih .* h;
    resTrap(a+1) = Ih;
    errorTrap(a+1) = abs(Ih-I);
end

%Visar att felet är 1/4 när h halveras
for i=2:1:size(errorTrap')
   disp(errorTrap(i)/errorTrap(i-1)) 
end

subplot(2,1,2);

loglog(hs, errorTrap, "b*");
legend("SamTrap");
title("Error in log scale")
ylabel("|T(h) - I|")
xlabel("h")
hold on;



