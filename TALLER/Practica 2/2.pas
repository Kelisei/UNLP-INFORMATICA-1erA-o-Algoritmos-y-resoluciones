{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. 
* Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}
program xd;
procedure desglosamiento (num:integer);
var
	aux: integer;
begin
	if (num <> 0) then begin
		aux:=num mod 10;
		num:= num div 10;
		desglosamiento(num);
		write(aux);
	end;
end;
procedure leer (var aux:integer);
begin
    readln(aux);
    while (aux <> 0) do begin
		desglosamiento(aux);
		writeln();
		readln(aux);
    end;
end;
var
	num:integer;
begin
    leer(num);
end.

