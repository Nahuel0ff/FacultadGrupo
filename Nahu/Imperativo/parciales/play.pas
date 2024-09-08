{
Playstation Store requiere procesar las compras realizadas  por sus clientes durante el años 2022
a) Implementar un modulo que ela compras de videojuegos. De cada compra se lee codigo del videojuego, codigo
de cliente, dia y mes. La lectura finaliza con el codigo de cliente 0. Se sugiere utilizar el modulo leer compra(). Se deben
retornar dos estructuras de datos:
	i. Una estructura eficiente para la busqueda por codigo de cliente.
	ii.Otra estructura que almacena la cantidad de compras realizadas en cada mes.
b) Implementar un modulo que reciba la estructura generada en a)i, un codigo de cliente, retorne todas las compras
que realizo dicho cliente.
c) Implementar un modulo que reciba la estructura gereada en a)ii y retorne la misma estructura ordenada por cantidad de mayor
a menor
}
program play;

const
		DF = 12;

type
	sub_dia=1..31;
	sub_mes=1..12;
	
	compra = record
		videojuego:integer;
		cliente:integer;
		dia:sub_dia;
		mes:sub_mes;
	end;
	
	vector = array [1..DF] of integer;
	
	arbol = ^nodo;
	
	nodo = record
		dato:compra;
		HI:arbol;
		HD:arbol;
	end;
	
	lista = ^nodoDos;
	
	nodoDos = record
		dato:compra;
		sig:lista;
	end;
	
	procedure leerCompra (var c:compra);
	begin
		c.cliente:=Random(100);
		if(c.cliente <> 0)then begin
			c.dia:=Random(31)+1;
			c.mes:=Random(12)+1;
			c.videojuego:=Random(20000)+1;	
		end;
	end;
	
	procedure agregar (var a:arbol; c:compra);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=c;
			a^.HD:=nil;
			a^.HI:=nil;
		end
		else if (a^.dato.cliente > c.cliente) then
			agregar(a^.HI,c)
		else
			agregar(a^.HD,c);	
	end;
	
	procedure cargar (var a:arbol; var v:vector);
	var
		c:compra;
	begin
		leerCompra(c);
		while (c.cliente <> 0) do begin
			agregar(a,c);
			v[c.mes]:=v[c.mes]+1;
			leerCompra(c);
		end;
	end;

	{procedure agregarAlVector(var v:vector; var dimL:integer; elem:registro);
	begin
		if (dimL < dimF) then begin
			dimL:=dimL+1;
			v[dimL]:=elem;
		end;
	end;}


	{procedure agregarAtras (var l,ult:lista;r:registro);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=r;
		nuevo^.sig:=nil;
		if (l=nil) then
			l:=nuevo
		else
			nuevo^.sig:=ult;
		ult:=nuevo;
	end;}

	{procedure insertarOrdenado (var l:lista;r:registro);
	var
		nuevo,ant,act:lista;
	begin
		new(nuevo);
		nuevo^.dato:=r;
		act:=l;
		while (act <> nil) AND (act^.dato.cod < r.codigo) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = l) then
			l:=nuevo
		else
			ant^.sig:=nuevo;
		nuevo^.sig:=act;
	end;}
	

	
	//Modulo C
	
	procedure seleccion (var v2:vector;DF:integer);
	var
		i,j,pos:integer; item:integer;
	begin
		for i:= 1 to DF-1 do begin
			pos:=i;
			for j:=i+1 to DF do
				if (v2[j] > v2[pos]) then
					pos:=j;
			item:=v2[pos];
			v2[pos]:=v2[i];
			v2[i]:=item;	
		end;
	end;
	
		procedure agregarAdelante (var l:lista; c:compra);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:=c;
		nuevo^.sig:=l;
		l:=nuevo;
	end;
	
	
	procedure imprimirLista (l:lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.videojuego);
			l:=l^.sig;
		end;
	end;
	
	
	procedure iniVec (var v:vector);
	var
		i:integer;
	begin
		for i:=1 to DF do
			v[i]:=0;		
	end;
	

	procedure imprimirArbol (a:arbol);
	begin
		if (a<>nil) then begin
			imprimirArbol(a^.HI);
			writeln(a^.dato.cliente);
			imprimirArbol(a^.HD);
		end;
	end;
	
		//Modulo B
	
	procedure retornarCliente (a:arbol; var l:lista; cod:integer);
	begin
		if (a <> nil) then begin
			
			if (a^.dato.cliente = cod) then begin
				agregarAdelante(l,a^.dato);
				retornarCliente(a^.HD,l,cod);
			end
			else
				if (a^.dato.cliente < cod) then
					retornarCliente(a^.HD,l,cod)
				else
					retornarCliente(a^.HI,l,cod);				
		end;
	end;


//Programa principal
var
	v,v2:vector;
	l:lista;
	a:arbol;
	i,cod:integer;
BEGIN
	Randomize;
	a:=nil;
	l:=nil;
	iniVec(v);
	writeln('Vector inicializado');
	cargar(a,v);
	writeln('Vector y arbol cargados');
	writeln('Vector');
	for i:= 1 to DF do
		writeln(v[i]);
	writeln('Arbol');
	imprimirArbol(a);
	writeln('Arbol y vector ya impresos');
	writeln('Ingrese un codigo');
	read(cod);
	retornarCliente(a,l,cod);
	writeln('Lista generada con el codigo: ',cod);
	imprimirLista(l);
	v2:=v;
	seleccion(v2,DF);	
	writeln('Vector ordenado');
	for i:= 1 to DF do
		writeln(v2[i]);
END.

