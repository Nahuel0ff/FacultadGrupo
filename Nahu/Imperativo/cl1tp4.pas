{
 Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).
}

program ejercicio4;

const

	DF = 8;

type
	
	rangor = 1..DF;
	
	producto = record
		cod:integer;
		rubro:rangor;
		precio:real;	
	end;
	
	productochi = record
		cod:integer;
		precio:real;
	end;

	lista = ^nodo;

	nodo = record
		dato:productochi;
		sig:lista;
	end;

	vectorRubros = array [1..DF] of lista;
	
	vectorTres = array [1..30] of productochi;
	
	
	//Parte A
	
	procedure leer (var p:producto);
	begin
		writeln('Ingrese el precio del producto: ');
		readln(p.precio);
		if (p.precio <> 0) then begin
			writeln('Ingrese el codigo del producto: ');
			readln(p.cod);
			writeln('Ingrese la categoria de rubro el producto (del 1 al 8): ');
			readln(p.rubro);
		end;
	end;
	
	procedure asignar (p:producto; var pc:productochi);
	begin
		pc.cod:=p.cod;
		pc.precio:=p.precio;	
	end;
	
	procedure insertarOrdenado (var l:lista; pc:productochi);
	var
		nue,ant,act:lista;
	begin
		new(nue);
		nue^.dato:=pc;
		act:=l;
		ant:=l;
		while (act <> nil) AND (pc.cod > act^.dato.cod) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = l) then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
	end;
	
	
	procedure iniVec (var v:vectorRubros);
	var 
		i:integer;
	begin
		for i:=1 to 8 do
			v[i]:=nil;	
	end;
	
	
	procedure cargar (var v:vectorRubros);
	var
		p:producto;
		pc:productochi;
	begin
		leer(p);
		while (p.precio <> 0) do begin
			asignar(p,pc);
			insertarOrdenado(v[p.rubro],pc);
			leer(p);	
		end;
	end;
	
	
	//Parte B
	procedure mostrar (v:vectorRubros);
	var
		i:integer;
		l:lista;
	begin
		for i:= 1 to 8 do begin
			writeln('El rubro actual es: ',i);
			l:=v[i];
			if (l = nil) then
				writeln('No hay productos en este rubro')
			else
				while (l <> nil) do begin
					writeln(l^.dato.cod);
					l:=l^.sig;
			end;
		writeln ('-------------');
		end;	
	end;
	
	//Parte C
	procedure rubrotres (var vt:vectorTres; var DL:integer; v:vectorRubros);
	var
		l:lista;
	begin
		l:=v[3];
		while (l <> nil) AND (DL < 30) do begin
			DL:=DL+1;
			vt[DL]:=l^.dato;
			l:=l^.sig;
		end;
	end;
	
	//Parte D
	procedure seleccion (var vt:VectorTres; DL:integer);
	var
		i,j,pos:integer; item:productochi;
	begin
		for i:= 1 to DL-1 do begin
			pos:=i;
			for j:= i+1 to DL do
				if vt[j].precio < vt[pos].precio then
					pos:=j;
			item:=vt[pos];
			vt[pos]:=vt[i];
			vt[i]:=item;
		end;	
	end;
	
	//Parte E
	
	procedure mostrar2 (vt:vectorTres; DL:integer);
	var
		i:integer;
	begin
		if (DL = 0) then
			writeln('No hay productos en el rubro 3')
		else begin
		for i:= 1 to DL do
			writeln(vt[i].precio);
		writeln ('-------------');
		end;	
	end;
	
	
	//Parte F
		function promedio (vt:vectorTres; DL:integer):real;
	var
		i:integer;
		suma:real;
	begin
		suma:=0;
		if (DL = 0) then
			promedio:=suma
		else begin
		for i:= 1 to DL do
			suma:=suma+vt[i].precio;
		promedio:=suma/DL;
		end;
	end;
	
	
	
//Programa Principal
var
	DL:integer;
	v:vectorRubros;
	vt:vectorTres;
	prom:real;
BEGIN
	DL:=0;
	iniVec(v);
	cargar(v); //Parte A
	mostrar(v); //Parte B
	rubrotres(vt,DL,v); //Parte C
	seleccion(vt,DL); //Parte D
	mostrar2(vt,DL); //Parte E
	prom:=promedio(vt,DL); //Parte F
	writeln('El promedio es: ',prom:0:2);
END.

