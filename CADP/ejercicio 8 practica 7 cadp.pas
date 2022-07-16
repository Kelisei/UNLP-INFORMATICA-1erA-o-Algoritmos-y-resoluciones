program p7e8;
type
	tipos = array [1..7] of integer;
	lista = ^nodo;
	momento = record
		dia: integer;
		mes: integer;
	end;
	nodo = record
		numeroOrigen:integer;
		dniOrigen:integer;
		numeroDestino:integer;
		dniDestino:integer;
		fecha: momento;
		hora: real;
		monto: real;
		codigoMotivo:integer;
		siguiente:lista;
	end;
procedure armarNodo (var L:lista; nuevo: nodo);
var
	anterior, actual, N: lista;
begin
	anterior:=L; actual:=L; new (N); N^:=nuevo;
	while (actual <> nil) and (actual^.numeroOrigen <N^.numeroOrigen) do begin
		anterior:= actual;
		actual:=actual^.siguiente;
	end;
	if (actual = anterior) then begin
		N:=L^.siguiente;
		L:=L;
	end
	else begin
		N^.siguiente:=actual;
		anterior^.siguiente:=N;
	end;
end;
	
procedure extraccionTerceros (ListaMeses:lista; var L:lista);
var
	recorridor: lista; nuevo:nodo;
begin
	recorridor:=ListaMeses;
	while (recorridor <> nil) do begin
		if (recorridor^.dniOrigen <> recorridor^.dniDestino) then begin
			nuevo:=recorridor^;
			armarNodo (L, nuevo);
		end;
		recorridor:=recorridor^.siguiente;
	end;
end;
procedure topCode (cantidades: tipos; topCodigo: integer; topCant:integer);
var
	i:integer;
begin
	for i:= 1 to 7 do begin
		if (cantidades[i] > topCant) then begin
			topCodigo:=i;
			topCant:=cantidades[i];
		end;
	end;
end;
function checkDig (numeroDestino:integer): boolean;
var
	aux:integer; impares, pares:integer;
begin
	impares:=0; pares:=0;
	while (numeroDestino <> 0) do begin
		aux:=numeroDestino mod 10;
		if (aux = 1) or (aux = 3) or (aux = 5) or (aux = 7) or (aux = 9) then
			impares:=impares+1
		else
			pares:=pares+1;
		numeroDestino:=numeroDestino div 10;
	end;
	checkDig:= pares < impares;
end;
var
	cantMes12:integer; ListaMeses, L, aux2: lista; aux, topCodigo, topCant, i:integer; cantMonto:real; cantidades:tipos;
begin
	//setup (ListaMeses); se dispone
	extraccionTerceros(ListaMeses, L);
	aux2:=L; cantMes12:=0;
	topCant:=-999; topCodigo:=0;
	for i:= 1 to 7 do
		cantidades[i]:=0;
	while (aux2 <> nil) do begin
		aux:=aux2^.numeroOrigen;
		cantMonto:=0;
		while (aux = aux2^.numeroOrigen) do begin
			cantMonto:=cantMonto+aux2^.monto;
			cantidades[aux2^.codigoMotivo]:=cantidades[aux2^.codigoMotivo]+1;
			if (aux2^.fecha.mes = 12) and (checkDig(aux2^.numeroDestino)) then
				cantMes12:=cantMes12+1;
			aux2:=aux2^.siguiente;
		end;
		writeln (cantMonto);
		aux2:=aux2^.siguiente;
	end;
	topCode (cantidades, topCodigo, topCant);
	writeln (topCodigo);
	writeln (cantMes12);
end.