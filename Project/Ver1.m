Ti = 350; %Ti = 350 [?C].
innerradie = 1; %alpha
ytterradie = 2; %beta
Te = 20; %n Te = 20 [C?].
k = 50;
alpha = 15;
N = 50; h = 1/N; %rj = 1 + jh, h = 1/N

%Vi ska st�lla upp ett linj�rt kevationsystem och l�sa "allt p� en g�ng"
%r kommer att g� fr�n 1 --> 2.
% u(1) = 350, u(2) = 20
% Diskretisera det yttre randvillkoret: 
% k * (3uN - 4uN-1 + uN-2) / 2h, O(h^2) kan f�rsummas.

%Vid j = 2 utnyttjar vi att u0 = Ti;
% Vi f�r: (3*u2  - 4*u1 + Ti) / 2*h = f(x1)



%Vid j = N-2 utnyttjar vi att u0 = Ti;
% Vi f�r: (3*Te  - 4*uN-1 + uN-2) / 2*h = f(xN)

for r=innerradie:h:ytterradie
    
    
    
    
end