{
Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido interesa conocer DNI del cliente, nombre
fecha y monto a abonar por el pedido.

	1- Lea la informacion de los pedidos telefonicos hasta ingresar uno con monto 0. A partir de esto, genere una estructura
	que almacene para cada DNI de cliente, su nombre, y una lista con informacion de la fehca y monto de los pedidos realizados.
	La estructura debe estar ordenada por DNI y ser eficiente para la busqueda por dicho criterio.

A partir de la estructura generada en 1) realice modulos independientes para:

	2- Informar la cantidad de clientes que realizaron pedidos en una fecha que se lee de teclado
	
	3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide con uno ingresado.

La informacion se ingresa sin orden alguno
}
program pizzeria;


type
	
	diasub = 1..31;
	messub = 1..12;
	aniosub = 1900..2200;



	fechaReg = record
		dia:diasub;
		mes:messub;
		anio:aniosub;
	end;
	
	pedido = record
		dni:integer;
		nom:string[15];
		fecha:fechaReg;
		monto:real;
	end;
	
	pedidoChi = record
		monto:real;
		fecha:fechaReg;
	end;
	
	lista = ^nodolist;
	
	nodolist = record
		dato:pedidoChi;
		sig:lista;
	end;
	
	pedidoGran = record
		dni:integer;
		nom:string[15];
		list:lista;
	end;

	arbol = ^nodo;
	
	nodo = record
		dato:pedidoGran;
		HI:arbol;
		HD:arbol;
	end;


	procedure leerFecha (var fr:fechaReg);
	begin
		writeln('Dia');
		readln(fr.dia);
		writeln('Mes');
		readln(fr.mes);
		writeln('Anio');
		readln(fr.anio);
	end;

	procedure leerPedido (var p:pedido);
	begin
		writeln('Monto');
		readln(p.monto);
		if (p.monto <> 0) then begin
			writeln('DNI');
			readln(p.dni);
			writeln('Nombre');
			readln(p.nom);
			leerFecha(p.fecha);
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

	procedure traducir (p:pedido;var pc:pedidoChi);
	begin
		pc.monto:=p.monto;
		pc.fecha:=p.fecha;	
	end;
	
	procedure agregar (var a:arbol; p:pedido);
	var
		pc:pedidoChi;
	begin
		traducir(p,pc);
		if (a=nil) then begin
			new(a);
			a^.dato.nom:=p.nom;
			a^.dato.dni:=p.dni;
			a^.dato.list:=nil;
			agregarAd(a^.dato.list,pc);
			a^.HD:=nil;
			a^.HI:=nil;
		end
		else if (a^.dato.dni = p.dni) then
			agregarAd(a^.dato.list,pc)		
		else if (a^.dato.dni > p.dni) then
			agregar(a^.HI,p)
		else
			agregar(a^.HD,p)
	end;
	
	procedure cargar (var a:arbol);
	var
		p:pedido;
	begin
		leerPedido(p);
		while (p.monto <> 0) do begin
			agregar(a,p);
			leerPedido(p);
		end;
	end;
	
	
	function coincidencia (l:lista;fech:fechaReg):boolean;
	begin
		if (l^.dato.fecha.dia = fech.dia) AND (l^.dato.fecha.mes = fech.mes) AND (l^.dato.fecha.anio = fech.anio) then
			coincidencia:=true
		else
			coincidencia:=false;
	end;
	
	function contar (l:lista; fech:fechaReg):integer;
	begin
		if (l=nil) then
			contar:=0
		else
			if (coincidencia(l,fech) = true) then
				contar:= 1 + contar(l^.sig,fech)
			else
				if (coincidencia(l,fech) = false) then
					contar:= contar(l^.sig,fech);
	end;

	procedure recorrer (a:arbol; fech:fechaReg; var cont:integer);
	var
		aux:integer;
	begin
		if (a <> nil) then begin 
			aux:=contar(a^.dato.list,fech);
			cont:=cont + aux;
			recorrer(a^.HI,fech,cont);
			recorrer(a^.HD,fech,cont);
		end;
	end;

	function recorrer2 (l:lista):real;
	var
		suma:real;
	begin
		suma:=0.0;
		while (l <> nil) do begin
		suma:=suma + l^.dato.monto;
		l:=l^.sig;
		end;
		recorrer2:=suma;
	end;


	function totalMonto (a:arbol; dni:integer):real; //Devuelve solo el monto, no la cantidad total
	var
		suma:real;
	begin
		if (a = nil) then
			totalMonto:=0
		else
			if (a^.dato.dni = dni) then begin
				suma:=recorrer2(a^.dato.list);
				totalMonto:= suma;
			end
			else if (a^.dato.dni > dni) then
				totalMonto:= totalMonto(a^.HI,dni)
			else
				totalMonto:= totalMonto(a^.HD,dni);	
	end;

//Programa Principal
var
	a:arbol;
	cont,dni:integer;
	fech:fechaReg;
BEGIN
	a:=nil;
	cont:=0;
	cargar(a);
	leerFecha(fech);
	recorrer(a,fech,cont);
	writeln('La cantidad de coincidencias con la fecha dada es de ',cont);
	read(dni);
	writeln('El total recaudado con el dni dado es de: ',totalMonto(a,dni));
END.

