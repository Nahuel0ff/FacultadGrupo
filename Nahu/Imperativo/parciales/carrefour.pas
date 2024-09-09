{
El hipermercado Carrefour necesita un sistema para obtener estadisticas sobre las compras realizadas por sus clientes.
a) Implementar un modulo que lea informacion de todas las compras de 2023, los almacene y retorne una estructura de datos
eficiente para la busqueda por codigo de cliente, donde para cada codigo se almacenen juntas todas sus compras. De cada compra
se conoce: codigo de cliente, numero de factura, cantidad de productos y monto. La lectura finaliza con el codigo de cliente 0.
b) Implementar un modulo que reciba la estructura generada en a), un codigo de cliente y retorne la cantidad de comrpas y el monto
total gastado por dicho cliente durante el 2023.
c) Realizar un modulo que reciba la estructura generada en a) y dos numeros de factura X e Y, y retorne todas las ventas cuyo
numero de factura esten entre X e Y (INCLUIDOS)
}


program carrefour;

type
	compra = record
		codcli:integer;
		factu:integer;
		cantprod:integer;
		monto:real;
	end;
	
	compraChi = record
		factu:integer;
		cantprod:integer;
		monto:real;
	end; 

	lista = ^nodolist;
	
	nodolist = record
		dato:compraChi;
		sig:lista;
	end;

	compraGra = record
		codcli:integer;		
		list:lista;
	end;

	arbol = ^nodo;
	
	nodo = record
		dato:compraGra;
		HI:arbol;
		HD:arbol;
	end;

	procedure leerCompra (var c:compra);
	begin
		c.codcli:=random(700);
		if (c.codcli <> 0) then begin
			c.factu:=random(10000);
			c.cantprod:=random(20)+1;
			c.monto:=random(2000)+(random(10)+1);
		end;
	end;

	procedure asignar (c:compra;var cc:compraChi);
	begin
		cc.factu:=c.factu;
		cc.cantprod:=c.cantprod;
		cc.monto:=c.monto;
	end;
	
	
	procedure agregarAd (var l:lista; cc:compraChi);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=cc;
		nue^.sig:=l;
		l:=nue;	
	end;

	procedure agregar (var a:arbol; c:compra);
	var
		cc:compraChi;
	begin
		asignar(c,cc);
		if (a=nil) then begin
			new(a);
			a^.dato.codcli:=c.codcli;
			a^.dato.list:=nil;
			agregarAd(a^.dato.list,cc);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if (a^.dato.codcli = c.codcli) then
			agregarAd(a^.dato.list,cc)
		else
			if (a^.dato.codcli > c.codcli) then
				agregar(a^.HI,c)
			else
				agregar(a^.HD,c)	
	end;
	
	procedure cargar (var a:arbol);
	var
		c:compra;
	begin
		leerCompra(c);
		while (c.codcli <> 0) do begin
			agregar(a,c);
			leerCompra(c);
		end;	
	end;
	
	procedure recorrer (l:lista; var cant:integer; var total:real);
	begin
		while (l <> nil) do begin
			total:=total + l^.dato.monto;
			cant:=cant+1;
			l:=l^.sig;
		end;
	end;


	procedure totalGastado (a:arbol; cod:integer; var cant:integer; var total:real);
	begin
		if (a <> nil) then begin
			
			if (a^.dato.codcli = cod) then
				recorrer(a^.dato.list,cant,total)
			else
				if (a^.dato.codcli > cod) then
					totalGastado(a^.HI,cod,cant,total)
				else
					totalGastado(a^.HD,cod,cant,total);				
		end;
	end;
	
	procedure generarList (list:lista; x,y:integer; var l:lista);
	begin
		while (list <> nil) do begin
			if (list^.dato.factu >= x) AND (list^.dato.factu <= y) then
				agregarAd(l,list^.dato);
			list:=list^.sig;			
		end;
	end;
	
	
	procedure retornar (a:arbol; x,y:integer; var l:lista);
	begin
		if (a <> nil) then begin
			generarList(a^.dato.list,x,y,l);
			retornar(a^.HI,x,y,l);
			retornar(a^.HD,x,y,l);
		end;
	end;


	procedure imprimirAr (a:arbol);
	begin
		if (a <> nil) then begin
			imprimirAr(a^.HI);
			writeln(a^.dato.codcli);
			imprimirAr(a^.HD);
		end;
	end;

	procedure imprimirLis(l:lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.factu);
			l:=l^.sig;
		end;
	end;

//Programa principal
var
	a:arbol;
	cod,cant,x,y:integer;
	total:real;
	l:lista;
BEGIN
	Randomize;
	a:=nil;
	l:=nil;
	cant:=0;
	total:=0.0;
	cargar(a);
	writeln('Arbol');
	imprimirAr(a);
	writeln('Ingrese un codigo');
	read(cod);
	totalGastado(a,cod,cant,total);
	writeln('El total gastado fue de: ',total:2:0,' con una cantidad de ',cant);
	writeln('Ingrese un codigo x');
	read(x);
	writeln('Ingrese un codigo y');
	read(y);
	retornar(a,x,y,l);
	imprimirLis(l);
END.

