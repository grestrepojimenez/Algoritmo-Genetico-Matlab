function[pob]=PoblacionAleatoria(n)
pob1=zeros(n,3);

for i=1:n
    for j=1:3
        pob1(i,j)= rand*5; % La minimizacion de random en la poblacion inicial mejora la busqueda del algoritmo
    end
    pob1(i,4)= zeros; 
  
end

pob=pob1;
end