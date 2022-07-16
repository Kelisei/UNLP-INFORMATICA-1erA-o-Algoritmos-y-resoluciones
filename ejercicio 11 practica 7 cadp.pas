program p7e11;
type
	evento = record
		nombreEvento:string;
		tipo: integer;
		lugar: string;
		cantMaxPersonas:integer;
		costoEntrada: real;
	end;
	arrEventos = array [1..100] of evento;
	ventas = ^venta;
	venta = record
		codigoVenta: integer;
		numeroEvento: integer; //1 al 100;
		dni: integer;
		cantCompradas: integer;
		siguiente: ventas;
	end;

//Procedure ArmarEventos (); se dispone
procedure ArmarNodo (var V:ventas; nuevo: venta);
var
	N, anterior, actual:ventas;
begin
	new (N); N^:=nuevo; N^.siguiente:=nil; anterior := V; actual:= V;
	while (actual <> nil) and (N^.numeroEvento < actual^.numeroEvento) do begin
		anterior:=actual;
		actual:=actual^.siguiente;
	end;
	if (actual = anterior) then begin
		V:=N;
	end
	else begin
		anterior^.siguiente:=N;
		N^.siguiente:=actual;
	end;
end;
procedure ArmarLista (var V:ventas);
var
	nuevo:venta;
begin
	readln (nuevo.codigoVenta);
	while (nuevo.codigoVenta <> -1) do begin
		readln (nuevo.numeroEvento);
		readln(nuevo.dni);
		readln (nuevo.cantCompradas);
		armarNodo (V, nuevo);
		readln (nuevo.codigoVenta);
	end;
end;
procedure a (totalVentas:real; numeroEvento: integer; var TopVentas: real; var TopVentas2: real; var TopEvento:integer; var TopEVento2:integer);
begin
	if (totalVentas < TopVentas) then begin
		topVentas2:=topVentas;
		topEvento2:=topEvento;
		topVentas:= totalVentas;
		topEvento:= numeroEvento;
	end
	else if (totalVentas < TopVentas2) then begin
		topVentas2:=totalVentas;
		topEvento2:=numeroEvento;
	end;
end;
function digCheck (dni: integer): boolean;
var
	aux:integer; pares, impares: integer;
begin
	pares:=0; impares:=0;
	while (dni <> 0) do begin
		aux:= dni mod 10;
		if (aux = 0) then
			pares:=pares+1
		else
			impares:=impares+1;
		dni:=dni div 10;
	end;
	digCheck:= pares> impares;
end;
procedure Informar (V: ventas; E: arrEventos);
var
	aux, cantEntradas:integer ; totalVentas: real; topVentas, topVentas2: real; topEvento, topEvento2: integer; cantEvento50:integer;
begin
	topVentas:=999; topVentas2:=999; cantEntradas:=0; cantEvento50:=0;
	while (V <> nil) do begin
		aux:=V^.numeroEvento;	totalVentas:=0; 
		while (aux = V^.numeroEvento) do begin
			totalVentas:= totalVentas+V^.cantCompradas;
			if (digCheck(V^.dni)) and (E[V^.numeroEvento].tipo = 3) then
				cantEntradas:=V^.cantCompradas;
			if (V^.numeroEvento = 50) then
				cantEvento50:= cantEvento50+V^.cantCompradas;
			V:=V^.siguiente;
		end;
			totalVentas:=totalVentas*E[aux].costoEntrada;
			a (totalVentas, aux, topVentas, topVentas2, topEvento, topEvento2);
	end;
	writeln (E[topEvento].nombreEvento,' ', E[topEvento].nombreEvento);
	writeln (cantEntradas);
	if (cantEvento50 = E[50].cantMaxPersonas) then
		writeln ('Se vendio el maximo');
end;
var
	E:arrEventos; V:ventas;
begin
	V:=nil;
	//ArmarEventos(E); se dispone
	ArmarLista (V);
	Informar (V, E);
end.