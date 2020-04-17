function plot_robotarm(thetav)
% Plots a robotarm with angles thetav
R=1;
xv=zeros(length(thetav)+1,1);
yv=zeros(length(thetav)+1,1);
for i=1:length(thetav)
    xv(i+1)=xv(i)+R*cos(thetav(i));
    yv(i+1)=yv(i)+R*sin(thetav(i));
end
% Plot with colors
opts={'r-o','MarkerSize',10,'MarkerFaceColor','blue','LineWidth',3};
plot(xv,yv,opts{:});
axis equal
axis([-2 2 -2 2])
drawnow;