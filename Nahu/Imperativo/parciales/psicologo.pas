{
Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra:
dni, cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado
por sesión. Implemente un programa que:
a) Genere un ABB ordenado por dni. Para ello, genere información hasta el paciente con dni 0.
A partir del ABB, realice módulos (uno por inciso) para:
b) Generar una estructura con los códigos de los pacientes de osde cuyo dni está comprendido
entre dos valores.
c) Aumentar el costo abonado por sesión de todos los pacientes en un monto recibido.
}
program parcial;

const
	
	max = 5;

type
	
	subrang = 1..max;
	
	paciente = record
		dni:integer;
		cod:integer;
		obra:subrang;
		costo:real;
	end;

	arbol = ^nodo;
	
	nodo = record
		dato:paciente;
		HI:arbol;
		HD:arbol;
	end;

	pacienteOsde = record
		dni:integer;
		cod:integer;
		costo:real;
	end;

	
	lista = ^nodoDos;

	nodoDos = record
		dato:pacienteOsde;
		sig:lista;
	end;
	
	procedure leer (var p:paciente);
	begin
		write('Ingresa DNI');
		read(p.dni);
		if (p.dni <> 0) then begin
			write('Ingresa codigo');
			read(p.cod);
			write('Ingresa numero de obra');
			read(p.obra);
			write('Ingresa el monto');
			read(p.costo);
		end;
	end;	

	procedure agregar (var a:arbol; p:paciente);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else if (a^.dato.dni > p.dni) then
			agregar(a^.HI,p)
		else
			agregar(a^.HD,p);
	end;

	procedure cargar (var a:arbol);
	var
		p:paciente;
	begin
		leer(p);
		while (p.dni <> 0) do begin
			agregar(a,p);
			leer(p);
		end;	
	end;
	
	procedure asignar (p:paciente; var po:pacienteOsde);
	begin
		po.cod:=p.cod;
		po.dni:=p.dni;
		po.costo:=p.costo;	
	end;
	
	procedure agregarAd (var l:lista; po:pacienteOsde);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato:=po;
		nue^.sig:=l;
		l:=nue;
	end;
	
	
	procedure comprendidos (a:arbol; par1,par2:integer; var l:lista);
	var
		po:pacienteOsde;
	begin
		if (a <> nil) then begin
			if (a^.dato.obra = 3) AND (a^.dato.dni >= par1) AND (a^.dato.dni <= par2) then begin
				asignar(a^.dato,po);
				agregarAd(l,po);
			end	
			else
				if (a^.dato.dni > par1) then
					comprendidos(a^.HI,par1,par2,l)
				else
					if (a^.dato.dni < par2) then
						comprendidos(a^.HD,par1,par2,l);	
			end;
	end;
	
	procedure aumento (var a:arbol; monto:real);
	begin
		if (a <> nil) then begin
			a^.dato.costo:= a^.dato.costo + monto;
			aumento(a^.HI,monto);			
			aumento(a^.HD,monto);
		end;	
	end;
	
	procedure imprimirLista (l:lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.costo);
			l:=l^.sig;
		end;
	end;

	procedure imprimirArbol (a:arbol);
	begin
		if (a <> nil) then begin
			imprimirArbol(a^.HI);
			writeln(a^.dato.costo);
			imprimirArbol(a^.HD);
		end;
	end;

//Programa Principal
var
	a:arbol;
	par1,par2:integer;
	l:lista;
	monto:real;
BEGIN
	a:=nil;
	l:=nil;
	cargar(a);
	writeln('termino de cargar');
	writeln('-----------------');
	write('Ingresa par1');
	read(par1);
	write('Ingresa par2');
	read(par2);
	comprendidos(a,par1,par2,l);
	writeln('Termino la creacion de lista');
	imprimirLista(l);
	write('Ingrese el monto');
	read(monto);
	aumento(a,monto);
	writeln('termino la actualizacion de precios');
	imprimirArbol(a);
END.

