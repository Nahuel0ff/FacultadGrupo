{
Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.  
}

program ejercicio2;

const

	max = 200;
	min = 100;

type
	
	lista = ^nodo;
	
	nodo = record
		dato:integer;
		sig:lista;
	end;
	
	procedure leer (var num:integer);
	var
		ran:integer;
	begin
		ran:= min + random (max - min + 1);
		num:=ran;
	end;

	procedure insertarAd (var l:lista; num:integer);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=num;
		nue^.sig:=l;
		l:=nue;	
	end;

	// Parte A
	procedure cargarLista (var l:lista);
	var
		num:integer;
	begin
		leer(num);
		if (num <> 100) then begin
			cargarLista(l);
			insertarAd(l,num);			
		end;
	end;

	//Parte B
	procedure imprimir (l:lista);
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			imprimir(l^.sig);
		end;
	end;

	// Parte C
	procedure imprimirAlReves (l:lista);
	begin
		if (l <> nil) then begin
			imprimirAlReves(l^.sig);
			writeln(l^.dato);
		end;
	end;

	//Parte D
	function minimo (l:lista):integer;
	var
		minRest:integer;
	begin
		if (l = nil) then
			minimo:=999
		else begin
			minRest:=minimo(l^.sig);
			if (l^.dato < minRest) then 
				minimo:=l^.dato
			else
				minimo:=minRest;
		end;	
	end;
	
	function mini (a,b:integer):integer;
	begin
		if (a<b) then
			mini:=a
		else
			mini:=b;
	end;
			
	function minimo (l:lista):integer;
	begin
		if (l = nil) then
			minimo:=9999
		else
			minimo := mini(l^.dato,minimo(l^.sig));
	end;

	
	
	
	

	function buscar (l:lista;valor:integer):boolean;
	begin
		if (l = nil) then
			buscar:=false
		else if (l^.dato = valor) then
			buscar:=true
		else
			buscar:=buscar(l^.sig,valor);	
	end;


//Programa Principal
var
	l:lista;
	num:integer;
	esta:boolean;
	valor:integer;
	
begin
	Randomize;
	
	l:=nil;
	cargarLista(l); //Parte A
	imprimir(l); //Parte B
	imprimirAlReves(l); //Parte C
	num:=minimo(l);
	writeln(num); //Parte D
	writeln('Ingrese el numero a buscar: ');//Parte E
	readln(valor);
	esta:=buscar(l,valor);
	if esta then
		writeln('Se encontró el valor')
	else
		writeln('No existe el valor');
END.

