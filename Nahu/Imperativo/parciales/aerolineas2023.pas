{
Aerolineas Argentinas necesita procesar los pasajes vendidos durante  2023. De cada pasaje se conoce el codigo de vuelo, codigo
del cliente, codigo de la ciudad destino y monto del pasaje.
a) Implementar un moduo que lea pasajes, genere y retorne una estrucutura adecuada para la busqueda por codigo de ciudad destino,
donde para cada codigo de ciudad destino se almacenan juntos todos los pasajes (cod vuelo,cod cli, monto). La lectura finaliza con
el monto del pasaje 0. Se suguiere utilizar el modulo leerPasaje();.
b) Implementar un modulo que reciba la estructura generada en a) y un codigo de ciudad destino y retorne todos los pasajes hacia
esa ciudad destino.
c) Realizar un modulo que reciba la estructura generada en a) y retorne el codigo de ciudad de destino con mayor cantidad de pasajes
vendidos.
}
program parcial;

type
	
	pasaje = record
		vuelo:integer;
		cliente:integer;
		destino:integer;
		monto:real;
	end;

	pasajeChi = record
		vuelo:integer;
		cliente:integer;
		monto:real;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato:pasajeChi;
		sig:lista;
	end;
	
	pasajeGra = record
		destino:integer;
		list:lista;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato:pasajeGra;
		HI:arbol;
		HD:arbol;
	end;

	procedure leerPasaje (var p:pasaje);
	begin
		p.monto:=random(9999)/(random(10)+1);
		if (p.monto <> 0) then begin
			p.vuelo:=random(7000);
			p.cliente:=random(100)+1;
			p.destino:=random(500)+1;
		end;
	end;
	
	procedure asignar (p:pasaje; var pc:pasajeChi);
	begin
		pc.vuelo:=p.vuelo;
		pc.cliente:=p.cliente;
		pc.monto:=p.monto;
	end;
	
	procedure agregarAd (var l:lista;pc:pasajeChi);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=pc;
		nue^.sig:=l;
		l:=nue;	
	end;
	
	procedure agregar (var a:arbol; p:pasaje);
	var
		pc:pasajeChi;
	begin
		asignar(p,pc);
		if (a=nil) then begin
			new(a);
			a^.dato.destino:=p.destino;
			a^.dato.list:=nil;
			agregarAd(a^.dato.list,pc);
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if (a^.dato.destino = p.destino) then
			agregarAd(a^.dato.list,pc)
		else if	(a^.dato.destino > p.destino) then
			agregar(a^.HI,p)
		else
			agregar(a^.HD,p);	
	end;
	
	procedure cargar (var a:arbol);
	var
		p:pasaje;
	begin
		leerPasaje(p);
		while (p.monto <> 0) do begin
			agregar(a,p);
			leerPasaje(p);
		end;
	end;



	procedure recorrer (lis:lista; var l:lista);
	begin
		while (lis <> nil) do begin
			agregarAd(l,lis^.dato);
			lis:=lis^.sig;
		end;
	end;


	procedure devolver (a:arbol; ciudad:integer; var l:lista);
	begin
		if (a <> nil) then begin
			
			if (a^.dato.destino = ciudad) then
				recorrer(a^.dato.list,l)
			else
				if (a^.dato.destino > ciudad) then
					devolver(a^.HI,ciudad,l)
				else
					devolver(a^.HD,ciudad,l);	
		end;
	end;

	function contar(l:lista):integer;
	var
		cant:integer;
	begin
		cant:=0;
		while (l <> nil) do begin
			cant:=cant+1;
			l:=l^.sig;
		end;
		contar:=cant;
	end;



	function maximos (a:arbol):integer;
	var
		act,maxCant,maxCiudad:integer;
	begin
		if (a=nil) then
			maximos:=-1
		else begin
			maxCiudad:=a^.dato.destino;
			maxCant:=contar(a^.dato.list);
			act:=maximos(a^.HI);
			if(act > maxCant) then begin
				maxCant:=act;
				maxCiudad:=maximos(a^.HI);
			end;
			act := maximos (a^.HD);
			if (act > maxCant) then begin
				maxCant:=act;
				maxCiudad:=maximos(a^.HD);
			end;
			maximos:=maxCiudad;			
		end;
	end;
	
	{ Revisando me di cuenta que con un proceso era mas facil lpm
	
	procedure maximos(a:arbol; var codigo:integer; var cantMax:integer);
	var
		act:integer;
	begin
		if (a<> nil) then begin
			act:=contar(a^.dato.list);
			if(act > cantMax) then begin
				cantMax:=act;
				codigo:=a^.dato.destino;
			end;
			maximos(a^.HI,codigo,cantMax);
			maximos(a^.HD,codigo,cantMax);
		end;
	end;	
	}


//Programa Principal
var
	a:arbol;
	l:lista;
	ciudad:integer;
BEGIN
	a:=nil;
	cargar(a);
	read(ciudad);
	devolver(a,ciudad,l);
	writeln(maximos(a));
END.

