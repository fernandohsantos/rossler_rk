function [xponto] = rossler_rk(parametros,x)

%x(1) eixo x
%x(2) eixo y 
%x(3) eixo z

%Parametros(1) a
%Parametros(2) b
%Parametros(3) c
%Parametros(4) eta

xponto(1) = -(x(2)+x(3));
xponto(2) = x(1)+parametros(1)*x(2);
xponto(3) = parametros(2)+x(3)*(x(1)-parametros(3));

% xponto(4) = -(x(5)+x(6))+parametros(4)*(x(1)-x(4));
% xponto(5) = x(4)+parametros(1)*x(5);
% xponto(6) = parametros(2)+x(6)*(x(4)-parametros(3));

xponto = xponto';