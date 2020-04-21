clf;
p1  = [93 63];
p2  = [6 16];
p3  = [20 83];
r   = [55.1 46.2 46.2];
viscircles(p1, r(1), "Color", 'g');
viscircles(p2, r(2), "Color", 'm');
viscircles(p3, r(3), "Color", 'k');
grid on;
title("A - Gr�n, B - Magenta, C - Svart")

format long g;

%S� vi har 3 ekvationer med 2 obekanta
F = @(x)[(93 - x(1)).^2 + (63 - x(2)).^2 - 55.1.^2;(6 - x(1)).^2 + (16 - x(2)).^2 - 46.2.^2;(20 - x(1)).^2 + (83 - x(2)).^2 - 46.2.^2 ];

%Jacobian
J = @(x)[2.*x(1) - 186, 2*x(2)-126; 2.*x(1)-12, 2.*x(2)-32; -2.*(20 - x(1)), -2.*(83-x(2))];

%x=[50.6946;27.6975];
% lista = zeros(100*100,2);
% lista(1,1) = {50;25};
% counter = 2;
% for i=-50:1:50
%     for j=-50:1:50
%         x=[i;j];
%         tau=1e-14;
%         dxnorm=1;
%         iter=0;
%         while (dxnorm>tau && iter<100)
%             dx = -J(x)\F(x);
%             dxnorm = norm(dx);
%             x = x + dx;
%             iter = iter+1;
%             disp([iter dxnorm])
%         end
%         
%         x
%         counter = counter + 1;
%     end
% end

%x=[50.6946;27.6975];
x=[40.2837;46.9689];
tau=1e-10;
dxnorm=1;
iter=0;
while (dxnorm>tau && iter<100)
    dx = -J(x)\F(x);
    dxnorm = norm(dx);
    x = x + dx;
    iter = iter+1;
    %disp([iter dxnorm])
end

iter
x

viscircles(x', 0.1, "Color", 'b');

