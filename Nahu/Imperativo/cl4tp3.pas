{
Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros
}
program ejercicio3;
	
	type
		
		producto = record
			cod:integer;
			totaluni:integer;
			montototal:real;
		end;

		venta = record
			codventa:integer;
			codprodven:integer;
			cantuni:integer;
			preciouni:real;
		end;
		
	arbol = ^nodo;
	
	nodo = record
		dato:producto;
		HI:arbol;
		HD:arbol;
	end;
	
	procedure leerVenta (var v: venta);
	begin
		readln(v.codventa);
			if (v.codventa <> -1) then begin
				readln(v.codprodven);
				readln(v.cantuni);
				readln(v.preciouni);	
		end;
	end;
	
	
	procedure asignar (v:venta ;var p:producto);
	begin
		p.cod:=v.codprodven;
		p.totaluni:= v.cantuni + p.totaluni;
		p.montototal:= p.montototal +(v.cantuni * v.preciouni);
	end;

	procedure agregar (var a:arbol; v:venta);
	var
		p:producto;
	begin
		if (a = nil) then begin
			new(a);
			asignar(v,p);
			a^.dato:=p;
			a^.HI:=nil;		
			a^.HD:=nil;
		end
		else if (a^.dato.cod = v.codprodven) then
			asignar(v,a^.dato)
		else if (a^.dato.cod > v.codprodven) then
				agregar(a^.HI,v)
			else
				agregar(a^.HD,v)

	end;
	
	//Parte A
	procedure cargar (var a:arbol);
	var
		v:venta;
	begin
		leerVenta(v);
		while (v.codventa <> -1) do begin
			agregar(a,v);
			leerVenta(v);
		end;	
	end;

	//Parte B
	
	procedure imprimir (p:producto);
	begin
			writeln(p.cod);
			writeln(p.totaluni);
			writeln(p.montototal:2:0);
	end;
	
	procedure imprimirOrd (a:arbol);
	begin
		if (a <> nil) then begin
			imprimirOrd(a^.HI);
			imprimir(a^.dato);
			imprimirOrd(a^.HD);	
		end;
	end;

	//Parte C
	
	function buscarMax (a:arbol): producto;
	var
		maxHD,maxActual:producto;
	begin
		if (a = nil) then begin
			maxActual.cod:=-1;
			maxActual.totaluni:=-1;
			maxActual.montototal:=0.0;
		end
		else begin
			maxActual:=a^.dato;
			if (a^.HD <> nil) then begin
				maxHD:=buscarMax(a^.HD);
			if (maxHD.totaluni > maxActual.totaluni) then
				maxActual:=maxHD;
			end;
		end;
	buscarMax:=maxActual;
	end;

	// Parte D

	function buscarMin (a:arbol; par:integer):integer;
	begin
		if (a = nil) then
			buscarMin:=0
		else
		begin
			buscarMin:= buscarMin(a^.HI,par) + buscarMin(a^.HD,par);
		if (a^.dato.cod < par) then
			buscarMin:=buscarMin + 1;
		end;
	end;

	// Parte E
	
	function comprendidos (a:arbol; par1,par2:integer):real;
	begin
		if (a = nil) then
			comprendidos :=0.0
		else
		begin
			comprendidos:= 0.0;
			
			if (a^.dato.cod > par1) and (a^.dato.cod < par2) then
				comprendidos:=a^.dato.montototal;
				
			comprendidos := comprendidos + comprendidos(a^.HI, par1, par2) + comprendidos(a^.HD, par1, par2);
	
		end;
	end;


//Programa Principal
var
	a:arbol;
	max:producto;
	min:integer;
	par,par1,par2:integer;
	total:real;
BEGIN
	a:=nil;
	cargar(a); //Parte A
	imprimirOrd(a); //Parte B
	max:=buscarMax(a); //Parte C
	writeln(max.cod,max.totaluni,max.montototal);
	read(par);
	min:=buscarMin(a,par); //Parte D
	writeln(min);
	read(par1);
	read(par2);
	total:=	comprendidos(a,par1,par2);
	write(total:2:0);
END.

