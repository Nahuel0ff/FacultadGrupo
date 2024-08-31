{
Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
c. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

program ejercicio3;

type
  rangodia = 1..31;
  rangomes = 1..12;
  rangoanio = 1900..2200;

  fechaReg = record
    dia: rangodia;
    mes: rangomes;
    anio: rangoanio;
  end;

  finales = record
    nota: real;
    fecha: fechaReg;
    codmat: integer;
  end;

  listaFinales = ^nodoFinales;

  nodoFinales = record
    dato: finales;
    sig: listaFinales;
  end;

  alumnos = record
    legajo: integer;
    nota: listaFinales;
  end;

  arbol = ^nodo;

  nodo = record
    dato: alumnos;
    HI: arbol;
    HD: arbol;
  end;

procedure leerFecha(var f: fechaReg);
begin
  writeln('Ingresa el día del final rendido: ');
  readln(f.dia);
  writeln('Ingresa el mes del final rendido: ');
  readln(f.mes);     
  writeln('Ingresa el año del final rendido: ');
  readln(f.anio);  
end;

procedure leerFinal(var f: finales);
begin
  writeln('Ingresa la nota del final: ');
  readln(f.nota);
  leerFecha(f.fecha);
  writeln('Ingresa el código de materia: ');
  readln(f.codmat);
end;

procedure agregarAd(var l: listaFinales; f: finales);
var
  nue: listaFinales;
begin
  new(nue);
  nue^.dato := f;
  nue^.sig := l;
  l := nue;
end;

procedure leerAlu(var al: alumnos);
var
  f: finales;
begin
  writeln('Ingrese el número de legajo del alumno: ');
  readln(al.legajo);
  if (al.legajo <> 0) then begin
    al.nota := nil; // Inicializar la lista de finales como vacía
    leerFinal(f);
    agregarAd(al.nota, f); // Agregar el primer final a la lista
  end;
end;

procedure agregar(var a: arbol; al: alumnos);
begin
  if (a = nil) then begin
    new(a);
    a^.dato := al;
    a^.HI := nil;
    a^.HD := nil;
  end
  else if (al.legajo < a^.dato.legajo) then 
    agregar(a^.HI, al)
  else if (al.legajo > a^.dato.legajo) then 
    agregar(a^.HD, al)
  else 
    agregarAd(a^.dato.nota, al.nota^.dato); // Agrega el final a la lista si el legajo ya existe
end;

// Parte A  
procedure cargarArbol(var a: arbol);
var
  al: alumnos;
begin
  repeat
    leerAlu(al);
    if (al.legajo <> 0) then
      agregar(a, al);
  until al.legajo = 0;
end;

function impares(a: arbol): integer;
begin
  if (a = nil) then
    impares := 0
  else if (a^.dato.legajo MOD 2 = 1) then
    impares := 1 + impares(a^.HI) + impares(a^.HD)
  else
    impares := impares(a^.HI) + impares(a^.HD);  
end;

function contarApro(l: listaFinales): integer;
var
  cont: integer;
begin
  cont := 0;
  while (l <> nil) do begin
    if (l^.dato.nota >= 4) then
      cont := cont + 1;
    l := l^.sig;
  end;
  contarApro := cont;
end;

procedure informar(a: arbol);
begin
  if (a <> nil) then begin
    informar(a^.HI);
    writeln('Legajo del alumno: ', a^.dato.legajo);
    writeln('Cantidad de finales aprobados: ', contarApro(a^.dato.nota));
    informar(a^.HD);
  end;
end;

function calcularProm(l: listaFinales): real;
var
  suma: real;
  cant: integer;
begin
  suma := 0.0;
  cant := 0;
  while (l <> nil) do begin
    suma := suma + l^.dato.nota;
    cant := cant + 1;
    l := l^.sig;    
  end;
  if (cant > 0) then
    calcularProm := suma / cant
  else
    calcularProm := 0;
end;

procedure promedioMayor(a: arbol; valor: real);
var
  prom: real;
begin
  if (a <> nil) then begin
    promedioMayor(a^.HI, valor);
    
    prom := calcularProm(a^.dato.nota);
    if (prom > valor) then begin
      writeln('Legajo: ', a^.dato.legajo);
      writeln('Promedio: ', prom:0:2);
    end;
    promedioMayor(a^.HD, valor);
  end;
end;

// Programa Principal
var
  a: arbol;
  cantImp: integer;
  valor: real;
BEGIN
  a := nil;
  cargarArbol(a); // Parte A
  cantImp := impares(a); // Parte B
  writeln('Cantidad de alumnos con legajo impar: ', cantImp);
  informar(a); // Parte C
  writeln('Ingrese un valor de promedio para filtrar: ');
  readln(valor);
  promedioMayor(a, valor); // Parte D
END.
