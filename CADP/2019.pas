program zapallo;
type
	lista = ^nodo;
	nodo = record
		codigoVenta: integer;
		codigoProducto: integer;
		cantidadVendida: integer;
		siguiente: lista;
	end;
procedure insertar (var L: lista; N: nodo);
var
	nuevo, actual, anterior: lista;
begin
	new(nuevo); 
	nuevo^:=N;
	actual:=L; anterior:=L;
	while (actual <> nil) and (nuevo^.codigoProducto < actual^.codigoProducto) do begin
		anterior:=actual;
		actual:=actual^.siguiente;
	end;
	if (actual = anterior) then begin
		L:=nuevo;
	end
	else begin
		anterior^.siguiente:=nuevo;
	end;
	nuevo^.siguiente:=actual;
end;
procedure leerProductos (var L: lista);
var
	N:nodo;
begin
	N.siguiente:=nil;
	readln (N.codigoProducto);
	while (N.codigoProducto <> 9999) do begin
		readln(N.codigoVenta);
		readln (N.cantidadVendida);
		insertar (L, N);
		readln (N.codigoProducto);
	end;
end;
procedure informar (L:lista);
var
	codigoLeido:integer;
begin
	readln (codigoLeido);
	while (L<> nil) and (codigoLeido <> L^.codigoProducto) do begin
		L:=L^.siguiente;
	end;
	writeln (L^.cantidadVendida);
end;
var
	L:lista;
begin
	L:=nil;
	leerProductos(L);
	informar (L);
end.

