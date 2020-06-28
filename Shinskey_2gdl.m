%declarar tiempo muerto
tmuerto = 2;

%Planta
P = tf(3.79,[40 1 0],'InputDelay',tmuerto);

%% Modelo de Shinskey
%Controlador
Kc=0.003555723;
Td=155.4;
C=tf([Kc*Td Kc], [Td 0]);

%Regulador
Myd=feedback(P, C);

%Servomecanismo
Myr=feedback(P*C, 1);

figure();
step(Myd);
title('Respuesta del sistema como regulador');
xlabel('minutos');
ylabel('y(t)');

figure();
step(Myr);
title('Respuesta del sistema como servomecanismo');
xlabel('minutos');
ylabel('y(t)');
%% PID 2GdL
Kc=0.2575700464882522;
Td=20.4878;
Ti=82;

%Regulador
Cy=Kc*tf([Td*Ti Ti 1], [Ti 0]);

%Servo
beta=0.75;
gamma=1;
Cr=Kc*tf([Td*Ti*gamma Ti*beta 1], [Ti 0]);

%Regulador
Myd=feedback(P, Cy);

%Servomecanismo
Myr=feedback(P*Cr, 1);

%Servomecanismo PID ideal
Myr2=feedback(P*Cy, 1);

figure();
step(Myd);
title('Respuesta del sistema como regulador');
xlabel('minutos');
ylabel('y(t)');

figure();
step(Myr);
title('Respuesta del sistema como servomecanismo 2GdL');
xlabel('minutos');
ylabel('y(t)');

figure();
step(Myr2);
title('Respuesta del sistema como servomecanismo PID');
xlabel('minutos');
ylabel('y(t)');