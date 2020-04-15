function f=f_robotarm(z0,t,ts1,ts2,alpha,beta,gamma,omega)
%% Computes the right-hand side of the robot differential equation
%
% * z0 is a vector containing [theta1(t);theta1prime(t);theta2(t);theta2prime(t)]
% * t is the current time
% ts1,ts2 is the two wanted angles.
% 
% The return value f is the right-hand side of the differential equation
% (with four variables)
% 


f=zeros(size(z0));
f(1)=z0(2);
f(2)=-alpha*(z0(1)-.... 
f(3)=z0(4);
f(4)=-alpha*(z0(3)-.... 


