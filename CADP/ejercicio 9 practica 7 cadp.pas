program p7e9;
type
	peliculas = ^nodoPelis;
	nodoPelis = record
		codigo:integer;
		titulo:string;
		genero:integer; //de 1 a 8
		puntajePromedio:real;
		siguiente:peliculas;
	end;
	criticos = ^nodoCriticos;
	nodoCriticos = record
		dni:integer;
		apellido:string;
		nombre:string;
		codigoPelicula:integer;
		puntaje:real;
		siguiente:criticos;
	end;
	arrCriticas = array [1..8] of real;
procedure armarNodo (var C:criticos; var U:criticos; nuevo:nodoCriticos);
var
	N:criticos; 
begin
	new (N); N^:=nuevo; N^.siguiente:=nil;
	if (C = nil) then begin
		C:=N;
		U:=N;
	end
	else begin
		U^.siguiente:=N;
		U:=N;
	end;
end;
procedure leerCriticos (var C:criticos);
var
	nuevo:nodoCriticos; U:criticos;
begin
	readln (nuevo.codigoPelicula);
	while (nuevo.codigoPelicula <> -1) do begin
		readln (nuevo.dni);
		readln (nuevo.apellido);
		readln (nuevo.nombre);
		readln (nuevo.puntaje);
		armarNodo (C, U, nuevo);
		readln (nuevo.codigoPelicula);
	end;
end;
procedure actualizar (P: peliculas; totalRating:real; codigo: integer);
begin
	while (P <> nil) and (P^.codigo <> codigo) do
		P:=P^.siguiente;
	P^.puntajePromedio:=totalRating;
end;
procedure encontrarGenero (P: peliculas; codigo: integer; var genero:integer);
begin
	while (P <> nil) and (P^.codigo <> codigo) do
		P:=P^.siguiente;
	genero:=P^.genero;
end;
procedure cereador (var aC: arrCriticas);
var
	i:integer;
begin
	for i:= 1 to 8 do
		aC[i]:=0;
end;
procedure imprimirTop (aC: arrCriticas); 
var
	i:integer; topGenero: integer; topPuntaje: real;
begin
	topPuntaje:=-999;
	for i:= 1 to 8 do begin
		if (aC[i] > topPuntaje) then
			topPuntaje:=aC[i];
			topGenero:=i;
	end;
	writeln (topGenero); //informa el genero con mas criticas
end;
function digCheck (dni:integer): boolean;
var
	pares, impares, aux: integer;
begin 
	pares:=0; impares:=0;
	while (dni <> 0) do begin
		aux:= dni mod 10; 
		if (aux mod 2 = 0) then
			pares:=pares+1
		else
			impares:=impares+1;
		dni:=dni div 10;
	end;
	digCheck:= pares = impares;
end;
procedure Informar (var C:criticos; var P:peliculas);
var
	aux: criticos; codigoAux:integer; totalRating:real; cantidadCriticas, codigoGenero:integer; aC: arrCriticas;
begin
	aux:= C; cereador (aC);
	while ( aux <> nil) do begin
		codigoAux:=aux^.codigoPelicula;
		cantidadCriticas:=0; totalRating:=0;
		while (codigoAux = aux^.codigoPelicula) do begin
			cantidadCriticas:=cantidadCriticas+1;
			totalRating:=totalRating+aux^.puntaje;
			encontrarGenero (P, aux^.codigoPelicula, codigoGenero);
			aC[codigoGenero]:=aC[codigoGenero]+aux^.puntaje;
			aux:=aux^.siguiente;
			if (digCheck(aux^.dni)) then begin //informamos los nombres de los dnis que cumplen con esa condicion de mierda
				writeln (aux^.nombre); writeln (aux^.apellido);
			end;
		end;
		totalRating:=totalRating/cantidadCriticas;
		actualizar (P, totalRating, codigoAux); //actualiza la pelicula con el nuevo promedio de puntaje
	end;
	imprimirTop (aC);
end;
procedure Eliminacion (var P: peliculas; codigo: integer; var ok: boolean);
var
	anterior, actual: peliculas;
begin
	anterior:=P; actual:=P;
	while (actual <> nil) and (actual^.codigo <> codigo) do begin
		ok:= actual^.codigo = codigo;
		anterior:=actual;
		actual:=actual^.siguiente
	end;
	if (actual = anterior) then begin
		P:=P^.siguiente;
		dispose (actual);
	end
	else begin
		anterior^.siguiente:=actual^.siguiente;
		dispose (actual);
	end;
	if (ok) then
		writeln ('se elimino correctamente')
	else
		writeln ('malio sal');
end;
//procedure armarListaPeliculas (); ya dispuesto
//leerPeliculas (); ya dispuesto
var
	P:peliculas; C:criticos; codigo:integer; ok:boolean;
begin
	P:=nil; C:=nil;
	//armarListaPeliculas(P);
	leerCriticos (C);
	Informar (C, P);
	readln (codigo);
	Eliminacion (P, codigo, ok);
end.