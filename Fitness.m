function Padre = Fitness(pob,n)
global b coeficiente;


for k=1:n
     fitness = 0;
for i=1:3
      aux=0;
    for j =1:3
            aux = aux + pob(k,j)*coeficiente(i,j); 
    end 
     fitness = fitness+abs(b(i)-aux);
end
pob(k,4) = fitness;
end
Padre = sortrows(pob,4);

end