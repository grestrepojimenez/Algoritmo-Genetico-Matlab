clc
clear all 

global b coeficiente a iteraciones Numero_de_iteraciones x1_x2_x3_fitness 

iteraciones=50000;
b= [25;12;4];
coeficiente = [3 8 2; 1 -2 4; -5 3 11];
 % solucion_ideal=[ 0 0 0 0 ;4.643 0.821 2.250 0; 0 0 0 0 ];

fprintf('______________Algoritmos Geneticos Funciones__________\n\n')
n=input('Ingrese la cantidad de población: ');
[pob]=PoblacionAleatoria(n);
% pob=solucion_ideal;
[Padre] = Fitness(pob,n);
porcentaje= round(n*0.02);

a=0;
while a<iteraciones
     if Padre(round(n*0.2),:)==Padre(round(n*0.3),:) % Si de la fila 20 a la 40 los valores son iguales
       Padre=[Padre(1:round(n*0.5),:);PoblacionAleatoria(round(n*0.5))];%  Reemplaza la mitad de poblacion actual por poblacion aleatoria 
    end
    Hijos=[Padre(1:porcentaje,:);zeros(n-porcentaje,4)]; %crea la matriz hijos con las primeras  
    [HijosCompleto] = Variacion(Padre,n,Hijos);
    [Padre] = Fitness(HijosCompleto,n);
    if Padre(1,4)<0.1 % Si el fitness es menor que 0.7 en algun momento, termina el while
            a=iteraciones;
        else
        a=a+1;
        i=a;
    end
    
    Numero_de_iteraciones=i

     
end

x1_x2_x3_fitness=Padre(1,:)

