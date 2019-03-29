function [HijosCompleto] = Variacion(Padre,n,Hijos)

global a iteraciones

i= round(n*0.2);
while i < n
    
 x1= abs(round(((n-1)*rand)+1)); 
x2= abs(round(((n-1)*rand)+1));
x3= abs(round(((n-1)*rand)+1));
minimo= abs(min(x1,x2)); 
    
%((*Ojo Truco adicional del profesor ))Este while me permite seleccionar dos padres que estén separados al menos
%30 unidades entre si, si lo comentamos vemos como el algoritmo le da mas dificultad encontrar la solucion 
    while (x3<(minimo-30)|| x3>(minimo+30))
x1= abs(round(((n-1)*rand)+1));
x2= abs(round(((n-1)*rand)+1));
x3= abs(round(((n-1)*rand)+1));
minimo= abs(min(x1,x2));     
    end
%fin del while

Padre1= Padre(minimo,:); % Padre 1 el de menor fitness
Padre2=Padre(x3,:); %padre dos uno cualquiera diferente al primero, si habitamos el while el padre dos trendrá al menos 30 posiciones de distancia

Pc=rand; % numero aleatorio para el cruce
Pm=rand; %numero aleatorio para la poblacion

if(Pc < 0.9) % si el numero aleatorio dio menos a 0.9 se hace el cruce
    Padre1cruzado=[Padre1(1,1),Padre2(1,2:3),0];
    Padre2cruzado=[Padre2(1,1),Padre1(1,2:3),0];
    
    mutacion=0.025;   
    %((*Ojo Truco adicional del profesor )) este if evalua si las iteraciones llegaron al 50% sube la probabilidad
    %de mutacion
        if (a>iteraciones*0.5)
            mutacion=0.3;
        end
        %fin del if
    
   if(Pm < mutacion) % si el numero aleatorio dio menos a 0.025 se hace la mutacion
      
      Padre2cruzado=[Padre(1,1)-(rand*2),Padre1(1,2),Padre1(1,3),0]; %cambié un poco la mutacion, al primer valor le resté 3
      
   end
    else
        Padre1cruzado=Padre(minimo,:); 
        Padre2cruzado=Padre2;
        
end
 Hijos(i+1,:)=Padre1cruzado; %actualiza la matriz hijos
 Hijos(i+2,:)=Padre2cruzado; %actualiza la matriz hijos
i=i+2;
end
HijosCompleto=Hijos;
end