{Se desea procesar la información de las ventas de productos de un comercio (como máximo 50).
Implementar un programa que invoque los siguientes módulos:

a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta,
código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades). El código debe generarse automáticamente (random)
y la cantidad se debe leer. El ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto
a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).}


program p1e1;

const
	DF = 8;

type
	
	{rangos}
	rangoDia = 0..31;	// porque si el corte es con dia=0, puede tomar ese valor
	rangoCod = 1..15;
	rangoCant = 0..99;	// porque puede no haber ventas
	rangoVec = 0..DF;
	
	venta = record
		dia: rangoDia;
		codigo: rangoCod;
		cantidad: rangoCant;
	end;
	
	vector = array [1..DF] of venta;
	
	ventaPar = record
		codigo: rangoCod;
		cantidad: rangoCant;
	end;
	
	lista = ^nodo;

	nodo = record
		dato: ventaPar;
		sig:lista;
	end;

{-------------------MODULOS-------------------}



procedure cargarVector (var v:vector; var DL: rangoVec);

	
	// LEE UNA SOLA VENTA
	
	procedure leerRegistro(var unaVenta:venta);
	begin
		randomize;
		
		write('Dia: ');
		unaVenta.dia := random(32);
		writeln (unaVenta.dia);
		
		if (unaVenta.dia <> 0) then
		begin
			write('Codigo: ');
			unaVenta.codigo := random(15)+1;
			writeln (unaVenta.codigo);
			
			write('Cantidad (entre 1 y 99): ');
			readln(unaVenta.cantidad);
			
			writeln();
		end;
	end;
	

var
	unaVenta: venta;
begin
	leerRegistro(unaVenta);
	while (DL < DF) and (unaVenta.dia <> 0) do
	begin
		DL:= DL+1;
		v[DL]:= unaVenta;
		leerRegistro(unaVenta);
	end;
end;





procedure imprimirVector(v:vector; DL:rangoVec);
var
	i: rangoVec;
begin
	for i:= 1 to DL do
	begin
		
		writeln('POSICION ',i,': ');
		
		write('[*] Dia: ');
		writeln(v[i].dia);
		
		write('[*] Codigo: ');
		writeln(v[i].codigo);
		
		write('[*] Cantidad: ');
		writeln(v[i].cantidad);
		
		writeln();
	end;
end;



procedure ordenarVector (var v:vector; DL:rangoVec);
var
	i,j,pos: rangoVec;
	aux: venta;
	
begin
	for i:= 1 to (DL-1) do
	begin
		pos:= i;
		
		for j:= (i+1) to DL do
			if v[j].codigo < v[pos].codigo then
				pos:= j;
		
		aux := v[pos];
		v[pos] := v[i];
		v[i] := aux;
	end;
end;


procedure eliminar (var v:vector; var DL:rangoVec; cod1, cod2:rangoCod); //supongo pos1: 3 y pos2: 7

	function buscarPos1(v:vector; DL:rangoVec; cod1: rangoCod):rangoVec;
	var
		i:rangoVec;
	begin
		i:= 1;
		
		while (i <= DL) and (v[i].codigo <> cod1) do
		begin
			i:= i+1;
		end;
		
		if (v[i].codigo = cod1) then
			buscarPos1:= i
		else
			buscarPos1:= 0;
	end;
	
	function buscarPos2(v:vector; DL:rangoVec; cod2: rangoCod):rangoVec;
	var
		i:rangoVec;
	begin
		i:= 1;
		
		while (i <= DL) and (v[i].codigo <> cod2) do
		begin
			i:= i+1;
		end;
		
		if (v[i].codigo = cod2) then begin
			buscarPos2:= i;
			writeln('LO ENCONTRE: ', cod2, ' = ',v[i].codigo);
		end
		else
			buscarPos2:= DL;
	end;

var
	i: rangoVec;
	eliminados: rangoVec;
	pos1, pos2: rangoVec;
begin
	pos1:= buscarPos1(v,DL, cod1);
	writeln('LA POSICION 1 ES: ', pos1);
	pos2:=  buscarPos2(v,DL, cod2);
	writeln('LA POSICION 2 ES: ', pos2);
	
	eliminados:= (pos2-pos1-1);
	
	writeln('ELIMINADOS CONTIENE: ', eliminados);
	
	for i:= (pos1+1) to DL do		// uso (pos1+1) porque no quiero eliminar esa venta inclusive
	begin
		v[i]:= v[i + eliminados]; // a v[3] := v[3+la distancia entre los que elimino]
		
	end;
	DL:= DL-eliminados;
end;





function cumple (codigo:rangoCod):boolean;
begin
	cumple:= (codigo mod 2 = 0); // si es par: cumple
end;










procedure generarLista (v:vector; dimL:rangoVec; var L:lista; var total:integer);

	procedure agregarAlFinal (v:venta; var L, ult:lista);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato.codigo:= v.codigo;
		nue^.dato.cantidad:= v.cantidad;
		nue^.sig:= nil;
		
		if (L = nil) then
			L:= nue
		else
			ult^.sig:= nue;
			
		ult:= nue;
	end;
var
	ult:lista;
	i:rangoVec;
begin
	ult:= nil;
	
	for i:= 1 to dimL do
	begin
		if (cumple(v[i].codigo)) then
		begin
			writeln('llegue al momento donde cumple');
			agregarAlFinal(v[i], L, ult);
			total:= total + v[i].cantidad;
		end;
	end;
end;


procedure imprimirLista(L:lista);
begin
	while (L <> nil) do
	begin
		writeln ('[*] CODIGO: ', L^.dato.codigo);
		L:= L^.sig;
	end;
end;




{-------------------MAIN-------------------}
var
	dimL: rangoVec;
	v:vector;
	cod1, cod2: rangoCod;
	l: lista;
	totalVendidos:integer;
	
begin
	dimL:= 0;
	totalVendidos:= 0;
	l:= nil;
	
	writeln('{-------------------CARGA DE INFORMACION-------------------}');
	cargarVector(v, dimL);
	
	if (dimL=0) then // PRIMER VALIDACIÓN: QUE EL VECTOR NO ESTÉ VACÍO
		writeln('VECTOR SIN ELEMETNOS')
			
	else begin
		writeln('{-------------------VECTOR-------------------}');
		imprimirVector(v, dimL);
		
		writeln('{-------------------ORDENAR VECTOR-------------------}');
		ordenarVector(v, dimL);
		imprimirVector(v, dimL);
		
		
		
		writeln('{-------------------ELIMINAR DEL VECTOR-------------------}');
		
		write('[>] Eliminar ventas con codigo DESDE: ');
		readln(cod1);
		write('[>] HASTA: ');
		readln(cod2);
		
		eliminar(v, dimL, cod1, cod2);
		
		if (dimL = 0) then // SEGUNDA VALIDACIÓN: QUE EL VECTOR NO ESTÉ VACÍO LUEGO DE LA ELIMINACIÓN.
			writeln('VECTOR SIN ELEMETNOS LUEGO DE LA ELIMINACION')
			
		else begin
			imprimirVector(v, dimL);
			
			writeln('{-------------------LISTA DE VENTAS CON CODIGO PAR-------------------}');
			generarLista(v, dimL, l, totalVendidos);
			
			if (L=nil) then		// TERCERA VALIDACIÓN: QUE LA LISTA NO ESTÉ VACÍA.
				writeln('LISTA SIN ELEMENTOS')
			else begin
				imprimirLista(l);
				writeln('[*] CANTIDAD TOTAL DE VENTAS: ', totalVendidos);
			end;
		end;
	end;
end.
