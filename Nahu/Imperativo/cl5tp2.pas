{
Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
}

program ejercicio2;

type
	
	rangoanio = 2010..2018;
	
	auto = record
		patente:integer;
		anio:rangoanio;
		marca:string;
		modelo:string;
	end;
	
	//arbol i
	
	arbol = ^nodo;

	nodo = record
		dato:auto;
		HI:arbol;
		HD:arbol;
	end;
	
	//arbol ii
	
	autoChico = record
		patente:integer;
		anio:rangoanio;
		modelo:string;
	end;
//---------------------------------------------//	
	lista = ^nodoDos;

	nodoDos = record
		dato:autoChico;
		sig:lista;
	end;
//---------------------------------------------//
	autoGrande = record
		marca:string;
		list:lista;
	end;
//---------------------------------------------//	
	arbolDos = ^nodoTres;

	nodoTres = record
		dato:autoGrande;
		HI:arbolDos;
		HD:arbolDos;
	end;
//---------------------------------------------//		
	
	autito = record
		patente:integer;
		marca:string;
		modelo:string;
	end;
	
	listaDos = ^nodoCuatro;
	
	nodoCuatro = record
		dato:autito;
		sig:listaDos;
	end;
	
	vector = array [rangoanio] of listaDos;
	
//Procesos	
//---------------------------------------------//

	procedure leer (var a:auto);
	begin
		read(a.marca);
		if (a.marca <> 'MMM') then begin
			read(a.patente);
			read(a.anio);
			read(a.modelo);
		end;
	end;	
//---------------------------------------------//
	procedure agregar (var a:arbol; au:auto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=au;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if	(a^.dato.patente < au.patente) then
			agregar(a^.HI,au)
		else
			agregar(a^.HD,au);
	end;
//---------------------------------------------//
	
	//Arbol ii
	
	procedure asignar (var au:auto; var ac:autoChico);
	begin
		ac.patente:=au.patente;
		ac.anio:=au.anio;
		ac.modelo:=au.modelo;
	end;
//---------------------------------------------//
	procedure agregarAd (var l:lista; ac:autoChico);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=ac;
		nue^.sig:=l;
		l:=nue;
	end;
//---------------------------------------------//
	procedure agregarDos (var a2:arbolDos; au:auto);
	var
		ac:autoChico;
	begin
		asignar(au,ac);
		if (a2 = nil) then begin
			a2^.dato.marca:=au.marca;
			a2^.dato.list:=nil;
			agregarAd(a2^.dato.list,ac);
			a2^.HI:=nil;
			a2^.HD:=nil;
		end
		else if (a2^.dato.marca > au.marca) then
			agregarDos(a2^.HI,au)
		else if (a2^.dato.marca < au.marca) then
			agregarDos(a2^.HD,au)
		else if (a2^.dato.marca = au.marca) then
			agregarAd(a2^.dato.list,ac);	
	end;

//---------------------------------------------//
	procedure cargar (var a:arbol; var a2:arbolDos);
	var
		au:auto;
	begin
		leer(au);
		while (au.marca <> 'MMM') do begin
			agregar(a,au);
			agregarDos(a2,au);
			leer(au);		
		end;
	end;

// b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
// cantidad de autos de dicha marca que posee la agencia.

	function contador (a:arbol; marca:string):integer;
	begin
		if (a = nil) then
			contador:=0
		else
			if (a^.dato.marca = marca) then
				contador:= 1 + contador(a^.HI,marca) + contador(a^.HD,marca)
			else
				contador:= contador(a^.HI,marca) + contador(a^.HD,marca);	
	end;
// Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
//la cantidad de autos de dicha marca que posee la agencia.

	function recorrer (l:lista; marca:string):integer;
	var
		cont:integer;
	begin
		cont:=0;
		while (l <> nil) do begin
			cont:=cont+1;
			l:=l^.sig;
		end;	
		recorrer:=cont;
	end;
//---------------------------------------------//
	function contadorDos (a2:arbolDos; marca:string):integer;
	var
		l:lista;
		cont:integer;
	begin
		if (a2 = nil) then
			contadorDos:=0
		else
		l:=a2^.dato.list;
		cont:=0;
		if (a2^.dato.list <> nil) AND (a2^.dato.marca = marca) then begin
			cont:=recorrer(l,marca);
			contadorDos:=cont
		end
		else
			if (a2^.dato.marca <> marca) then
				contadorDos:=  contadorDos(a2^.HI,marca) + contadorDos(a2^.HD,marca);
	end;
	
//d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
//la información de los autos agrupados por año de fabricación
	
	procedure iniVec (var v:vector);
	var
		i:integer;
	begin
		for i:=1 to 8 do
			v[i]:=nil;	
	end;
//---------------------------------------------//
	procedure asignarDos (au:auto; var aut:autito);
	begin
		aut.marca:=au.marca;
		aut.modelo:=au.modelo;
		aut.patente:=au.patente;
	end;
//---------------------------------------------//
	procedure agregarAd2 (var l2:listaDos; aut:autito);
	var
		nue:listaDos;
	begin
		new(nue);
		nue^.dato:=aut;
		nue^.sig:=l2;
		l2:=nue;
	end;
//---------------------------------------------//
	procedure recorrerDos (a:arbol; var v:vector);
	var
		aut:autito;
	begin
		if (a <> nil) then begin
			asignarDos(a^.dato,aut);
			recorrerDos(a^.HI,v);
			agregarAd2(v[a^.dato.anio],aut);
			recorrerDos(a^.HD,v);	
		end;
	end;

//e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
//modelo del auto con dicha patente.
	
	function busqueda (a:arbol;patente:integer):string;
	begin
		if (a=nil) then
			busqueda:='No se encontro'
		else
			if (a^.dato.patente = patente) then
				busqueda:=a^.dato.modelo
			else
				if (a^.dato.patente > patente) then
					busqueda:=busqueda(a^.HI,patente)
				else
					if (a^.dato.patente < patente) then
						busqueda:=busqueda(a^.HD,patente);	
	end;
	
//f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
//modelo del auto con dicha patente.

	procedure recorrer (l:lista;var encontre:boolean;patente:integer ;var dato:string);
	begin
		while (l <> nil) do begin
			if (l^.dato.patente = patente) then begin
				dato:=l^.dato.modelo;
				encontre:=true;
				end;
				l:=l^.sig;
		end;
	end;
	
//---------------------------------------------//

	function busquedaDos (a2:arbolDos; patente:integer):string;
	var
		l:lista;
		encontre:boolean;
		dato:string;
	begin
		if (a2 = nil) then
			busquedaDos:='Vacio'
		else
			l:=a2^.dato.list;
			encontre:=false;
			if (l <> nil) then 
				recorrer(l,encontre,patente,dato)
			else
				if (encontre = false) then
					busquedaDos:= busquedaDos(a2^.HI,patente) + busquedaDos(a2^.HD,patente);

		if (encontre = true) then
			busquedaDos:=dato;

	end;


	//---------------------------------------------//
//Programa Principal
var
	a:arbol;
	a2:arbolDos;
	cont,cont2,patente:integer;
	marca,busq1,busq2:string;
	v:vector;
BEGIN
	a:=nil;
	a2:=nil;
	cargar(a,a2);
	read(marca);
	cont:=contador(a,marca);
	write(cont);
	cont2:=contadorDos(a2,marca);
	write(cont2);
	iniVec(v);
	recorrerDos(a,v);
	read(patente);
	busq1:=busqueda(a,patente);
	busq2:=busquedaDos(a2,patente);
END.

