{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
TALLER DE PROGRAMACIÓN – Módulo Imperativo 2024
2
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.

d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).


* TENGO QUE CORREGIR EL ULTIMO PUNTO}



program p1e3;

const
	DFgenero = 8;
type
	rangoGenero = 1..8;
	
	pelicula = record
		codPeli: integer;
		codGen: rangoGenero;
		puntaje: real;
	end;
	
	pelicula2 = record
		codPeli: integer;
		puntaje: real;
	end;
	
	
	
	lista = ^nodo;
	nodo = record
		dato: pelicula2;
		sig:lista;
	end;
	
	
	puntero = record
		pri: lista;
		ult: lista;
	end;

	punteros = array [rangoGenero] of puntero;
	mejorPuntaje = array [rangoGenero] of pelicula2;
	
{--------------MODULOS--------------}	
	
procedure inicializarVector (var v:punteros);
var
	i:rangoGenero;
begin
	for i:= 1 to DFgenero do
	begin
		v[i].pri := nil;
	end;
end;	

procedure leerPelicula(var peli:pelicula; var peli2:pelicula2);

begin
	writeln();
	
	write('[*] CODIGO DE PELICULA: ');
	readln(peli.codPeli);
	
	if (peli.codPeli <> -1) then
	begin
		write('[*] CODIGO DE GENERO: ');
		readln(peli.codGen);
		
		write('[*] PUNTAJE: ');
		readln(peli.puntaje);
		
		peli2.codPeli:= peli.codPeli;
		peli2.puntaje:= peli.puntaje;
	end;
end;	
	
	
procedure agregarAlFinal (var pri, ult: lista; peli2:pelicula2);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= peli2;
	nue^.sig:= nil;
	
	if (pri = nil) then
		pri:= nue
	
	else
		ult^.sig:= nue;
		
	ult:= nue;
end;
	

procedure imprimirLista (pri:lista);
begin
	while (pri <> nil) do
	begin 
		writeln();
		
		write('CODIGO DE LA PELI: ');
		writeln(pri^.dato.codPeli);
		
		write('PUNTAJE: ');
		writeln((pri^.dato.puntaje):0:1);
		writeln();
		
		pri:= pri^.sig;
	end;
end;
	
	
procedure buscarPuntaje(pri:lista; var maxPuntaje:real; var maxCodigo:integer; var vec:pelicula2);
begin
	while (pri <> nil) do
	begin
		if (pri^.dato.puntaje > maxPuntaje) then
		begin
			maxPuntaje:= pri^.dato.puntaje;
			maxCodigo:= pri^.dato.codPeli;
		end;
		
		pri:= pri^.sig;
	end;
	vec.codPeli:= maxCodigo;
	vec.puntaje:= maxPuntaje;
end;


procedure seleccion (var v:mejorPuntaje);
var
	i, j, pos: rangoGenero;
	aux: real;
begin
	for i:= 1 to (DFgenero-1) do
	begin
		pos:= i;
		
		for j:= (i+1) to DFgenero do
			if v[j].puntaje < v[pos].puntaje then
				pos:= j;
				
				
		aux:= v[pos].puntaje;
		v[pos].puntaje:= v[i].puntaje;
		v[i].puntaje:= aux;
	end;
end;
	
procedure recorrerVector (v:mejorPuntaje; var codMax,codMin:integer);
var
	i:rangoGenero;
	max, min:real;
begin
	max:= -1;
	min:= 11;
	
	for i:= 1 to DFgenero do
	begin
		if (v[i].puntaje > max)then
		begin
			max:= v[i].puntaje;
			codMax:= v[i].codPeli;
		end;
		
		if (v[i].puntaje < min) then
		begin
			min:= v[i].puntaje;
			codMin:= v[i].codPeli;
		end;
	end;
end;

procedure imprimirVector(v:mejorPuntaje);
var
	i:rangoGenero;
begin
	for i:= 1 to DFgenero do
	begin
		writeln('[] EL MEJOR PUNTAJE DEL GENERO ', i, ' ES LA PELI CON CODIGO: ');
		writeln(v[i].codPeli);
		writeln('[] PUNTAJE: ', (v[i].puntaje):0:2);
		writeln();
	end;
end;
	
	
{--------------MAIN--------------}	
	
	
var
	v:punteros;
	vecPuntaje:mejorPuntaje;
	
	peli2:pelicula2;
	peli:pelicula;
	
	i:rangoGenero;
	
	maxCodigo, codMax, codMin:integer;
	maxPuntaje:real;
	
	
	
begin
	inicializarVector (v);
	
	leerPelicula(peli, peli2);
	while (peli.codPeli <> -1) do
	begin
		agregarAlFinal(v[peli.codGen].pri, v[peli.codGen].ult, peli2);
		leerPelicula(peli, peli2);
	end;
	
	writeln(' ________________  LISTA ___________________');
	writeln();
	
	for i:= 1 to DFgenero do
	begin
		writeln('------------------------------');
		writeln('PELIS DEL GENERO ', i);
		imprimirLista(v[i].pri);
		
		
		//punto b
		
		maxPuntaje:= 0;
		maxCodigo:= 0;
		buscarPuntaje(v[i].pri, maxPuntaje, maxCodigo, vecPuntaje[i]);
	end;
	
	
	writeln(' ________________  VECTOR DE PUNTAJES ___________________');
	imprimirVector(vecPuntaje);
	
	
	
	writeln(' ________________  VECTOR DE PUNTAJES ORDENADO POR PUNTAJE ___________________');
	seleccion(vecPuntaje);
	imprimirVector(vecPuntaje);
	
	{writeln(' ________________  RECORRER VECTOR ___________________');
	recorrerVector(vecPuntaje, codMax, codMin);
	writeln('[] CODIGO CON PUNTAJE MINIMO: ', codMin);
	writeln('[] CODIGO CON PUNTAJE MAXIMO: ', codMax);}
	

	
end.
























