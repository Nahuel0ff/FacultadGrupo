{
Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
2
}
program ejercicio4;

type
	
	rangodia = 1..31;
	
	rangomes = 1..12;
//------------------------//
	prestamo = record
		isbn:integer;
		numsoc:integer;
		dia:rangodia;
		mes:rangomes;
		cantdias:integer;
	end;
//------------------------//
	prestamoChico = record
		numsoc:integer;
		dia:rangodia;
		mes:rangomes;
		cantdias:integer;
	end;
//------------------------//
	lista = ^nodoDos;
	
	nodoDos = record
		dato:prestamoChico;
		sig:lista;
	end;
//------------------------//
	prestamoGrande = record
		isbn:integer;
		prestamos:lista;
	end;
//------------------------//
	arbol = ^nodo;
	
	nodo = record
		dato:prestamo;
		HI:arbol;
		HD:arbol;
	end;
//------------------------//
	arbolDos = ^nodoTres;
	
	nodoTres = record
		dato:prestamoGrande;
		HI:arbolDos;
		HD:arbolDos;
	end;
//------------------------//

	isbnCant = record
		isbn:integer;
		totalpres:integer;
	end;
	
	listaDos = ^nodoisbn;
	
	nodoisbn = record
		dato:isbnCant;
		sig:listaDos;
	end;

	listaConUlt = record
		pri:listaDos;
		ult:listaDos;
	end;
	
	
	
//------------------------//

	//Parte A i
	
	procedure leer (var p:prestamo);
	begin
		writeln('Ingrese el numero isbn sin -: ');
		readln(p.isbn);
		if(p.isbn <> 0) then begin
			writeln('Ingrese el numero de socio: ');
			readln(p.numsoc);
			writeln('Ingrese el dia del prestamo: ');
			readln(p.dia);
			writeln('Ingrese el mes del prestamo: ');
			readln(p.mes);
			writeln('Ingrese la cantidad de dias prestados: ');
			readln(p.cantdias);
		end;
	end;
//------------------------//
	procedure agregar (var a: arbol; p:prestamo);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (a^.dato.isbn > p.isbn) then
				agregar(a^.HI,p)
			else
				agregar(a^.HD,p);	
	end;
//------------------------//
	procedure cargar (var a:arbol);
	var
		p:prestamo;
	begin
		leer(p);
		while (p.isbn <> 0) do begin
			agregar(a,p);
			leer(p);
		end;	
	end;
//------------------------//

	//Fin Parte A i
	
	//Parte A ii

//------------------------//	
	procedure agregarAd (var l:lista; pc:prestamoChico);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=pc;
		nue^.sig:=l;
		l:=nue;
	end;
//------------------------//
	procedure asignar (var pc:prestamoChico; var pg:prestamoGrande; p:prestamo);
	begin
		pc.numsoc:=p.numsoc;
		pc.dia:=p.dia;
		pc.mes:=p.mes;
		pc.cantdias:=p.cantdias;
		pg.isbn:=p.isbn;
		pg.prestamos:=nil;
		agregarAd(pg.prestamos,pc);	
	end;
//------------------------//
	procedure agregarDos (var a2:arbolDos; p:prestamo);
	var
		pc:prestamoChico;
		pg:prestamoGrande;
	begin
		asignar(pc,pg,p);
		if (a2 = nil) then begin
			new(a2);
			a2^.dato:=pg;
			a2^.HI:=nil;
			a2^.HD:=nil;		
		end
		else if (a2^.dato.isbn = p.isbn) then	
			agregarAd(a2^.dato.prestamos,pc)
		else if (a2^.dato.isbn > p.isbn) then
			agregarDos(a2^.HI,p)
		else
			agregarDos(a2^.HD,p);	
	end;
//------------------------//
	procedure cargarDos (var a2:arbolDos);
	var
		p:prestamo;
	begin
	leer(p);
		while (p.isbn <> 0) do begin
			agregarDos(a2,p);
			leer(p);
		end;
	end;
//------------------------//

	// Fin Parte A ii

	// Inicio Parte B

//------------------------//

	function maximos(a:arbol):integer;
	begin
		if (a^.HD = nil) then
			maximos:=a^.dato.isbn
		else
			maximos:=maximos(a^.HD);
	end;
	
//------------------------//

	//Fin Parte B
	
	//Inicio Parte C

//------------------------//
	
	function minimo (a2:arbolDos):integer;
	begin
		if (a2^.HI = nil) then
			minimo:=a2^.dato.isbn
		else
			minimo:=minimo(a2^.HD);	
	end;

//------------------------//

	//Fin Parte C 
	
	//Inicio Parte D

//------------------------//
	function cantidad (a:arbol;num:integer): integer;
	begin
		if (a = nil) then
			cantidad:=0
		else
		if (num < a^.dato.numsoc) then
			cantidad:=cantidad(a^.HI,num)
		else if (num > a^.dato.numsoc) then
			cantidad:=cantidad(a^.HD,num)
		else if (num = a^.dato.numsoc) then 
			cantidad:=cantidad+1;
	end;
//------------------------//

	//Fin Parte D
	
	//Corregido hasta acá todo funciona!
	
	//Inicio Parte E

//------------------------//
	
	function total ( a2:arbolDos; num2:integer): integer;
	var
		l:lista;
		cont:integer;
	begin
		if (a2 = nil) then
			total:=0
		else begin
			cont:=0;
			l:=a2^.dato.prestamos;
			while (l <> nil) do begin
				if (l^.dato.numsoc = num2) then
					cont:=cont+1;
				l:=l^.sig;
			end;
			total:=cont + total(a2^.HI,num2) + total(a2^.HD,num2);
		end;
	end;
	
//------------------------//

	//Fin Parte E
	
	//Inicio Parte F

// Registro isbnCant
//	Lista listaDos

//------------------------//

		procedure agregarAtras (var l2:listaConUlt; ic:isbnCant);
	var
		nue:listaDos;
	begin
		new(nue);
		nue^.dato:=ic;
		nue^.sig:=nil;
		
		if (l2.pri = nil) then begin
			l2.pri:=nue;
			l2.ult:=nue;
		end
		else begin
			l2.ult^.sig:=nue;
			l2.ult:=nue;
		end;
	end;
	
//------------------------//

	procedure nodoCantidades(var l2: listaConUlt; ic: isbnCant);
	var
		aux: listaDos;
		cont: boolean;
	begin
		cont := false;
		aux := l2.pri;
		while (aux <> nil) and (ic.isbn > aux^.dato.isbn) do
			aux := aux^.sig;

		if (aux <> nil) and (ic.isbn = aux^.dato.isbn) then begin
			aux^.dato.totalpres := aux^.dato.totalpres + 1;
			cont := true;
		end;

		if (not cont) then begin
			ic.totalpres := 1;
			agregarAtras(l2, ic);
		end;
	end;

//------------------------//
	
	procedure crearLista(a: arbol; var l2: listaConUlt);
	var
		ic: isbnCant;
	begin
		if (a <> nil) then begin
			crearLista(a^.HI, l2);
			ic.isbn := a^.dato.isbn;
			nodoCantidades(l2, ic);
			crearLista(a^.HD, l2);
		end;
	end;

//------------------------//

	//Fin Parte F
	
	//Inicio Parte G

//------------------------//


procedure agregarAd2(var l: listaDos; ic: isbnCant);
var
    nue, ant, act: listaDos;
begin
    new(nue);
    nue^.dato := ic;
    nue^.sig := nil;
    if (l = nil) or (ic.isbn < l^.dato.isbn) then begin
        nue^.sig := l;
        l := nue;
    end
    else begin
        ant := nil;
        act := l;
        while (act <> nil) and (ic.isbn > act^.dato.isbn) do begin
            ant := act;
            act := act^.sig;
        end;
        ant^.sig := nue;
        nue^.sig := act;
    end;
end;


procedure crearListaG(a2: arbolDos; var l: listaDos);
var
    ic: isbnCant;
    aux: lista;
begin
    if (a2 <> nil) then begin
        crearListaG(a2^.HD, l);
        ic.isbn := a2^.dato.isbn;
        ic.totalpres := 0;
        aux := a2^.dato.prestamos;
        while (aux <> nil) do begin
            ic.totalpres := ic.totalpres + 1;
            aux := aux^.sig;
        end;
        agregarAd2(l, ic);
        crearListaG(a2^.HI, l);
    end;
end;


//------------------------//

	//Fin Parte G
	
	//Inicio Parte H
	
//------------------------//
	
	procedure imprimir (pri:listaDos);
	begin
		if( pri <> nil) then begin
			writeln(pri^.dato.isbn,pri^.dato.totalpres);
			pri:=pri^.sig;
			imprimir(pri);
		end;
	end;
	
//------------------------//

	//Fin Parte H
	
	//Inicio Parte I

//------------------------//

	function prestamosEntre(a: arbol; isbnMin, isbnMax: integer): integer;
	begin
		if (a = nil) then
			prestamosEntre := 0
		else if (a^.dato.isbn < isbnMin) then
			prestamosEntre := prestamosEntre(a^.HD, isbnMin, isbnMax)
		else if (a^.dato.isbn > isbnMax) then
			prestamosEntre := prestamosEntre(a^.HI, isbnMin, isbnMax)
		else
			prestamosEntre := 1 + prestamosEntre(a^.HI, isbnMin, isbnMax) + prestamosEntre(a^.HD, isbnMin, isbnMax);
	end;

//------------------------//

	//Fin Parte I
	
	//Inicio Parte J

//------------------------//

	function prestamosEntreDos(a2: arbolDos; isbnMin, isbnMax: integer): integer;
	var
		l: lista;
		cont: integer;
	begin
		if (a2 = nil) then
			prestamosEntreDos := 0
		else if (a2^.dato.isbn < isbnMin) then
			prestamosEntreDos := prestamosEntreDos(a2^.HD, isbnMin, isbnMax)
		else if (a2^.dato.isbn > isbnMax) then
			prestamosEntreDos := prestamosEntreDos(a2^.HI, isbnMin, isbnMax)
		else begin
			cont := 0;
			l := a2^.dato.prestamos;
			while (l <> nil) do begin
				cont := cont + 1;
				l := l^.sig;
			end;
			prestamosEntreDos := cont + prestamosEntreDos(a2^.HI, isbnMin, isbnMax) + prestamosEntreDos(a2^.HD, isbnMin, isbnMax);
		end;
	end;

//------------------------//

	//Fin Parte J

//Programa Principal
var
    a: arbol;
    a2: arbolDos;
    max: integer;
    min: integer;
    num, cant: integer;
    num2, tot: integer;
    isbnMin, isbnMax: integer;
    l2: listaConUlt;
    l: listaDos;
begin
    a := nil;
    a2 := nil;
    l2.pri := nil;
    l2.ult := nil;
    max := 0;
    min := 9999;

    cargar(a); // Parte A i
    cargarDos(a2); // Parte A ii

    max := maximos(a);
    writeln(max); // Parte B

    min := minimo(a2);
    writeln(min); // Parte C

    read(num);
    cant := cantidad(a, num); // Parte D
    writeln(cant);

    read(num2);
    tot := total(a2, num2); // Parte E
    writeln(tot);

    crearLista(a, l2); // Parte F

	l:=nil;
	crearListaG(a2,l); // Parte G
	
	imprimir(l); // Parte H

    readln(isbnMin, isbnMax);
    writeln(isbnMin, isbnMax, prestamosEntre(a, isbnMin, isbnMax)); // Parte I

    readln(isbnMin, isbnMax);
    writeln(isbnMin,isbnMax, prestamosEntreDos(a2, isbnMin, isbnMax)); // Parte J

end.
