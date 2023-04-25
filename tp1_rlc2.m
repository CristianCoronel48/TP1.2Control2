clear; clear clc;close all;
X=-[0; 0];ii=0;t_etapa=1e-11 ;wRef=2;tF=47e-8;
%Constantes del PID
% Kp=.500;Ki=0.001;Kd=0.0001;
color_='r';
% Kp=1;Ki=0;Kd=0.0001;color_='k';
% Kp=10;Ki=0;Kd=0;color_='b';
Ts=t_etapa;
% A1=((2*Kp*Ts)+(Ki*(Ts^2))+(2*Kd))/(2*Ts);
% % B1=(-2*Kp*Ts+Ki*(Ts^2)-4*Kd)/(2*Ts);
% C1=Kd/Ts;
% e=zeros(tF/t_etapa,1);
u=12;
for t=0:t_etapa:tF
    ii=ii+1; % k=ii+2;
    X=modrlc1(t_etapa, X, u);
    %  e(k)=wRef-X(1); %ERROR
    %  u=u+A1*e(k)+B1*e(k-1)+C1*e(k-2); %PID
    x1(ii)=X(1);%Corriente de la bobina
    x2(ii)=X(2);%Tension del capacitor
    acc(ii)=u;
end
t=0:t_etapa:tF;
subplot(3,1,1);hold on;
plot(t,x1,color_);title('Corriente');
subplot(3,1,3);hold on;
plot(t,acc,color_);title('Tension');
xlabel('Tiempo [Seg.]');
subplot(3,1,2);hold on;
plot(t,x2,color_);title('Tension del capacitor');