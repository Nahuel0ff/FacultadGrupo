{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.

b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.

c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.

d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.


e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program P2E2;

type
	lista = ^nodo;
	
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
	
	
{-----------------------MODULOS----------------------}



procedure generarRecursivo (var L, ult: lista; numRandom: integer);
var
	nue:lista;
begin
	if (numRandom <> 100) then
	begin
		new(nue);
		nue^.dato:= numRandom;
		nue^.sig:= nil;
		
		if (L=nil) then
			L:= nue
		else
			ult^.sig:= nue;
		ult:= nue;
		generarRecursivo(L, ult, random(201-100+1)+100);
	end;
end;

procedure imprimirRecursivo (L:lista);
begin
	if (L<>nil) then
	begin
		writeln(L^.dato);
		imprimirRecursivo(L^.sig);
	end;
end;

procedure imprimirRecursivoInverso (L:lista);
begin
	if (L<>nil) then
	begin
		imprimirRecursivoInverso(L^.sig);
		writeln(L^.dato);
	end;
end;

procedure minimoRecursivo(L:lista; var min:integer);
begin
	if (L<>nil) then
	begin
		if (L^.dato < min) then
			min:= L^.dato;
		minimoRecursivo(L^.sig, min);
	end;
end;

function verificarRecursivo (L:lista; valor:integer):boolean;
begin
	if (L = nil) then
		verificarRecursivo := false
	else begin
		if (L^.dato = valor) then
			verificarRecursivo:= true
		else
			verificarRecursivo:= verificarRecursivo(L^.sig, valor);
	end;
end;




var
	L, ult:lista;
	min, valor:integer;
	ok: boolean;
begin
	L:= nil;
	min:=9999;
	randomize;
	
	generarRecursivo(L,ult, random(201-100+1)+100);
	
	writeln('--------------IMPRIMIR --------------');
	imprimirRecursivo(L);
	
	writeln('--------------IMPRIMIR AL REVES--------------');
	imprimirRecursivoInverso(L);
	
	writeln('--------------OBTENER EL MINIMO RECURSIVO--------------');
	minimoRecursivo(L, min);
	writeln(min);
	
	writeln('--------------VERIFICAR VALOR EN LA LISTA RECURSIVO--------------');
	write('Ingrese un valor para saber si se encuentra en la lista: ');
	readln(valor);
	ok:= verificarRecursivo(L, valor);
	writeln(ok);
end.
