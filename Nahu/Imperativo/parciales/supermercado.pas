{
Un supermercado dispone de una lista de los pedidos realizados. De cada pedido se tiene
código del pedido, DNI del cliente y la lista de los productos pedidos (código de producto y
cantidad).
Además se dispone de un árbol de productos. De cada producto se tiene su código y stock.
El árbol está ordenado por código de producto.
Implemente un programa con:
a) Un módulo recursivo que recorra la lista de pedidos actualizando el stock de los
productos. En el caso que el código de producto no exista, debe incorporarse al
árbol con stock en cero.
b) Un módulo que reciba el árbol de productos y dos códigos de producto y retorne una
lista con los códigos de los productos con stock 0 entre los dos códigos recibidos.   
}


program supermercado;

type
//Se dispone de una lista
	
	producto = record
		cod:integer;
		cant:integer;
	end;
	
	listaProd = ^nodo;
	
	nodo = record
		dato:producto;
		sig:listaProd;
	end;

	pedido = record
		codped:integer;
		dnicli:integer;
		list:listaProd;
	end;
	
	lista = ^nodoDos;
	
	nodoDos = record
		dato:pedido;
		sig:lista;
	end;
	
	arbol = ^nodoTres;
	
	nodoTres = record
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;
	
	listaCod = ^nodoCuatro;
	
	nodoCuatro = record
		dato:integer;
		sig:listaCod;
	end;
	
	
	procedure cargarLista (var l:lista); // Se dispone
	begin
	end;

	procedure cargarArbol (var a: arbol); // Se dispone
	begin
	end;

	procedure agregar (var a:arbol; p:producto);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato.cod:=p.cod;
			a^.dato.cant:=0;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if	(a^.dato.cod < p.cod) then
			agregar(a^.HD,p)
		else
			agregar(a^.HI,p);	
	end;



	procedure recorrer (var a:arbol; lp:listaProd);
	begin
		if (a = nil) then
			agregar(a,lp^.dato)	
		else
			if (a^.dato.cod > lp^.dato.cod) then
				recorrer(a^.HI,lp)
			else
				if (a^.dato.cod < lp^.dato.cod) then
					recorrer(A^.HD,lp)
				else
					if (a^.dato.cod = lp^.dato.cod) then
						a^.dato.cant:= a^.dato.cant - lp^.dato.cant;
	end;


	procedure recorrerListas (var a:arbol;  l:lista);
	var
		lp:listaProd;
	begin
		lp:= l^.dato.list;
		while ( l <> nil) do begin
			while (lp <> nil) do begin
				recorrer(a,lp);
				lp:=lp^.sig;
			end;
			l:=l^.sig;
		end;
	end;
	
	procedure agregarAd2 (var lc:listaCod; num:integer);
	var
		nue:listaCod;
	begin
		new(nue);
		nue^.dato:=num;
		nue^.sig:=lc;
		lc:=nue;
	end;
	
	
	procedure comprendidos (a:arbol; cod1,cod2:integer;var lc:listaCod);
	begin
		if (a <> nil) then begin
			if (a^.dato.cod > cod1) AND (a^.dato.cod < cod2) then
				agregarAd2(lc,a^.dato.cod)
			else
				if (a^.dato.cod < cod1) then
					comprendidos(a^.HD,cod1,cod2,lc)
				else
					if (a^.dato.cod > cod2) then
						comprendidos(a^.HI,cod1,cod2,lc);
		end;
	end;






//Programa Principal
var
	l:lista;
	a:arbol;
	lc:listaCod;
	cod1,cod2:integer;
BEGIN
	l:=nil;
	a:=nil;
	lc:=nil;
	cargarLista(l);
	cargarArbol(a);
	read(cod1);
	read(cod2);
	comprendidos(a,cod1,cod2,lc);
END.
