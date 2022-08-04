program zapallo;
type
	lista = ^nodo;
	nodo = record 
		siguiente: lista;
		titulo: string;
		nombre: string;
		dni: longint;
		tipo: integer;
	end;
	VECTORCONTADOR = ARRAY [1..12] OF INTEGER;
procedure armarNodo (var L: lista; N: nodo; var U:lista);
var
	nuevo: lista;
begin
	new(nuevo); nuevo^:=N; nuevo^.siguiente:=nil;
	if (L = nil) then begin
		L:=nuevo;
		U:=nuevo;
	end
	else begin
		U^.siguiente:=nuevo;
		U:=nuevo;
	end;
end;
procedure leer (var L: lista);
var
	N:nodo; U:lista;
begin
	readln (N.dni);
	while (N.dni <> 0) do begin
		readln (N.titulo);
		readln (N.nombre);
		readln (N.tipo);
		armarNodo(L, N, U);
		readln (N.dni);
	end;
end;
PROCEDURE SACARTOP (V:VECTORCONTADOR);
VAR
	I, APARICIONES, TIPO:INTEGER;
BEGIN
	APARICIONES:= -1;
	FOR I:= 1 TO 12 DO BEGIN
		IF (V[I] > APARICIONES) THEN BEGIN
			TIPO:=I;
			V[I]:=APARICIONES;
		END;
		WRITELN (APARICIONES);
	END;

	WRITELN (TIPO);
END;
PROCEDURE INFORMAR (L:lista); 
VAR
	V:VECTORCONTADOR; CANTPUBLICACIONES, I:INTEGER; ACTUAL:LONGINT; 
BEGIN
	FOR I := 1 TO 12 DO
		V[I]:=0;
	WHILE (L <> NIL) DO BEGIN
		ACTUAL:=L^.dni;
		CANTPUBLICACIONES:=0;
		WHILE (L <> NIL) AND(ACTUAL = L^.dni) DO BEGIN
			CANTPUBLICACIONES:=CANTPUBLICACIONES+1;
			V[L^.tipo]:=V[L^.tipo]+1;
			L:=L^.siguiente;
		END;
		WRITELN (CANTPUBLICACIONES);
	END;
	SACARTOP (V);
END;
var
	L:lista;
begin
	L:=nil;
	leer (L);
	INFORMAR (L);
end.

