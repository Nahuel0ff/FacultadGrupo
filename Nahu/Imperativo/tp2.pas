{
El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}


program ejercicio2;

const

	DF = 300;
	
type
	
	oficina = record
		id:integer;
		dni:integer;
		valor:real;	
	end;
	

	vector = array [1..DF] of oficina;
	
	procedure leer (var o:oficina; DL:integer);
	begin
		writeln('Ingrese el numero de identifacion');
		readln(o.id);
		if (DL < DF)  AND (o.id <> -1) then begin
			writeln('Ingrese el DNI del propietario');
			readln(o.dni);
			writeln('Ingrese el valor de la expensa');
			readln(o.valor);
		end;	
	end;
	

	procedure cargarVec (var v:vector;var DL:integer);
	var
		o:oficina;
	begin
		leer(o,DL);
		while (DL < DF) AND (o.id <> -1) do begin
			DL:=DL+1;
			v[DL]:=o;
			leer(o,DL);
		end;	
	end;
	
{
	procedure insercion (var v:vector; DL:integer);
	var
		i,j:integer;
		actual:integer;
	begin
		for i:= 2 to DL do begin
			actual:=v[i].id;
			j:=i-1;
			while (j>0) AND (v[j].id > actual) do begin
				v[j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1].id:=actual;
		end;	
	end;
}

	procedure seleccion (var v:vector; DL:integer);
	var
		i,j,pos:integer;
		item:oficina;
	begin
		for i:=1 to DL-1 do begin
			pos:=i;
			for j:=i+1 to DL do
				if (v[j].id < v[pos].id) then
					pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;
		end;
	end;


//Programa Principal
var
	DL:integer;
	v:vector;
	i:integer;
BEGIN
	DL:=0;
	cargarVec(v,DL);
	
	
	//Testeo
	for i:=1 to DF do
		writeln(v[i].id);
{		
	insercion(v,DL);	
	
	//Testeo
	for i:=1 to DF do
		writeln(v[i].id);
	}
	
	
	seleccion(v,DL);
	
	//Testeo
	for i:=1 to DF do
		writeln(v[i].id);
END.

