{
Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los clientes durante
agosto 2022. De cada pedido se conoce el numero de cliente, dia, cantidad de combos y monto pagado.
a) Implementar un modulo que lea pedidos, genere y retorne una estructura adecuada para la busqueda por numero de cliente,
donde para cada numero de cliente se almacenen jutnos todos sus pedidos (dia,cantidad de combos y monto) que realizo. La
lectura finaliza con cliente 0. Se sugiere utilizar el modulo leer Registro().
b) Implementar un modulo que reciba la estructura generada en a) y un numero de cliente, y retorne todos los pedidos que realizo
dicho cliente.
c) Realice un modulo recursivo que reciba la informacion retornada en ele inciso b) y retorne el monto total abonado por el cliente.
}
program casacomidas;

type
	subdia =1..31;
	
	pedido = record
		nrocli:integer;
		dia:subdia;
		cantcomb:integer;
		monto:real;
	end;
	
	pedidoChi = record
		dia:subdia;
		cantcomb:integer;
		monto:real;
	end;
	
	lista = ^nodolist;
	
	nodolist = record
		dato:pedidoChi;
		sig:lista;
	end;
	
	pedidoGra = record
		nrocli:integer;
		list:lista;
	end;

	arbol = ^nodo;
	
	nodo = record
		dato:pedidoGra;
		HI:arbol;
		HD:arbol;
	end;

	procedure leer(var p:pedido);
	begin
		p.nrocli:=random(76);
		if (p.nrocli <> 0) then begin
			p.dia:=random(31)+1;
			p.monto:=100.50+random(3000);
			p.cantcomb:=1+random(20);
		end;
	end;

	procedure agregarAd (var l:lista; pc:pedidoChi);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=pc;
		nue^.sig:=l;
		l:=nue;
	end;

	procedure asignar (p:pedido; var pc:pedidoChi);
	begin
		pc.dia:=p.dia;
		pc.monto:=p.monto;
		pc.cantcomb:=p.cantcomb;
	end;

	procedure agregar (var a:arbol; p:pedido);
	var
		pc:pedidoChi;
	begin
		asignar(p,pc);
		if (a=nil) then begin
			new(a);
			a^.dato.nrocli:=p.nrocli;
			a^.dato.list:=nil;
			agregarAd(a^.dato.list,pc);
			a^.HI:=nil;
			a^.HD:=nil;		
		end
		else
			if (a^.dato.nrocli = p.nrocli) then
				agregarAd(a^.dato.list,pc)
			else if (a^.dato.nrocli > p.nrocli) then
				agregar(a^.HI,p)
			else
				agregar(a^.HD,p);
	end;

	procedure cargar (var a:arbol);
	var
		p:pedido;
	begin
		leer(p);
		while (p.nrocli <> 0) do begin
			agregar(a,p);
			leer(p);
		end;
	end;

	procedure crearLista (lis:lista; var l:lista);
	begin
		while (lis <> nil) do begin
			agregarAd(l,lis^.dato);
			lis:=lis^.sig;
		end;	
	end;

	procedure pedidosHechos (a:arbol; codcli:integer; var l:lista);
	begin
		if (a <> nil) then begin
			if (a^.dato.nrocli = codcli) then
				crearLista(a^.dato.list,l)
			else if (a^.dato.nrocli > codcli) then
				pedidosHechos(a^.HI,codcli,l)
			else
				pedidosHechos(a^.HD,codcli,l);	
		end;
	end;

	function montoTotal (l:lista):real;
	begin
		if (l=nil) then
			montoTotal:=0.0
		else
			montoTotal:= l^.dato.monto + montoTotal(l^.sig);
	end;



//Programa Principal
var
	a:arbol;
	l:lista;
	nrocli:integer;
	aux:lista;
BEGIN
	Randomize;
	a:=nil;
	l:=nil;
	cargar(a);
	writeln('Ingrese el nro de cli');
	read(nrocli);
	pedidosHechos(a,nrocli,l);
		aux:=l;
		while (aux <> nil) do begin
			writeln(l^.dato.cantcomb);
			aux:=aux^.sig;
		end;
	writeln(montoTotal(l):2:0);
END.

