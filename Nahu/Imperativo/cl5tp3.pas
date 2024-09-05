{
Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
}
program ejercicio3;

const

	max = 10;

type
		
	rangorubro = 1..max;
		
	producto = record
		cod:integer;
		rubro:rangorubro;
		stock:integer;
		preciouni:real;
	end;
	
	
	productoChi = record
		cod:integer;
		stock:integer;
		preciouni:real;
	end;
	
	mini = record
		cod:integer;
		stock:integer;
	end;	

	arbol = ^nodo;
	
	nodo = record
		dato:productoChi;
		HI:arbol;
		HD:arbol;
	end;


	vector = array [1..max] of arbol;

//----------------------------------------//
	procedure leer (var p:producto);
	begin
		read(p.cod);
		if (p.cod <> 0) then begin
			read(p.rubro);
			read(p.stock);
			read(p.preciouni);
		end;
	end;	
	
//----------------------------------------//

	procedure asignar (p:producto; var pc:productoChi);
	begin
		pc.cod:=p.cod;
		pc.stock:=p.stock;
		pc.preciouni:=p.preciouni;
	end;

//----------------------------------------//

	procedure iniVec (var v:vector);
	var
		i:integer;
	begin
		for i:= 1 to max do
			v[i]:=nil;
	end;

//----------------------------------------//

	procedure agregar (var a:arbol; p:producto);
	var
		pc:productoChi;
	begin
		asignar(p,pc);
		if (a = nil) then begin
			a^.dato:=pc;
			a^.HD:=nil;
			a^.HI:=nil;
		end
		else if (a^.dato.cod > p.cod) then
			agregar(a^.HI,p)
		else 
			agregar(a^.HD,p);
	end;


//----------------------------------------//
	
	procedure cargar (var v:vector);
	var
		p:producto;
	begin
		leer(p);
		while (p.cod <> 0) do begin
			agregar(v[p.rubro],p);
			leer(p);
		end;	
	end;


//----------------------------------------//


//Implementar un módulo que reciba la estructura generada en a), un rubro y un código
//de producto y retorne si dicho código existe o no para ese rubro.
	function buscar (a:arbol;cod:integer):boolean;
	begin
		if (a=nil) then
			buscar:=false
		else
			if (a^.dato.cod = cod) then
				buscar:=true
			else
				if (a^.dato.cod > cod) then
					buscar:=buscar(a^.HI,cod)
				else
					if (a^.dato.cod < cod) then
						buscar:=buscar(A^.HD,cod);
	end;

//----------------------------------------//

//Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
//rubro, el código y stock del producto con mayor código.

//Mini tiene stock y codigo

	procedure iniMin(var min:mini);
	begin
		min.cod:=0;
		min.stock:=0;
	end;
//----------------------------------------//
	function maximo (a:arbol):mini;
	var
		min:mini;
	begin
		if (a=nil) then begin
			iniMin(min);
			maximo:=min;
		end
		else
			if (a^.HD = nil) then begin
			min.cod:=a^.dato.cod;
			min.stock:=a^.dato.stock;
			maximo:=min;
		end
			else begin
				maximo:=maximo(a^.HD);
			end;
	end;
//----------------------------------------//
	procedure imprimir (min:mini);
	begin
		writeln(min.cod);
		writeln(min.stock);	
	end;
//----------------------------------------//
	procedure buscarImprimir(v:vector);
	var
		i:integer;
		min:mini;
	begin
		for i:=1 to max do begin
			min:=maximo(v[i]);
			imprimir(min);
		end;
	end;


//----------------------------------------//

//Implementar un módulo que reciba la estructura generada en a), dos códigos y
//retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
//ingresados.

	function comprendidos (a:arbol;par1:integer; par2:integer):integer;
	begin
		if (a = nil) then
			comprendidos:=0
		else
			if (a^.dato.cod >= par1) AND (a^.dato.cod <= par2) then
				comprendidos:=1 + comprendidos(a^.HI,par1,par2) + comprendidos(a^.HD,par1,par2)
			else
				if (a^.dato.cod < par1) then
					comprendidos:=comprendidos(a^.HD,par1,par2)
				else
					if(a^.dato.cod > par2) then
						comprendidos:=comprendidos(a^.HI,par1,par2);
	end;

//----------------------------------------//
	procedure pasaje (v:vector);
	var
		i,par1,par2,tot:integer;
	begin
		read(par1);
		read(par2);
		for i:=1 to max do begin
			tot:=comprendidos(v[i],par1,par2);
			writeln('rubro',i,'tiene un total de',tot,'comprendidos');
		end;
	end;

//----------------------------------------//

//Programa Principal
var
	v:vector;
	rubro,cod:integer;
	existe:boolean;
BEGIN
	iniVec(v);
	cargar(v);
	read(rubro);
	read(cod);
	existe:=buscar(v[rubro],cod);
	write(existe);
	buscarImprimir(v);
	pasaje(v);
END.

