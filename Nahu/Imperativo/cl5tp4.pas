{
4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se ingresa código, DNI de la persona, año y tipo de reclamo. El ingreso finaliza con el
código de igual a 0. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.
d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.   
}


program ejercicio4;

type

	rangoanio = 1900..2200;

	reclamo = record
		cod:integer;
		dni:integer;
		anio:rangoanio;
		tipo:string;
	end;

	reclamoChico = record
		cod:integer;
		anio:rangoanio;
		tipo:string;
	end;

	lista = ^nodo;
	
	nodo = record
		dato:reclamoChico;
		sig:lista;
	end;

	reclamoGrande = record
		dni:integer;
		cant:integer;
		list:lista;
	end;

	arbol = ^nodoDos;
	
	nodoDos = record
		dato:reclamoGrande;
		HI:arbol;
		HD:arbol;
	end;
	
	listaDos = ^nodoTres;
	
	nodoTres = record
		dato:integer;
		sig:listaDos;
	end;
//-------------------------------//
	procedure leer (var r:reclamo);
	begin
		read(r.cod);
		if (r.cod <> 0) then begin
			read(r.anio);
			read(r.dni);
			read(r.tipo);
		end;
	end;
//-------------------------------//
	procedure asignar (r:reclamo; var rc:reclamoChico);
	begin
		rc.cod:=r.cod;
		rc.anio:=r.anio;
		rc.tipo:=r.tipo;
	end;
//-------------------------------//
	procedure agregarAd (var l:lista; rc:reclamoChico);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=rc;
		nue^.sig:=l;
		l:=nue;
	end;
//-------------------------------//
	procedure agregar (var a:arbol; r:reclamo);
	var
		rc:reclamoChico;
	begin
		asignar(r,rc);
		if (a = nil) then begin
			new(a);
			a^.dato.dni:=r.dni;
			a^.dato.cant:=1;
			a^.dato.list:=nil;
			agregarAd(a^.dato.list,rc);
			a^.HI:=nil;
			a^.HD:=nil;
	end
	else if	(a^.dato.dni > r.dni) then
		agregar(a^.HI,r)
	else
		if (a^.dato.dni < r.dni) then
			agregar(a^.HD,r)
		else
			if (a^.dato.dni = r.dni) then begin
				agregarAd(a^.dato.list,rc);
				a^.dato.cant:=a^.dato.cant +1;
			end;
	end;
//-------------------------------//
	procedure cargar (var a:arbol);
	var
		r:reclamo;
	begin
		leer(r);
		while (r.cod <> 0) do begin
			agregar(a,r);
			leer(r);
		end;
	
	end;
//-------------------------------//

//b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
//reclamos efectuados por ese DNI.

	function cantidades (a:arbol; dni:integer):integer;
	begin
		if (a = nil) then 
			cantidades:=0
		else
			if (a^.dato.dni = dni) then
				cantidades:=a^.dato.cant
			else
				if (a^.dato.dni < dni) then
					cantidades:=cantidades(a^.HD,dni)
				else
					if (a^.dato.dni > dni) then
						cantidades:=cantidades(a^.HI,dni);	
	end;

//-------------------------------//

//c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
//reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

	function comprendidos (a:arbol; dni1,dni2:integer):integer;
	begin
		if (a = nil) then
			comprendidos:=0
		else
			if (a^.dato.dni > dni1) AND (a^.dato.dni < dni2) then
				comprendidos:= a^.dato.cant + comprendidos(a^.HI,dni1,dni2) + comprendidos(a^.HD,dni1,dni2)
			else
				if (a^.dato.dni < dni1) then
					comprendidos:=comprendidos(a^.HI,dni1,dni2)
				else
					if (a^.dato.dni > dni2) then
						comprendidos:=comprendidos(a^.HD,dni1,dni2);
	end;
//-------------------------------//

//d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
//los reclamos realizados en el año recibido. 

	procedure agregarAd2 (var l2:listaDos; num:integer);
	var
		nue:listaDos;
	begin
		new(nue);
		nue^.dato:=num;
		nue^.sig:=l2;
		l2:=nue;
	end;


	function codigos (l:lista; anio:rangoanio):integer;
	begin
		if (l = nil) OR (l^.dato.anio <> anio) then
			codigos:=-1
		else
			if (l^.dato.anio = anio) then
				codigos:=l^.dato.cod;	
	end;

{
	procedure recorrer (l:lista; anio:rangoanio; var l2:listaDos);
	var
		cod:integer;
	begin
		while (l <> nil) do begin
			cod:=codigos(l,anio);			
			if (cod <> -1) then
				writeln(cod);			
			l:=l^.sig;
		end;
	end;
}


	procedure recorrer (l:lista; anio:rangoanio;var l2:listaDos);
	var
		cod:integer;
	begin
		while (l <> nil) do begin
			cod:=codigos(l,anio);
			if (cod <> -1) then
				agregarAd2(l2,cod);
			l:=l^.sig;
		end;
	end;


	procedure recorrerArbol (a:arbol; anio:rangoanio;l2:listaDos);
	begin
		if (a <> nil) then begin
			recorrer(a^.dato.list,anio,l2);
			recorrerArbol(a^.HI,anio,l2);
			recorrerArbol(a^.HD,anio,l2);
		end;
	end;
	
	procedure imprimir (l2:listaDos);
	begin
	while (l2 <> nil) do begin
		writeln(l2^.dato);
		l2:=l2^.sig;
	end;
	end;

{tengo que hacer una lista de enteros e imprimirla en el programa principal porque dice retornar
o puedo imprimir en el proceso cada codigo que coincida ¿Se considera mal lo que hice?}

//-------------------------------//
//Programa Principal
var
	a:arbol;
	cant,dni,dni1,dni2,comp:integer;
	anio:rangoanio;
	l2:listaDos;
BEGIN
	a:=nil;
	l2:=nil;
	cargar(a);
	read(dni);
	cant:=cantidades(a,dni);
	writeln(cant);
	read(dni1);
	read(dni2);
	comp:=comprendidos(a,dni1,dni2);
	writeln(comp);
	read(anio);
	recorrerArbol(a,anio,l2);
	imprimir(l2);
END.

