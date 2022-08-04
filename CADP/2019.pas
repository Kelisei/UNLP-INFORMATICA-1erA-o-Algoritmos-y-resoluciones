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
procedure informaryEncontrar (L:lista; var encontrado:boolean);
var
	codigoLeido:integer;
begin
	readln (codigoLeido);
	while (L<> nil) and (codigoLeido > L^.codigoProducto) do begin
		L:=L^.siguiente;
	end;
	If (L <> nil) and (L^.codigoProducto = codigoLeido) then begin
		writeln(L^.cantidadVendida);
		encontrado:=true
	end
	else
		encontrado:=false;
end;
var
	L:lista; encontrado:boolean;
begin
	L:=nil;
	leerProductos(L);
	informaryEncontrar(L,encontrado);
end.

