{
Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).
}


program ejercicio1;

const
	ventmax = 50;
type
	rangodia = 0..31; //Rango de días
	
	rangocod = 1..15; //Rango del codigo
	
	rangovendid = 1..99;
	
	venta = record
		dia:rangodia;
		codprod:rangocod;
		cantven:rangovendid;
	end;
	
	resumen = record
		codprod:rangocod;
		totalvendido:integer;	
	end;
		
	vector = array [1..ventmax] of venta;
	
	vectorRes = array [1..ventmax] of resumen;
	
	
	procedure leer (var v:venta; cod:integer);
	begin
		readln(v.dia);
		if (v.dia <> 0) then begin
			readln(v.cantven);
			v.codprod:=cod;
		end;
	end;


	procedure cargar (var vec:vector; v:venta; var DL:integer);
	begin
		vec[DL]:=v;
		DL:=DL+1;
	end;


	procedure recorrer (vec:vector; DL:integer);
	var
		i:integer;
	begin
		for i:=1 to DL do begin
			writeln(vec[i].dia);
			writeln(vec[i].codprod);
			writeln(vec[i].cantven);
		end;
	end;
	
	
	procedure insercion (var vec:vector; DL:integer);
	var
		i,j:integer; actual:venta;
	begin
		for i:=2 to DL do begin
			actual:=vec[i];
			j:=i-1;
			while (j>0) AND (vec[j].codprod > actual.codprod) do begin
				vec[j+1]:=vec[j];
				j:=j-1;
			end;
			vec[j+1]:=actual;
		end;
	end;
	
	
	procedure eliminar (var vec:vector; var DL:integer; par1,par2: integer);
	var
		pos1,pos2,i,j:integer;
	begin
	i:=1;
		while (i <= DL) AND (par1 > vec[i].codprod) do 
			i:=i+1;
		pos1:=i;
		while (i <= DL) AND (par2 >= vec[i].codprod) do
			i:=i+1;
		pos2:=i;
		
		for j:=pos2 to DL do
			vec[pos1 + (j-pos2)]:= vec[j];
			
		DL:= DL - (pos2 - pos1);		
	end;


	procedure obtener (vec:vector; DL:integer; var vecRes:vectorRes; var DLRes:integer);
	var
		i:integer;
	begin
		DLRes :=0;
		for i:=1 to DL do begin
			if (vec[i].codprod mod 2=0) then begin
				if (DLRes = 0) or (vecRes[DLRes].codprod <> vec[i].codprod) then begin
					DLRes:=DLRes+1;
					vecRes[DLRes].codprod:= vec[i].codprod;
					vecRes[DLRes].totalvendido:=vec[i].cantven;
				end else begin
					vecRes[DLRes].totalvendido:=vecRes[DLRes].totalvendido + vec[i].cantven;
				end;
			end;
		end;
	end;
	
	
	procedure mostrarInfoPares (vecRes: VectorRes; DLRes:integer);
	var
		i:integer;
	begin
		for i:=1 to DLRes do begin
			writeln(vecRes[i].codprod);
			writeln(vecRes[i].totalvendido);
		end;
	end;
	
//Programa Principal
var
	ran:integer;
	v:venta;
	vec:vector;
	DL,DLRes:integer;
	par1,par2:integer;
	vecRes:vectorRes;
BEGIN
	DL:=1;
	randomize;
	
	ran:=random(15)+1;
	
	leer(v,ran);
	while (DL <> ventmax)AND (v.dia <> 0)  do begin
		cargar(vec,v,DL);
		ran:=random(15)+1;
		leer(v,ran)
	end;
	insercion(vec,DL);
	
	recorrer(vec,DL);
	
	writeln('Ingrese el parametro 1');
	readln(par1);
	writeln('Ingrese el parametro 2');
	readln(par2);
	eliminar(vec,DL,par1,par2);
	
	obtener(vec,DL,vecRes,DLRes);
	mostrarInfoPares(vecRes,DLRes);
END.

