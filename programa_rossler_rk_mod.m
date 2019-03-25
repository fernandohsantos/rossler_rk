clc; close all; clear all;

%Parâmetros das equações
a = 0.15;
b = 0.20;
c = 10;

%vetor com os parâmetros, para "despoluir" a entrada da função
parametros = [a;b;c];

%Condições iniciais
condicoesiniciais = [1;  1;  1]; 
x(1,:) = condicoesiniciais';

%Passos da Integração
deltat = 0.10;
npontos = 4000;
transit = 2000;

%Cálculo dos argumentos do Runge-Kutta 

for i = 2:npontos,
   
        k1 = rossler_rk(parametros,x(i-1,:)')*deltat;
        k2 = rossler_rk(parametros,x(i-1,:)'+0.5*k1)*deltat;
        k3 = rossler_rk(parametros,x(i-1,:)'+0.5*k2)*deltat;
        k4 = rossler_rk(parametros,x(i-1,:)'+k3)*deltat;
     
    % Passo para atualizar o novo valor do vetor x  
    x(i,:) = x(i-1,:)' +(k1+2*k2+2*k3+k4)/6;
    t(i) = deltat*i;
end

%GRÁFICOS
%Atrator de Rossler

figure(1);
subplot(221); plot3(x(:,1),x(:,2),x(:,3));
%title('Atrator de Rossler');
xlabel('x');
ylabel('y');
zlabel('z');
grid on

subplot(222)
plot(x(:,1),x(:,2));
%title('Atrator de Rossler');
xlabel('x');
ylabel('y');
grid on

subplot(223)
plot(x(:,1),x(:,3));
%title('Atrator de Rossler');
xlabel('x');
ylabel('z');
grid on

subplot(224)
plot(x(:,2),x(:,3));
%title('Atrator de Rossler');
xlabel('y');
ylabel('z');
grid on

x = x(transit+1:npontos,1);

%save xrossler x

% %GRÁFICOS
%Atrator de Rossler - x vs t
figure(2);
plot (t(transit+1:npontos),x(:,1));
title('Componente x do atrator de Rossler no tempo');
xlabel('t');
ylabel('x');
grid on

% %GRÁFICOS
% %Atrator de Rossler - y vs t
% figure(3);
% plot (t,x(:,2));
% title('Componente y do atrator de Rossler no tempo');
% xlabel('t');
% ylabel('y');
% grid on
% 
% %GRÁFICOS
% %Atrator de Rossler - z vs t
% figure(4);
% plot (t,x(:,3));
% title('Componente z do atrator de Rossler no tempo');
% xlabel('t');
% ylabel('z');
% grid on
% 
% figure(5);
% plot3(x(:,1),x(:,2),x(:,3));
% %title('Atrator de Rossler');
% xlabel('x');
% ylabel('y');
% zlabel('z');
% grid on
% 
% print -depsc Rossler_XYZ
% 
% figure(6);
% subplot(311)
% plot(x(:,1),x(:,2));
% %title('Atrator de Rossler');
% xlabel('x');
% ylabel('y');
% grid on
% 
% subplot(312)
% plot(x(:,1),x(:,3));
% %title('Atrator de Rossler');
% xlabel('x');
% ylabel('z');
% grid on
% 
% subplot(313)
% plot(x(:,2),x(:,3));
% %title('Atrator de Rossler');
% xlabel('y');
% ylabel('z');
% grid on
% 
% print -depsc Rossler_xy_xz_xz





