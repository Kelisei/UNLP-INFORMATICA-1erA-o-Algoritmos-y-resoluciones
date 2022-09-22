{3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
* y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}
program tre;
type
  short = 1..8;
  peli = record
    codigo: integer;
    genero: short;
    puntaje: real;
  end;
  listap = ^nodo;
  nodo = record
    dato: peli;
    sig: listap;
  end;
  vListas = array [short] of listap;
  vector = array [short] of peli; {guardar puntaje!}
procedure leer {a}(var d: peli);
  begin
	writeln ('codigo');
    read (d.codigo);
    if  (d.codigo <> -1) then
      begin
		writeln ('genero');
        read (d.genero);
        writeln ('puntaje');
        read (d.puntaje);
      end;
  end;
procedure agregarA {a} (var l: listap; var u:listap; d: peli);
  var
    nuevo: listap;
  begin
    new (nuevo);
    nuevo^.dato:= d;
    nuevo^.sig:=nil;
    if (l = nil) then
		l:=nuevo
	else
		u^.sig:=nuevo;
	u:=nuevo;
  end;
procedure armar {a} (var vL: vListas);
  var
    data: peli; vU:vListas;
  begin
    leer (data);
    while (data.codigo <> -1) do
      begin
		writeln('agregao');
        agregarA (vL[data.genero],vU[data.genero], data);
        writeln('lee');
        leer (data);
      end;
  end;
procedure inicializar {b} (var v: vector);
  var
    i: integer;
  begin
    for i:= 1 to 8 do 
      begin
        v[i].codigo:= 0;
        v[i].genero:= 1;
        v[i].puntaje:= -999;
      end;
  end;
procedure maximo {b} (var p:peli; pAct:peli);
begin
	if (pAct.puntaje > p.puntaje) then begin
		p.puntaje:=pAct.puntaje;
		p.codigo:=pAct.codigo;
		p.genero:=pAct.genero;

	end;
end;
procedure generarV {b} (vL:vListas; var v:vector);
  var
	i:integer;
  begin
  for i:= 1 to 8 do
    while (vL[i]<> nil) do 
      begin
		maximo(vL[i]^.dato, v[i]);
        vL[i]:= vL[i]^.sig;
      end;
  end;
procedure verLista {debug} (vL:vListas);
var
	i:integer;
begin
	for i:= 1 to 8 do
		while (vL[i] <> nil) do begin
			writeln(vL[i]^.dato.codigo,' ',vL[i]^.dato.puntaje,' ',vL[i]^.dato.genero);
			vL[i]:=vL[i]^.sig;
		end;
end;
procedure ordenar {c} (var v:vector);
var
	i, j, p:integer; item:peli;
begin
	for i:=1 to 7 do begin
		p:=i;
		for j:= i+1 to 8 do	
			if (v[j].puntaje < v[p].puntaje) then p:=j;
		item:=v[i];
		v[i]:=v[p];
		v[p]:=item;
	end;
end;
var
  vL: vListas; v:vector;
begin
  armar (vL);
  verLista(vL);
  inicializar(v);
  generarV(vL, v);
  writeln(v[1].codigo, v[8].codigo);
end.
