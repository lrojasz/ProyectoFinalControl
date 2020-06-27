%Modelo de Velazquez
s=tf('s');
P=(3.79*exp(-2*s))/(s*(40*s+1));
t1=0:0.01:500;
u1=heaviside(t1);
C2=0.14*(1+(1/(s*8.19))+(6.093*s));
sys2=feedback(P*C2,-1,1);
figure()
title('Lugar geométrico de las raíces 1')
lsim(sys2,u1,t1);
title('Desempeño del sistema utilizando un controlador PID Velazquez')
legend('Salida')
%sisotool(P*C2)

%Haalman para reducir el ISE
C1=0.08795514*(1+40*s)
sys3=feedback(P*C1,-1,1);
figure()
title('Lugar geométrico de las raíces 1')
lsim(sys3,u1,t1);
title('Desempeño del sistema utilizando un controlador PID Haalman')
legend('Salida')
%sisotool(P*C1)

hold off
