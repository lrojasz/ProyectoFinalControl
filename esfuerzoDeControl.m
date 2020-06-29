%utilizar variable guardada en out.U como vector (viene del Simulink)
vector = out.U;
sum = 0;


%La perturbación empieza en el minuto 300, y el tiempo termina en 600
for i = 300:600
    temp = abs( vector(i+1) - vector(i) );
    sum = sum + temp;
end

disp(sum)