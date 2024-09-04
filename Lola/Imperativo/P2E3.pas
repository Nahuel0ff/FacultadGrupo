{Implementar un programa que invoque a los siguientes módulos.

a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).

b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)

c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}

program p2e3;

const
	DF = 20;

type
	rangoVec = 1..DF;
	vector = array [rangoVec] of integer;
	
	
{-----------------------MODULOS------------------------}

procedure cargarRandomRecursivo(var v:vector; pos: rangoVec);
begin
	if (pos < DF) then
	begin
		v[pos]:= random(1551-300+1)+300; // genera un numero random de 300 a 1550
		cargarRandomRecursivo(v, pos+1);
	end;
end;
	
procedure imprimirVectorRecursivo (v:vector; pos:rangoVec);
begin
	if (pos < DF) then
	begin
		writeln(v[pos]);
		imprimirVectorRecursivo(v, pos+1);
	end;
end;

procedure imprimirVector (v:vector);
var
	i:rangoVec;
begin
	for i:= 1 to DF do
		writeln(v[i]);
end;
	
procedure ordenarVector(var v:vector);
var
	i, j, pos:rangoVec;
	aux: integer;
begin
	for i:= 1 to (DF-1) do
	begin
		pos:= i;
		for j:= (i+1) to DF do
			if (v[j] < v[pos]) then
				pos:= j;
		aux:= v[pos];
		v[pos]:= v[i];
		v[i]:= aux;
	end;
end;



{-----------------------MAIN------------------------}
var
	v:vector;
	pos: rangoVec;
begin
	pos:= 1;
	randomize;
	
	writeln('-----------------------VECTOR DESORDENADO------------------------');
	cargarRandomRecursivo(v,pos);
	imprimirVectorRecursivo(v, pos);
	
	writeln('-----------------------VECTOR ORDENADO------------------------');
	ordenarVector(v);
	imprimirVector(v);
end.
