{
El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.
}


program ejercicio1;

const

	DF = 300;

type
	
	oficina = record
		cod:integer;
		dni:integer;
		valor:real;
	end;

	vector = array [1..DF] of oficina;
	
	procedure leer (var o:oficina);
	begin
		read(o.cod);
		if (o.cod <> 0) then begin
			read(o.dni);		
			read(o.valor);
		end;
	end;
	
	procedure agregarVec (var v:vector; o:oficina; var DL:integer);
	begin
		DL:=DL+1;
		v[DL]:=o;	
	end;

	procedure cargar (var v:vector; var DL:integer);
	var
		o:oficina;
	begin
		leer(o);
		while (DL < DF) AND (o.cod <> 0) do begin
			agregarVec(v,o,DL);
			leer(o);
		end;
	end;

	procedure seleccion (var v:vector; DL: integer);
	var
		i,j,pos:integer; item: oficina;
	begin
		for i:=1 to DL-1 do begin
			pos:=i;
			for j:= i+1 to DL do
				if v[j].cod < v[pos].cod then
					pos:=j;
			item:=v[pos];
			v[pos]:=v[i];
			v[i]:=item;		
		end;
	end;

	{function busquedaDicotomica (v:vector; DL:integer; num:integer):integer;
	var
		medio:integer;
	begin
		medio:= DL DIV 2;
		if (v[medio].cod = num) then
			busquedaDicotomica:=medio
		else
			if (DL <= DF) AND (num < v[medio].cod) then
				busquedaDicotomica(v,medio-1,num)
			else if (DL <= DF) AND (num > v[medio].cod) then
				busquedaDicotomica(v,medio+1,num);
			if (medio = 0) OR ( medio > DL) then
					busquedaDicotomica:=0;
	end;}
	{ procedure busquedaDicotomica (v:vector;DL:integer;num:integer;var pos:integer);
	 var
		inf,sup,medio:integer;
	begin
		inf:=1;
		sup:=DL;
		medio:=(sup+inf) DIV 2;
		if (v[medio].cod = num) then
			pos:=medio
		else
			if (DL <= DF) AND (num < v[medio].cod) then
				busquedaDicotomica(v,medio-1,num,pos)
			else if (DL <= DF) AND (num > v[medio].cod) then
				busquedaDicotomica(v,medio+1,num,pos);
			if (medio = 0) OR ( medio > DL) then
					pos:=0;
	end;}
	
	procedure busquedaDicotomica (v:vector; dato,inf,sup:integer; var pos:integer);
	var
		medio:integer;
	begin
		if (inf > sup) then
			pos:=0
		else begin
			medio:= (inf +sup) DIV 2;
			if (v[medio].cod = dato) then
				pos:=medio
			else 
				if (v[medio].cod > dato) then
					busquedaDicotomica(v,dato,inf,medio-1,pos)
				else
					busquedaDicotomica(v,dato,medio+1,sup,pos);
		end;
	end;

	function total (v:vector; DL:integer):real;
	begin
		if (DL = 0) then
			total:=0
		else
			total:= v[dl].valor + total(v,dl-1);
	end;


//Programa Principal
var
	v:vector;
	DL:integer;
	pos:integer;
	num:integer;
	tot:real;
BEGIN
	DL:=0;
	cargar(v,DL);
	seleccion(v,DL);
	read(num);
	busquedaDicotomica(v,num,1,DL,pos);
	if (pos <> 0) then
		write(pos)
	else
		write('No se encontro');
	tot:=total(v,DL);
	writeln(tot);
END.


