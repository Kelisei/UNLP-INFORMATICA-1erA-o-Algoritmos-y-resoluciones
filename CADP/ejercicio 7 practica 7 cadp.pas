program p7e7;
type
	arregloNotas = array [1..24] of integer;
	lista = ^nodo;
	nodo = record
		dimL:integer;
		notas:arregloNotas;
		numero:integer;
		apellido:string;
		nombres:string;
		email:string;
		anioIngreso:integer;
		anioEgreso:integer;
		siguiente:lista;
	end;
procedure armarNodo (var L:lista; nuevo:nodo);
var
	N:lista;
begin
	new (N); N^:=nuevo; N^.siguiente:=L; L:=N;
end;
procedure lectura (var L:lista);
var
	nuevo: nodo; nota, i, i2, i3: integer; ok: boolean;
begin
	readln (nuevo.numero);
	while (nuevo.numero <> -1) do begin
		nuevo.dimL:=0; i2:=0; ok:=false;
		for i := 1 to 24 do begin
			readln (nota);
			if (nota > 4) then begin
				nuevo.dimL:=nuevo.dimL+1;
				if (nuevo.dimL=1) then
					nuevo.notas[nuevo.dimL]:=nota
				else
				while (i2 > nuevo.diml-1) and (ok = false) do begin
					i2:=i2+1;
					if (nota > nuevo.notas[i2]) then begin
						ok:=true;
						for i3:= nuevo.dimL downto i2 do begin
							nuevo.notas[i3]:=nuevo.notas[i3-1];
							nuevo.notas[i2]:=nota;
						end;
					end;	
				end;		
			end;
		end;
	end;
	readln (nuevo.numero);
	readln (nuevo.apellido);
	readln (nuevo.nombres);
	readln (nuevo.email);
	readln (nuevo.anioIngreso);
	readln (nuevo.anioEgreso);
	armarNodo (L, nuevo);
end;
function sacarPromedio (notas:arregloNotas; dimL:integer): real;
var
	aux:real; i:integer;
begin
	aux:=0;
	for i:= 1 to dimL do
		aux:=aux+notas[i];
	sacarPromedio:= aux/dimL;
end;
function soloImpares (numero: integer): boolean;
var
	aux: integer; ok:boolean;
begin
	ok:=true;
	while (numero <> 0) and (ok <> true) do begin
		aux:= numero mod 10;
		if (aux <> 1) or (aux <> 3) or (aux <> 5) or (aux <> 7) or (aux <> 9) then
			ok:=false;
		numero:= numero div 10;
	end;
	soloImpares:= ok;
end;
procedure topRecibidos (anioIngreso: integer; anioEgreso:integer; apellido: string; nombres: string; email:string; var topTiempo1:integer; var topTiempo2:integer; var topNombres1:string; var topNombres2:string; var topApellidos1:string; var topApellidos2:string; var topEmail1:string; var topEmail2:string);
var
	Tiempo: integer;
begin
	Tiempo:=anioEgreso-anioIngreso;
	if (Tiempo > topTiempo1) then begin
		topTiempo2:=topTiempo1;
		topNombres2:=topNombres1;
		topApellidos2:=topApellidos1;
		topEmail2:=topEmail1;
		topTiempo1:=Tiempo;
		topNombres1:=nombres;
		topApellidos1:=apellido;
		topEmail1:=email;
	end
	else if (Tiempo > topTiempo2) then begin
		topTiempo2:=Tiempo;
		topNombres2:=nombres;
		topApellidos2:=apellido;
		topEmail2:=email;	
	end;
end;
procedure eliminacion (var L:lista; numero:integer; ok:boolean);
var
	anterior, actual: lista;
begin
	anterior:=L; actual:=L;
	while (actual <> nil) and (actual^.numero <> numero) do begin
		ok:=actual^.numero = numero;
		anterior:=actual;
		actual:=actual^.siguiente;
	end;
	if (actual = anterior) then begin
		L:=L^.siguiente;
		dispose (actual);
	end
	else begin
		anterior^.siguiente:=actual^.siguiente;
		dispose (actual);
	end;
end;
var
	ok:boolean; L, aux:lista; promedio:real; cant, numero:integer; topNombre1, topNombre2, topApellido1, topApellido2, topEmail1, topEmail2: string; topTiempo1, topTiempo2:integer;
begin
	lectura (L);
	aux:=L; 
	cant:=0;
	topTiempo1:=-999; topTiempo2:=-999;
	while (aux <> nil) do begin
		promedio:= sacarPromedio (aux^.notas, aux^.dimL);
		writeln (promedio);
		if (aux^.anioIngreso = 2012) then 
			if (soloImpares (aux^.numero)) then
				cant:=cant+1;
		topRecibidos (aux^.anioIngreso, aux^.anioEgreso, aux^.apellido, aux^.nombres, aux^.email, topTiempo1, topTiempo2, topNombre1, topNombre2, topApellido1, topApellido2, topEmail1, topEmail2);
	end;
	writeln (cant);
	writeln (topNombre1,' ', topApellido1,' ', topEmail1,' ', topNombre2,' ', topApellido2,' ', topEmail2);
	readln (numero);
	eliminacion (L, numero, ok);
end.