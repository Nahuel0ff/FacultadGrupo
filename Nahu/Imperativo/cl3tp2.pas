{
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.
}
program ejercicio2;

type
    rangodia = 1..31;
    rangomes = 1..12;
    rangoanio = 1900..2100;
    
    fechaReg = record // Registro Fecha
        dia: rangodia;
        mes: rangomes;
        anio: rangoanio;
    end;
    
    venta = record  // Registro Venta
        cod: integer;
        fecha: fechaReg;
        uni: integer;
    end;

    arbol = ^nodo; // Arbol de ventas i
    nodo = record
        dato: venta;
        HI: arbol;
        HD: arbol;
    end;

    ventaDos = record // Registro ventas ii
        cod: integer;
        total: integer;
    end;
    
    arbolDos = ^nodoDos; // Arbol ventas ii
    nodoDos = record
        dato: ventaDos;
        HI: arbolDos;
        HD: arbolDos;
    end;
    
    listaVentas = ^nodoVenta; //Lista de ventas iii
    nodoVenta = record
        dato: venta;
        sig: listaVentas;
    end;
    
    ventaList = record // Registro de ventas iii
        cod: integer;
        ventas: listaVentas;
        cont: integer;
    end;
    
    arbolTres = ^nodoTres; // Arbol ventas iii
    nodoTres = record
        dato: ventaList;
        HI: arbolTres;
        HD: arbolTres;
    end;

procedure leerfecha(var f: fechaReg);
begin
    writeln('Ingrese el dia de la venta: ');
    readln(f.dia);
    writeln('Ingrese el mes de la venta: ');
    readln(f.mes);
    writeln('Ingrese el anio de la venta: ');
    readln(f.anio);
end;

procedure leerVenta(var v: venta);
begin
    v.cod := random(10);
    writeln('El codigo de venta es: ', v.cod);
    if (v.cod <> 0) then
    begin
        leerfecha(v.fecha);
        writeln('Ingrese las unidades vendidas: ');
        readln(v.uni);
    end;    
end;

procedure agregar(var a: arbol; v: venta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato := v;
        a^.HI := nil;
        a^.HD := nil;
    end
    else if (v.cod < a^.dato.cod) then
        agregar(a^.HI, v)
    else
        agregar(a^.HD, v);
end;

//Cargar Primer Arbol

procedure cargar(var a: arbol);
var
    v: venta;
begin
    leerVenta(v);
    while (v.cod <> 0) do
    begin
        agregar(a, v);
        leerVenta(v);
    end;
end;

procedure agregarDos(var a2: arbolDos; v: venta);
begin
    if (a2 = nil) then
    begin
        new(a2);
        a2^.dato.cod := v.cod;
        a2^.dato.total := v.uni;
        a2^.HI := nil;
        a2^.HD := nil;
    end
    else if (v.cod < a2^.dato.cod) then 
        agregarDos(a2^.HI, v)
    else if (v.cod = a2^.dato.cod) then
        a2^.dato.total := a2^.dato.total + v.uni
    else 
        agregarDos(a2^.HD, v);
end;

// Cargar Segundo Arbol

procedure generarArbolDos(a: arbol; var a2: arbolDos);
begin
    if (a <> nil) then
    begin
        agregarDos(a2, a^.dato);
        generarArbolDos(a^.HI, a2);
        generarArbolDos(a^.HD, a2);    
    end;
end;

procedure agregarAd(var l: listaVentas; v: venta);
var
    nue: listaVentas;
begin
    new(nue);
    nue^.dato := v;
    nue^.sig := l;
    l := nue;
end;

procedure agregarTres(var a3: arbolTres; v: venta);
begin
    if (a3 = nil) then
    begin
        new(a3);
        a3^.dato.cod := v.cod;
        a3^.dato.ventas := nil;
        agregarAd(a3^.dato.ventas, v);
        a3^.dato.cont := 1;
        a3^.HI := nil;
        a3^.HD := nil;        
    end
    else if (v.cod < a3^.dato.cod) then
        agregarTres(a3^.HI, v)
    else if (v.cod = a3^.dato.cod) then
    begin
        agregarAd(a3^.dato.ventas, v);
        a3^.dato.cont := a3^.dato.cont + 1;
    end
    else
        agregarTres(a3^.HD, v);
end;

// Cargar Tercer Arbol

procedure cargarTres(a: arbol; var a3: arbolTres);
begin
    if (a <> nil) then
    begin
        agregarTres(a3, a^.dato);
        cargarTres(a^.HI, a3);
        cargarTres(a^.HD, a3);
    end;    
end;

// Parte B

function totalVendidoPorFecha(a: arbol; f: fechaReg): integer;
begin
    if (a = nil) then
        totalVendidoPorFecha := 0
    else 
    begin
        if (a^.dato.fecha.dia = f.dia) and 
           (a^.dato.fecha.mes = f.mes) and 
           (a^.dato.fecha.anio = f.anio) then
            totalVendidoPorFecha := a^.dato.uni + 
                                    totalVendidoPorFecha(a^.HI, f) + 
                                    totalVendidoPorFecha(a^.HD, f)
        else
            totalVendidoPorFecha := totalVendidoPorFecha(a^.HI, f) + 
                                    totalVendidoPorFecha(a^.HD, f);
    end;
end;


// Parte C

function maxUnidadesVendidas(a2: arbolDos): ventaDos;
var
    izq, der, max: ventaDos;
begin
    if (a2 = nil) then 
    begin
        max.cod := -1;  // Indicador de árbol vacío
        max.total := 0;
        maxUnidadesVendidas := max;
    end
    else 
    begin
        max := a2^.dato;
        izq := maxUnidadesVendidas(a2^.HI);
        der := maxUnidadesVendidas(a2^.HD);
        
        if (izq.total > max.total) then
            max := izq;
        if (der.total > max.total) then
            max := der;

        maxUnidadesVendidas := max;
    end;
end;

function codigoMaxUnidadesVendidas(a2: arbolDos): integer;
var
    maxVenta: ventaDos;
begin
    maxVenta := maxUnidadesVendidas(a2);
    codigoMaxUnidadesVendidas := maxVenta.cod;
end;


//Parte D

function maxCantidadVentas(a3: arbolTres): ventaList;
var
    izq, der, max: ventaList;
begin
    if (a3 = nil) then 
    begin
        max.cod := -1;  // Indicador de árbol vacío
        max.cont := 0;
        maxCantidadVentas := max;
    end
    else 
    begin
        max := a3^.dato;
        izq := maxCantidadVentas(a3^.HI);
        der := maxCantidadVentas(a3^.HD);
        
        if (izq.cont > max.cont) then
            max := izq;
        if (der.cont > max.cont) then
            max := der;

        maxCantidadVentas := max;
    end;
end;

function codigoMaxCantidadVentas(a3: arbolTres): integer;
var
    maxVenta: ventaList;
begin
    maxVenta := maxCantidadVentas(a3);
    codigoMaxCantidadVentas := maxVenta.cod;
end;

// Programa Principal
var
    a: arbol;
    a2: arbolDos;
    a3: arbolTres;
    f: fechaReg;
    totalProductosVendidos: integer;
    maxProdUnidades: integer;
    maxProdVentas: integer;
BEGIN
    a := nil;
    a2 := nil;
    a3 := nil;
    Randomize;
    cargar(a); // A i
    generarArbolDos(a, a2); // A ii
    cargarTres(a, a3); // A iii
    leerfecha(f);
    totalProductosVendidos := totalVendidoPorFecha(a, f); // B
    writeln('Total productos vendidos el ', f.dia, '/', f.mes, '/', f.anio, ': ', totalProductosVendidos);
    maxProdUnidades := codigoMaxUnidadesVendidas(a2); //C
    writeln('Código del producto con más unidades vendidas: ', maxProdUnidades);
    maxProdVentas := codigoMaxCantidadVentas(a3); //D
    writeln('Código del producto con más ventas realizadas: ', maxProdVentas);
END.
