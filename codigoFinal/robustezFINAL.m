%%PID 2DoF
Kp1Nom=0.2242;
Ti1Nom=245.46;
Td1Nom=5.27704427005048864;
Kp1Ma=Kp1Nom+(0.2*Kp1Nom);
Ti1Ma=Ti1Nom+(0.2*Ti1Nom);
Td1Ma=Td1Nom+(0.2*Td1Nom);
Kp1Me=Kp1Nom-(0.2*Kp1Nom)
Ti1Me=Ti1Nom-(0.2*Ti1Nom);
Td1Me=Td1Nom-(0.2*Td1Nom);
%Se construye las funciones de transferencia
C2DoF=Kp1Nom+(1/(Ti1Nom*s))+(Td1Nom*s);
FS2DoF = 1/(1+(C2DoF*P))
%Se usa el comando margin() para obtener la ganancia máxima
figure()
margin(C2DoF*P)
grid on
%Se usa fc_fragility_rings para obtener el valor de sensibilidad máxima 
%y trabajar con varios valores para la fragilidad
figure()
fc_fragility_rings(Kp1Nom,Ti1Nom, Td1Nom, P)

%% PID 
% Se encuentran los valores de Kp, Ti y Td
KpNom=0.101583;
TiNom=1/0.003562;
TdNom=1.519789;
KpMa=KpNom+(0.2*KpNom);
TiMa=TiNom+(0.2*TiNom);
TdMa=TdNom+(0.2*TdNom);
KpMe=KpNom-(0.2*KpNom)
TiMe=TiNom-(0.2*TiNom);
TdMe=TdNom-(0.2*TdNom);
%Se construye las funciones de transferencia
s=tf('s');
CPID=KpNom+(1/TiNom*s)+(TdNom*s)
P=(3.79*exp(-2*s))/(s*(40*s+1));
%Se usa el comando margin() para obtener la ganancia máxima
figure ()
margin(CPID*P)
grid on
%Se usa bode() para obtener el valor de sensibilidad máxima 
%y trabajar con varios valores para la fragilidad
FSPID = 1/(1+(CPID*P))
figure()
bode(FSPID)
grid on