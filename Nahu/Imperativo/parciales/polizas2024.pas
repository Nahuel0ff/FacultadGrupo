{
Se desea procesar las polizas de una compania de seguros. De cada poliza se conoce: DNI del cliente, suma asegurada
valor cuota y fecha de vencimiento. Un cliente puede tener mas de una poliza. Las Polizas se comenzaron a emitir a 
partir del 2000 y finalizaron de emitirse en 2023.
Realice un programa que contenga:
a) Un modulo que lea polizas, hasta leer una poliza con DNI -1, y las almacene en una estructura eficiente para la
busqueda por suma asegurada.
b)Un modulo que reciba la estructura generada en a) y devuelva otra estructura con las polizas cuya suma asegurada
sea menor a un valor recibido como parametro. Esta estructura debe estar agrupada por año de vencimiento y ordenada
por DNI de cliente
c) Un modulo que reciba la estructura generada en b) y devuelva la cantidad de polizas de un cliente cuyo DNI se recibe
por parametro
}


program polizas;

type
	aniosub = 2000..2023;

	poliza = record
		dni:integer;
		suma:integer;
		cuota:real;
		venc:aniosub;
	end;

	arbol = ^nodo;
	
	nodo = record
		dato:poliza;
		HI:arbol;
		HD:arbol;
	end;
	
	polizaChi = record
		dni:integer;
		suma:integer;
		cuota:real;
	end;
	
	lista = ^nodoLis;
	
	nodoLis = record
		dato:polizaChi;
		sig:lista;
	end;
	
	vector = array [aniosub] of lista;
	
	
	
procedure leer (var p:poliza);
begin
	read(p.dni);
	if (p.dni <> -1) then begin
		read(p.suma);
		read(p.cuota);
		read(p.venc);
	end;
end;

procedure agregar (var a:arbol; p:poliza);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=p;
		a^.HD:=nil;
		a^.HI:=nil;	
	end
	else if	(a^.dato.suma > p.suma) then
		agregar(a^.HI,p)
	else
		agregar(a^.HD,p);
end;

procedure cargar (a:arbol);
var
	p:poliza;
begin
	leer(p);
	while (p.dni <> -1) do begin
		agregar(a,p);
		leer(p);
	end;
end;

procedure traducir (p:poliza; var pc:polizaChi);
begin
	pc.dni:=p.dni;
	pc.suma:=p.suma;
	pc.cuota:=p.cuota;
end;

procedure insetarOrdenado (var l:lista; pc:polizaChi);
var
	nue,ant,act:lista;
begin
	new(nue);
	nue^.dato:=pc;
	act:=l;
	ant:=l;
	while (act <> nil) AND (pc.dni > act^.dato.dni) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = ant) then
		l:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;



procedure recorrer (a:arbol; valor:integer;var v:vector);
var
	pc:polizaChi;
begin
	if (a<> nil) then begin
		
		if (a^.dato.suma < valor) then begin
			traducir(a^.dato,pc);
			insetarOrdenado(v[a^.dato.venc],pc);
			recorrer(a^.HI,valor,v);
			recorrer(a^.HD,valor,v);
		end
		else
			recorrer(a^.HI,valor,v);
	end;
end;

procedure iniVec (var v:vector);
var
	i:integer;
begin
	for i:=2000 to 2023 do
		v[i]:=nil;	
end;

function cantPoli (l:lista;dni:integer):integer;
begin
	if (l = nil) then
		cantPoli:=0
	else
		if (l^.dato.dni = dni) then
			cantPoli:=1+ cantPoli(l^.sig,dni)
		else if (l^.dato.dni < dni) then
			cantPoli:=cantPoli(l^.sig,dni)
		else if (l^.dato.dni > dni) then
			cantPoli:=0;
end;


function recorrerVec (v:vector;dni:integer):integer;
var
	i,cant:integer;
begin
	cant:=0;
	for i:=2000 to 2023 do 
		cant:=cant + cantPoli(v[i],dni);
	recorrerVec:=cant;
end;


//Programa Principal
var
	a:arbol;
	v:vector;
	valor,cant,dni:integer;
BEGIN
	a:=nil;
	cargar(a);
	iniVec(v);
	writeln('Ingrese el valor máximo de suma asegurada:');
	read(valor);
	recorrer(a,valor,v);
	writeln('Ingrese el DNI del cliente para contar sus pólizas:');
	read(dni);
	cant:=recorrerVec(v,dni);
END.

