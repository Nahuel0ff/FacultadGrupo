{Escribir un programa que:
a. Implemente un módulo que almacene información de socios de un club en un árbol binario
de búsqueda. De cada socio se debe almacenar número de socio, nombre y edad. La carga
finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio. La
información de cada socio debe generarse aleatoriamente.

b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro e:

i. Informar los datos de los socios en orden creciente.

ii. Informar los datos de los socios en orden decreciente.

iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.

iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
que se les aumentó la edad.

v. Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.

vi. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.

vii. Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
retorne el promedio de las edades de los socios.}

program P1E2;

const
	DF = 10;
	
type

////////////////////////////////

	socio = record
		numero: integer;
		nombre:string;
		edad:integer;
	end;
	
////////////////////////////////

	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;
	
////////////////////////////////
	
	vecNombres = array [1..DF] of string;

{--------------------------------MODULOS--------------------------------}


procedure inicializarVecNombres(var v:vecNombres);
begin
	v[1]:= 'julia';
	v[2]:= 'alberto';
	v[3]:= 'maria';
	v[4]:= 'nicolas';
	v[5]:= 'cesar';
	v[6]:= 'juan';
	v[7]:= 'berta';
	v[8]:= 'pepe';
	v[9]:= 'dario';
	v[10]:= 'miriam';
end;


//////////////////////////////// 

procedure leerSocio (var soc:socio; v:vecNombres);
begin
	write('[*] Numero: ');
	soc.numero := random (51);
	writeln(soc.numero);
	
	if (soc.numero <> 0) then
	begin
		write('[*] Nombre: ');
		soc.nombre := v[random(DF)+1];
		
		write('[*] Edad: ');
		soc.edad := random(100)+1;
		writeln();
	end;
end;


//////////////////////////////// 


procedure agregar (var a:arbol; soc:socio);
begin
	if (a = nil) then
	begin
		new(a);
		a^.dato:= soc;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	
	else
	if (soc.numero <= a^.dato.numero) then
		agregar(a^.HI, soc)
	else
		agregar(a^.HD, soc);
		
end;

////////////////////////////////


procedure almacenarDatos (var a:arbol; v:vecNombres);
var
	soc:socio;
begin
	leerSocio(soc, v);
	while (soc.numero <> 0) and (soc.nombre <> 'pepe') do
	begin
		agregar(a, soc);
		leerSocio(soc,v);
	end;
end;


//////////////////////////////// (b.i)


procedure imprimirArbol_MenorAMayor (a:arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol_MenorAMayor(a^.HI);
	
		writeln();
		writeln('Numero:', a^.dato.numero);
		writeln('Nombre:', a^.dato.nombre);
		writeln('Edad:', a^.dato.edad);
		writeln();
		
		imprimirArbol_MenorAMayor(a^.HD);
	end;
end;


//////////////////////////////// (b.ii)


procedure imprimirArbol_MayorAMenor (a:arbol);
begin
	if (a <> nil) then
	begin
		imprimirArbol_MayorAMenor(a^.HD);
	
		writeln();
		writeln('Numero:', a^.dato.numero);
		writeln('Nombre:', a^.dato.nombre);
		writeln('Edad:', a^.dato.edad);
		writeln();
		
		imprimirArbol_MayorAMenor(a^.HI);
	end;
end;


//////////////////////////////// (b.iii)

function buscarMayor(a: arbol; max:integer): integer;
begin
	if (a <> nil) then
	begin
		if (a^.dato.edad > max) then
		begin
			max:= a^.dato.edad;
		end;
		max:= buscarMayor(a^.HD, max);
		max:= buscarMayor(a^.HI, max);
	end;
	buscarMayor:= max;
end;

//////////////////////////////// (b.iv)


function cumple (edad:integer):boolean;
begin
	cumple:= (edad mod 2 <> 0);
end;


////////////////////////////////


procedure aumentarEdad (a:arbol; var cant:integer);
begin
	if (a <> nil) then
	begin
		if (cumple(a^.dato.edad)) then
		begin
			a^.dato.edad := a^.dato.edad + 1;
			cant:= cant+1;
		end;
		aumentarEdad(a^.HI, cant);
		aumentarEdad(a^.HD, cant);
	end;
end;


//////////////////////////////// (b.v)


function verificarSocio (a:arbol; socio:string):boolean;
begin

	if (a = nil) then
		verificarSocio:= false
		
	else if (a^.dato.nombre = socio) then
		verificarSocio:= true
	
	else
		verificarSocio := verificarSocio(a^.HI, socio) or verificarSocio(a^.HD, socio);

end;


//////////////////////////////// (b.vi)


procedure informarSocios (a:arbol; var cantSocios:integer);
begin
	if (a <> nil) then
	begin
		cantSocios:= cantSocios+1;
		informarSocios(a^.HI, cantSocios);
		informarSocios(a^.HD, cantSocios);
	end;
end;


//////////////////////////////// (b.vii)
	
		
function promedioEdad (a:arbol; cantSocios:integer):real;

	function sumarEdades (a:arbol): integer;
	begin
		if (a = nil) then
			sumarEdades := 0
		else
			sumarEdades := a^.dato.edad + sumarEdades(a^.HI) + sumarEdades(a^.HD);
	end;
	
var
	totalEdades: integer;
begin
	totalEdades := sumarEdades(a);
	
	if (cantSocios <> 0) then
		promedioEdad := (totalEdades / cantSocios)
	else
		promedioEdad := 0;
end;


{--------------------------------MAIN--------------------------------}

var
	a:arbol; 
	ok:integer;
	max:integer;
	nombreSocio: string;
	existe: boolean;
	cant, cantSocios: integer;
	prom: real;
	v:vecNombres;
begin
	max:=0;
	cant:= 0;
	cantSocios:=0;
	
	a:= nil;
	randomize;
	
	inicializarVecNombres(v);
	almacenarDatos(a, v);
	
	writeln('------------ MAYOR A MENOR ------------');
	imprimirArbol_MayorAMenor(a);
	
	writeln('------------ MENOR A MAYOR ------------');
	imprimirArbol_MenorAMayor(a);
	
	writeln('------------ SOCIO CON LA MAYOR EDAD ------------');
	ok:= buscarMayor(a, max);
	writeln(ok);
	
	writeln('------------ EDADES IMPARES AUMENTADAS EN 1 ------------');
	aumentarEdad(a, cant);
	imprimirArbol_MenorAMayor(a);
	writeln('[*] Cantidad de edades aumentadas: ', cant);
	
	writeln('------------ VERIFICAR SI SOCIO EXISTE ------------');
	write('Ingrese el nombre de un socio para buscarlo en el arbol: ');
	readln(nombreSocio);
	existe:= verificarSocio(a, nombreSocio);
	writeln(existe);
	
	writeln('------------ INFORMAR CANTIDAD DE SOCIOS ------------');
	informarSocios(a, cantSocios);
	writeln('[*] Hay ',cantSocios,' socios.');
	
	writeln('------------ PROMEDIO DE LA EDAD DE LOS SOCIOS ------------');
	prom:= promedioEdad(a, cantSocios);
	writeln(prom:0:2);
	
end.

