program P1E2;

const
	DF = 5;
	
type
	rangoVec = 0..DF;
	
	oficina = record
		cod: integer;
		dni: integer;
		valor: real;
	end;
	
	vector = array [1..DF] of oficina;
	
{-------------------MODULOS-------------------}

procedure cargarVector (var v:vector; var DL: rangoVec);

	procedure leerRegistro(var ofi:oficina);
	begin
		write('CODIGO DE OFICINA: ');
		readln(ofi.cod);
		
		
		if (ofi.cod <> -1) then
		begin
			write('DNI DEL PROPIETARIO: ');
			readln(ofi.dni);
			
			
			write('VALOR DE LA EXPENSA: ');
			readln(ofi.valor);
			writeln();
		end;
	end;

var
	ofi:oficina;

begin
	leerRegistro(ofi);
	while (DL < DF) and (ofi.cod <> -1) do
	begin
		DL:= DL+1;
		v[DL]:= ofi;
		leerRegistro(ofi);
	end;
	
end;

procedure imprimirVector (v:vector; DL:rangoVec);
var
	i: rangoVec;
begin
	for i:= 1 to DL do
	begin
		writeln('----------------------------');
		
		write('[*] CODIGO DE OFICINA: ');
		writeln(v[i].cod);
		
		write('[*] DNI DEL PROPIETARIO: ');
		writeln(v[i].dni);	
		
		write('[*] VALOR DE LA PROPIEDAD: ');
		writeln((v[i].valor):0:2);	
		
		writeln();	
	end;
end;

procedure insercion (var v:vector; DL:rangoVec);
var
	i, j: rangoVec;
	actual: oficina;
begin
	for i:= 2 to DL do
	begin
		actual:= v[i];
		j:= i-1;
		
		while (j>0) and (v[j].cod > actual.cod) do
		begin
			v[j+1] := v[j];
			j:= j-1;
		end;
		
		v[j+1]:= actual;
	end;
end;


procedure seleccion (var v:vector; DL: rangoVec);
var
	i, j, pos: rangoVec;
	aux: oficina;
begin
	for i:=1 to (DL-1) do
	begin
		pos:= i;
		for j:= (i+1) to DL do
			if v[j].cod < v[pos].cod then
				pos:= j;
		aux:= v[pos];
		v[pos] := v[i];
		v[i]:= aux;
	end;
end;

{-------------------MAIN-------------------}

var
	v: vector;
	DL: rangoVec;
	
begin
	DL:= 0;
	
	cargarVector(v, DL);
	if (DL <> 0) then
	begin
		writeln('-------------------VECTOR IMPRESO-------------------');
		imprimirVector(v, DL);
		
		writeln('-------------------VECTOR ORDENADO POR INSERCION-------------------');
		insercion(v, DL);
		imprimirVector(v, DL);
		
		writeln('-------------------VECTOR ORDENADO POR SELECCION-------------------');
		seleccion(v, DL);
		imprimirVector(v, DL);
	end;
	
	
	
end.






