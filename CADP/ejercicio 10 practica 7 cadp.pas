program p7e10;
type
	cultivo = record
		tipo: string;
		hectareas: real;
		meses:integer;
	end;
	arrCultivos = array [1..20] of cultivo; 	
	empresas = ^empresa;	
	empresa = record
		codigoEmpresa:integer;
		nombre: string;
		estatal: boolean;
		ciudad: string;
		cultivos: arrCultivos;
		dimL:integer;
		siguiente: empresas;
	end;
procedure armarNodo (var E: empresas; nuevo: empresa; var U: empresas);
var
	N:empresas;
begin
	new (N); N^:=nuevo; N^.siguiente:=nil;
	if (E = nil) then begin
		E:=N;
		U:=N;
	end
	else begin
		U^.siguiente:=N;
		U:=N;
	end;
end;
procedure Lectura (var E: empresas);
var
	nuevo: empresa; aux:string; U:empresas;
begin
	U:=nil;
	readln (nuevo.codigoEmpresa);
	while (nuevo.codigoEmpresa <> -1) do begin
		readln (nuevo.nombre);
		readln (aux);
		nuevo.estatal:= aux = 'estatal';
		readln (nuevo.ciudad);
		nuevo.dimL:=0; readln (aux);
		while (nuevo.dimL < 20) and (aux <> ' ') do begin
			nuevo.dimL:=nuevo.dimL+1;
			nuevo.cultivos[nuevo.dimL].tipo:=aux;
			readln (nuevo.cultivos[nuevo.dimL].hectareas);
			readln (nuevo.cultivos[nuevo.dimL].meses);
			readln (aux);
		end;
		armarNodo (E, nuevo, U);
		readln (nuevo.codigoEmpresa);
	end;
end;
function digCheck (codigoEmpresa: integer): boolean;
var
	aux:integer; contador: integer;
begin
	contador:=0;
	while (codigoEmpresa <> 0) and (contador < 2) do begin
		aux:= codigoEmpresa mod 10;
		if (aux = 0) then
			contador:=contador+1;
		codigoEmpresa:=codigoEmpresa div 10;
	end;
	digCheck:= aux >= 2;
end;
function a (ciudad: string; C: arrCultivos; dimL:integer; codigoEmpresa:integer): boolean;
var
	i: integer; trigo, cero:boolean;
begin
	if (ciudad = 'San Miguel del Monte') then begin
		i:=0; trigo:=false;
		while (i < dimL) and (trigo <> true) do begin
			i:=i+1;
			if (C[i].tipo = 'trigo') then begin
				trigo:=true;
				cero:= digCheck (codigoEmpresa);
			end;
		end;
		a:= (trigo) and (cero);
	end
	else a:=false;
end;
procedure c(C: arrCultivos; dimL:integer; var Hsoja: real; var Hectareas: real);
var
	i:integer;
begin
	for i:= dimL downto 1 do begin
		if (C[i].tipo = 'soja') then
			Hsoja:=Hsoja+C[i].hectareas;
		Hectareas:=Hectareas+C[i].hectareas
	end;
end;
procedure d (nombre: string; dimL:integer; C:arrCultivos; var topMeses: integer; var topEmpresa:string);
var
	i, cantMeses:integer;
begin
	cantMeses:=0;
	for i:= dimL downto 1 do
		if (C[i].tipo = 'trigo') then 
			cantMeses:=cantMeses+C[i].meses;
	if (cantMeses > topMeses) then begin
		topMeses:=cantMeses;
		topEmpresa:=nombre;
	end;
		
end;
procedure Informar (E: empresas);
var
	contadorHSoja, contadorHectareas:real; topMeses:integer; topEmpresa: string;
begin
	topMeses:=-999;
	contadorHSoja:=0; contadorHectareas:=0;
	while (E <> nil) do begin
		if (a (E^.ciudad, E^.cultivos, E^.dimL, E^.codigoEmpresa)) then
			writeln ('La empresa ', E^.nombre,' cumplio con las caracteristicas buscadas');
		c (E^.cultivos, E^.dimL, contadorHSoja, contadorHectareas);
		d (E^.nombre, E^.dimL, E^.cultivos, topMeses, topEmpresa);
		E:=E^.siguiente;
	end;
	writeln ((contadorHSoja/contadorHectareas)*100,'%');
	writeln (topEmpresa);
end;
procedure Actualizar(var E: empresas);
var
	aux:empresas; i: integer;
begin
	aux:=E;
	while (aux <> nil) do begin
		for i:= 1 to aux^.dimL do 
			if (aux^.cultivos[i].tipo = 'girasol') and (aux^.cultivos[i].hectareas < 5) and not (aux^.estatal) then
				aux^.cultivos[i].meses:=aux^.cultivos[i].meses+1;
		aux:=aux^.siguiente;
	end;
end;
var
	E:empresas;
begin
	E:=nil;
	Lectura (E);
	Informar (E);
	Actualizar (E);
end.