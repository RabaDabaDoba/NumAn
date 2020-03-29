function  u=generator(theta,plotsol)
% function u=generator(theta,plotsol)
%
% Carries out simulations based on the model of a generator 
% described here
%   https://www.comsol.se/model/generator-in-2d-2122
% The problem is prepared such that no comsol installation is
% required, you only need to download the mat-file
% generator_data.mat
% 
% Input: 
%  theta: The problems models a defect specified in theta (percent).
%  theta=0 no defect, theta=100 very defect
% 
% plotsol: zero or one and specifies if you want to plot the
%  solution. Plotting the solution can be computationally demanding
%  due to the size of the problem.
%  
% Output: 
% u is a vector with the magnitezation (unspecified unit)
% in certain points in the generator. 
%
% Example: plots the defect free problem.
% >> u=generator(0,1)
% >> max(u) % compute maximum magnetization in the generator
%
% This program is based on advanced numerical methods (most
% importantly the finite element method), which are not covered in
% the basic numerical methods course. You do not need to understand
% this program to solve the exercise.
%
% Elias Jarlebring 2018-03-15
%

load('generator_data.mat');
A=full(Ac)*1e10; % Normalization

if (plotsol)
   clf;
   drawnow;
end


% find appropriate coordinates:
d=sqrt((coords(1,:)).^2+(coords(2,:)).^2);
I0=int32(find(d<0.05));
% The corresponding triangle indices
[II1,JJ]=find(triangles(1,:)-I0' == 0);
[II2,JJ]=find(triangles(2,:)-I0' == 0);
[II3,JJ]=find(triangles(3,:)-I0' == 0);
II=unique([II1;II2;II3]);
% Change corresponding elements in the RHS-vector 
B=b(dofs(:,II)+1);
B=B-20*theta/100;
borg=b;
b(dofs(:,II)+1)=B;
% Also modify A-matrix.
g=1e-5;
A(II,II)=A(II,II)+g*ones(size(II))*theta/100;
% Solve the linear system of equation FEM 
tic
u=A\b; 
%elapsed_time_linsys=toc; % CPU-time to solve linear system



X=zeros(size(triangles));
Y=zeros(size(triangles));
C=zeros(size(triangles));
if (plotsol)
    zz=N*u;
    fprintf('Start plot computations.')
    for k=1:size(triangles,2);
        tri=triangles(:,k);
        xv=coords(1,tri+1);
        yv=coords(2,tri+1);
        dofv=dofs(:,k);
        myz=zz(dofv+1);
        %myz=b(dofv+1);    % plot rhs instead
        X(:,k)=xv;
        Y(:,k)=yv;
        C(:,k)=myz;
    end
    fprintf(' Finished plot computations.\n')
    clf;
    if (plotsol==1)
        fill(X,Y,C,'EdgeColor','None') ;    
    else  % Plot also the FEM-mesh
        fill(X,Y,C) ;
    end
    
    axis equal

end
