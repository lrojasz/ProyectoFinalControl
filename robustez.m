%PID
s=tf('s');
CPID=0.101583+(0.003562/s)+(1.519789*s)
P=(3.79*exp(-2*s))/(s*(40*s+1));
FSPID = 1/(1+(CPID*P))
figure()
fc_fragility_rings(0.0101583,280.7411566, 1.519789, P)
figure()
bode(FSPID)
grid on
figure ()
margin(CPID*P)
grid on

t1=0:0.01:1000;
u1=heaviside(t1);
sys1=feedback(P,CPID);
figure()
title('Lugar geométrico de las raíces 1')
lsim(sys1,u1,t1);
title('Desempeño del sistema utilizando un controlador PID')
legend('Salida')

%% PID 2DoF

C2DoF=0.22420874436723226+(0.004074/s)+(5.27704427005048864*s);
FSPID = 1/(1+C2DoF*P)
figure()
fc_fragility_rings(0.22420874436723226,245.46, 5.27704427005048864, P)
figure()
bode(FSPID)
grid on
figure ()
margin(C2DoF*P)
grid on


sys2=feedback(P,C2DoF);
figure()
title('Lugar geométrico de las raíces 1')
lsim(sys2,u1,t1);
title('Desempeño del sistema utilizando un controlador PID de dos grados de libertad')
legend('Salida')