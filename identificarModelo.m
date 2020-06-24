%% Identificacion del sistema
%% Laura Rojas, B76798, grupo 2
%% Determinar modelo

%%%s=tf('s');
%%%L1=(3.79*exp(-2*s))/(s*(40*s+1));
%%%sisotool(L1)



%declarar tiempo antes de 0
tnegative = 1;

%declarar entrada escalón
stepFunction = tf(1,'InputDelay',tnegative);

%identificar la función de transferencia de 'caja negra' del proceso
funcDesconocida = tf(3.79,[40 1 0],'InputDelay',2+tnegative);

%aplicar escalón a función 'desconocida' y declarar salida 
[salida, tiempo] = step(funcDesconocida,0:0.5:40);

%plotear respuesta escalón para método de Alfaro
figure()
plot(tiempo,salida)
title('Respuesta al escalón');
xlabel('tiempo [t]');
ylabel('señal de salida');

%%
%aplicar escalón a función 'desconocida' y declarar salida como cajaNegra
[salida, tiempo] = step(funcDesconocida,-tnegative:0.5:10);
[entrada, tiempo] = step(stepFunction,-tnegative:0.5:10);

%obtener modelo P0
estimateData = iddata(salida,entrada,0.5);
sysP0 = procest(estimateData,'P0')
%comparar 
figure()
compare(estimateData,sysP0)
title('Comparación de modelo proporcional');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P0D
estimateData = iddata(salida,entrada,0.5);
sysP0D = procest(estimateData,'P0D')
%comparar 
figure()
compare(estimateData,sysP0D)
title('Comparación de modelo proporcional');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P1
estimateData = iddata(salida,entrada,0.5);
sysP1 = procest(estimateData,'P1')
%comparar 
figure()
compare(estimateData,sysP1)
title('Comparación de modelo con un polo');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P1Z
estimateData = iddata(salida,entrada,0.5);
sysP1Z = procest(estimateData,'P1Z')
%comparar 
figure()
compare(estimateData,sysP1Z)
title('Comparación de modelo con un polo y un cero');
xlabel('tiempo [t]');
ylabel('señales de salida');


%obtener modelo P1D
estimateData = iddata(salida,entrada,0.5);
sysP1D = procest(estimateData,'P1D')
%comparar 
figure()
compare(estimateData,sysP1D)
title('Comparación de modelo de un polo con tiempo muetro');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P1DI
estimateData = iddata(salida,entrada,0.5);
sysP1DI = procest(estimateData,'P1DI')
%comparar 
figure()
compare(estimateData,sysP1DI)
title('Comparación de modelo con un polo, integrador y tiempo muetro');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P2
estimateData = iddata(salida,entrada,0.5);
sysP2 = procest(estimateData,'P2')
%comparar 
figure()
compare(estimateData,sysP2)
title('Comparación de modelo con dos polos');
xlabel('tiempo [t]');
ylabel('señales de salida');

%obtener modelo P2D
estimateData = iddata(salida,entrada,0.5);
sysP2D = procest(estimateData,'P2D')
%comparar 
figure()
compare(estimateData,sysP2D)
title('Comparación de modelo con dos polos y tiempo muetro');
xlabel('tiempo [t]');
ylabel('señales de salida');

