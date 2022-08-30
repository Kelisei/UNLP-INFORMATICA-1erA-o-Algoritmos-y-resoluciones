{1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y los almacene en un vector con dimensión 
física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de 
caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e 
imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e 
imprima los valores de la lista en orden inverso al que están almacenados.}
program xd;
type 
	arrLetras = array [1..10] of char; {piton}
	lista = ^nodo;
	nodo = record
	  letra: char;
	  sig: lista;
	end;
procedure vectora {a} (var arrletra: arrLetras; var dl: integer;  var letra:char);
  begin
    if (dl< 10) then begin {poner todos los caracteres en la misma linea!}
		read (letra);
		if (letra <> '.') then 
		  begin
			dl:= dl+1;
			arrletra[dl]:= letra;
			vectora (arrletra, dl,letra);
		  end;
      end;
  end;
  
function contacion {d} (var letra:char):integer;
 
  begin
  read(letra);
  if (letra = '.') then
	contacion:=0
  else contacion:=contacion(letra)+1;
 
 
end;
procedure leerV {b} (dimL:integer; v:arrLetras);
var
	i:integer;
begin
	for i:= 1 to dimL do begin
		write('|');
		write(v[i]);
		write('|');
	end;
end;
procedure leerVrecursivo {c} (dimL:integer; V:arrLetras; var i:integer);
begin
	if (i >= 0) and (i < dimL)then begin
		i:=i+1;
		write('|');
		write(V[i]);
		write('|');
		leerVrecursivo(dimL, V, i);
	end;
end;
procedure crearNodo {e}(var l:lista; aux:char);
var
	nuevo:lista; anterior, act:lista;
begin	
	new(nuevo);
	nuevo^.letra:=aux;
	nuevo^.sig:=nil;
	anterior:=l;
	act:=l;
	while (act <> nil) do begin
		anterior:=act;
		act:=act^.sig;
	end;
	if (l = act) then
		l:=nuevo
	else anterior^.sig:=nuevo;
	nuevo^.sig:=act;
end;
procedure crearLista {e}(var l:lista; var aux:char);
begin
	readln(aux);
	if (aux = '.') then begin
		 crearNodo(l, aux)
	end
	else begin
		crearNodo(l,aux);
		crearLista(l,aux);
	end;
end;
procedure impL {f} (l:lista);
begin
	if (l <> nil) then begin
		write('|');
		write(l^.letra);
		write('|');
		l:=l^.sig;
		impL(l);
	end;
end;
procedure impLInv {g} (l:lista; aux:char);
begin
	if (l^.letra = '.') then begin
		write('|');
		write(l^.letra);
		write('|');
	end
	else begin
		aux:=l^.letra;
		l:=l^.sig;
		impLInv(l, aux);
		write('|');
		write(aux);
		write('|');
	end;
end;