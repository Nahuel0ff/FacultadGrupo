{
Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
   
}

program ejercicio3;

const

	DF = 20;
	max = 1550;
	min = 300;
	
type
	indice =-1 ..1550;
	
	vector = array [1..DF] of integer;

	//Parte A

	procedure cargarVec (var v:vector; var DL:integer);
	var
		ran:indice;
	begin
		ran:= min + random(max - min +1);
			if (DL < DF) then begin
				v[dl]:= ran;
				dl:=dl+1;
				cargarVec (v,dl);
			end;
	end;


	// Parte B

	procedure seleccion (var v:vector; DL:integer);
	var
		i,j,pos: integer; item:indice;
	begin
		for i:= 1 to DL-1 do begin
			pos:=i;
			for j:= i+1 to DL do
				if v[j] < v[pos] then
					pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
		end;
	end;
		
	//Parte C
	
	procedure busquedaDicotomica (v:vector;ini,fin:indice;dato:integer; var pos:indice);
	var
		medio:integer;
	begin
		if (ini > fin) then	
			pos:=-1
		else begin
			medio:=(ini +fin) div 2;
			if (v[medio] = dato) then
				pos:=medio
			else if (v[medio] > dato) then
				busquedaDicotomica(v,ini,medio-1,dato,pos)
			else
				busquedaDicotomica(v,medio+1,fin,dato,pos);
		end;
	end;
	
//Programa principal
var
	v:vector;
	DL:integer;
	ini,fin,pos:indice;
	dato:integer;
BEGIN
	Randomize;
	dl:=1;
	cargarVec(v,DL); //Parte A
	seleccion(v,DL); //Parte B
	read(ini);
	read(fin);
	read(pos);
	read(dato);
	busquedaDicotomica(v,ini,fin,dato,pos); //Parte C
END.

