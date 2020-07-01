%declarar tiempo muerto
tmuerto = 2;
%Planta
P = tf(3.79,[40 1 0],'InputDelay',tmuerto);

%declarar entrada escalón
stepFunction = tf(1);

%declarar tiempo de muestreo
tmuestra=500;
[entrada, tiempo] = step(stepFunction,tmuestra);
%% PID IAE
%Variacion de los parámetros del PID 2GdL
Kc=0.22420874436723226 -0*0.22420874436723226*0.2;
Td=23.5363+0*23.5363*0.2;
Ti=55.0318-0*55.0318*0.2;

%Variación de los parámetros del PID autoajustado
k=0.101583-0*0.101583*0.2;
ki=0.003562+0*0.003562*0.2;
kd=1.519789-0*1.519789*0.2;

C1=tf(1,[Ti 0]);
C2=tf([Td 0],1);
C31=tf(ki,[1 0]);
C32=tf([kd 0], 1);
C3=k+C31+C32;

%Regulador
Cy=Kc*(1+C1+C2);

%Servo
beta=0;
gamma=1;
Cr=Kc*(beta+C1+gamma*C2);

%Regulador
Myd=feedback(P, Cy);
Myd2=feedback(P, C3);

%Servomecanismo
Myr=Cr*Myd;
Myr2=feedback(P*C3, 1);

errorS=1-lsim(Myr, entrada, tiempo);
errorR=lsim(Myd, entrada, tiempo);
fprintf('\n IAE servo: %f', trapz(tiempo,abs(errorS)));% IAE 
fprintf('\n IAE regulador: %f', trapz(tiempo,abs(errorR)));% IAE 
errorS2=1-lsim(Myr2, entrada, tiempo);
errorR2=lsim(Myd2, entrada, tiempo);
fprintf('\n IAE servo rele: %f', trapz(tiempo,abs(errorS2)));% IAE 
fprintf('\n IAE regulador rele: %f', trapz(tiempo,abs(errorR2)));% IAE 