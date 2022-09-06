{3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada venta se lee fecha de venta, 
* código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se lee el código de sucursal 0. Implementar un 
* programa que:
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad total vendida para cada 
* código de producto.}
program tres;
type
	subr1= 1..4;
	venta = record
		codigo:integer;
		sucursal:integer;
		cant:integer;
	end;
	ventaAGuardar = record
		codigo:integer;
		cant:integer;
	end;
	lista=^nodo;
	nodo = record
		dato:ventaAGuardar;
		sig:lista;
	end;
	lista2=^nodo2;
	producto = record
		codigo:integer;
		cant:integer;
	end;
	nodo2 = record
		dato:producto;
		sig:lista2;
	end;
	arrLista = array [subr1] of lista;
procedure a (var aL:arrLista);
var 
	n:venta; nE:ventaAGuardar; i:integer;
	{Rutinas encapsuladas}
	procedure leer(var n:venta);
	begin
		writeln('ingrese codigo de sucursal (1-4)');
		readln (n.sucursal);
		if (n.sucursal <> 0) then begin
			writeln('ingrese codigo de venta');
			readln (n.codigo);
			writeln('ingrese cantidad vendida');
			readln (n.cant);
		end;
	end;
	procedure insertar(var l:lista; n:ventaAGuardar);
	var
		nue, act, ant:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil; act:=l; ant:=l;
		while (act <> nil) and (act^.dato.codigo < nue^.dato.codigo) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act = ant) then L:=nue
		else ant^.sig:=nue;
		nue^.sig:=act;
	end;
begin
	for i:= 1 to 4 do
		aL[i]:=nil;
	leer(n);
	while (n.sucursal <> 0) do begin
		nE.codigo:=n.codigo;
		nE.cant:=n.cant;
		insertar(aL[n.sucursal], nE);
		leer(n);
	end;
end;
procedure b(var aL:arrLista; var l:lista2); {MERGE ACUMULADOR}
var
	u:lista2; actual:producto; min:ventaAGuardar;
	procedure agregarAlFinal(var l:lista2; var u:lista2; n:producto);
	var
		nue:lista2;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		writeln('*debug*dato de nue:',nue^.dato.codigo);
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
	procedure minimo (var al:arrLista; var min:ventaAGuardar);
	var
		posMin, i:integer; 
	begin
		posMin:=-1; min.codigo:=9999;
		for i:= 1 to 4 do //No confundirse en este for, causa errores rarisimos
			if (al[i] <> nil) and (al[i]^.dato.codigo < min.codigo) then begin
				min:=al[i]^.dato;
				posMin:=i;
			end;
		if (posMin <> -1) then
			al[posMin]:=al[posMin]^.sig;			
	end;
begin
	l:=nil;
	minimo(al, min);
	while (min.codigo <> 9999) do begin
		actual.codigo:=min.codigo; actual.cant:=0;
		while (min.codigo <> 9999) and (actual.codigo = min.codigo) do begin
			writeln('Añadiendo ', min.cant);
			actual.cant:=actual.cant+min.cant;
			minimo(al, min);
			writeln('Codigo de min ', min.codigo);
		end;
		agregarAlFinal(l, u, actual);
	end;
end;
var
	aL:arrLista; l, aux:lista2;
begin
	a(aL);
	writeln('b');
	b(aL, l);
	aux:=l;
	while (aux <> nil) do begin
		writeln(aux^.dato.cant);
		aux:=aux^.sig;
	end;
end.
