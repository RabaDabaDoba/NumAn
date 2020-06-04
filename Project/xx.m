function dZ = xx(x,Z)

c = @(z) 4800 + 5.6596 + 14.582 .* (z/1000) + 257.43 .*  exp(-1 .* (z/1000));
z0 = Z(1); %feet
beta0 = 13.5; %grader
zprim = Z(2);%tan(beta0);
ray = 30 * 6076;
q0 = (c(z0)/(cos(beta0)))^2;
cprim = 14.582/1000 - (257.43*exp(-Z(1)/1000))/1000;
zbis = -q0 .* (14.582/1000 - (257.43*exp(-Z(1)/1000))/1000/c(Z(1))^3);
dZ = zeros(2,1);
dZ(1) = zprim;
dZ(2) = zbis;
end

