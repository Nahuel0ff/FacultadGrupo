{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random”
mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
* 
b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del
vector.
* 
c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
* 
d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores
pares contenidos en el vector.

e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del
vector.

f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si
dicho valor se encuentra en el vector o falso en caso contrario.

g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en
el vector, sus dígitos en el orden en que aparecen en el número. Debe implementarse un
módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se
debe imprimir 1 4 2.
}

program P2E1;

const
	DF = 15;
	
type
	rangoNum = 10..155;
	rangoVec = 0..DF;
	vector = array [1..DF] of integer;
	



procedure cargarVectorRecursivo(var v:vector; var DL:rangoVec);
var
	numero:rangoNum;
begin
	
	numero := random(156-11)+10;
	if (numero <> 20) and (DL<DF) then
	begin
		DL:= DL+1;
		v[DL]:= numero;
		cargarVectorRecursivo(v, DL);
	end;
end;



procedure imprimirVector(v:vector; DL:rangoVec);
var
	i:rangoVec;
begin
	for i:= 1 to DL do
	begin
		writeln(v[i]);
	end;
end;




procedure imprimirRecursivo (v:vector; DL:rangoVec; pos:rangoVec);

begin
	if (pos <= DL) then
	begin
		writeln(v[pos]);
		imprimirRecursivo(v, DL, pos+1);
	end;
end;


function sumarPares (v:vector; DL:rangoVec; pos:rangoVec):integer;
begin
	if (pos > DL) then
		sumarPares := 0 
	else if (pos <= DL) then
	begin
		if (v[pos] mod 2 = 0) then
			sumarPares:= sumarPares(v, DL, pos+1)+v[pos]
		else
			sumarPares:= sumarPares(v, DL, pos+1);
	end;
	
end;

procedure calcularMaximo (v:vector; var maximo:integer; DL, pos:rangoVec);
begin	
	if (pos < DL) then
	begin
		if (v[pos]> maximo) then
			maximo:= v[pos];
		calcularMaximo(v, maximo, DL, pos+1);
	end;
end;


function buscarRecursivo (v:vector; DL, pos:rangoVec; valor:integer):boolean;
begin
	if (pos > DL) then
		buscarRecursivo:= false
		
	else begin
		if (v[pos] = valor) then
			buscarRecursivo:= true
		else
			buscarRecursivo:= buscarRecursivo(v, DL, pos+1, valor);
	end
end;





procedure descomponerRecursivo(v: vector; DL, pos: rangoVec);

	procedure descomponerNumero(num: integer);
	begin
	  if (num <> 0) then
	  begin
		descomponerNumero(num div 10);
		writeln();  
		write(num mod 10);            //se imprime el dígito
	  end;
	end;
	
begin
  if pos <= DL then
  begin
    descomponerNumero(v[pos]);
    writeln();
    descomponerRecursivo(v, DL, pos + 1);
  end;
end;



var
	v:vector;
	DL: rangoVec;
	pos: rangoVec;
	suma: integer;
	maximo:integer;
	valor:integer;
	res:boolean;
begin
	DL:= 0;
	pos:= 1;
	maximo:= -1;
	randomize;
	
	cargarVectorRecursivo(v, DL);
	imprimirVector(v, DL);
	
	
	writeln('------VECTOR RECURSIVO------');
	imprimirRecursivo(v, DL, pos);
	
	
	
	
	writeln('------SUMA RECURSIVA------');
	pos:= 1;
	suma:= sumarPares(v, DL, pos);
	writeln(suma);
	
	
	
	
	writeln('------CALCULAR MAXIMO RECURSIVO------');
	pos:= 1;
	calcularMaximo(v, maximo, DL, pos);
	writeln(maximo);
	
	writeln('------BUSCAR RECURSIVO------');
	pos:= 1;
	write('Ingrese un valor para buscar en el vector: ');
	readln(valor);
	res:= buscarRecursivo(v, DL, pos, valor);
	writeln(res);
	writeln('------DESCOMPONER NUMERO E IMPRIMIR RECURSIVO------');
	pos:= 1;
	
	descomponerRecursivo(v, DL, pos);
	
end.
















