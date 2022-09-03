# Algoritmos Utiles:
Este es un repositorio donde pienso guardar todos los algoritmos realizados durante el la carrera, por ahora solo de taller en adelante.
**Indice:** 

1. Arboles (BST)
* [Declaración](#Declaración)
* [Inserción](#Inserción)
* [Función Maximo/Minimo](#Función-Máximo-Mínimo)
* [Procedure Maximo/Minimo](#Procedure-Máximo-Mínimo)

Declaración
===========
```pascal
type
	arbol = ^nodo;
	nodo = record
		dato:integer;
		hi:arbol;
		hd:arbol;
	end;
```
Inserción
===========
```pascal
procedure insertar {a}(var A:arbol; n:nodo);
Begin
  if (A = nil) then
   begin
      new(A);
      A^.dato:= n; A^.HI:= nil; A^.HD:= nil;
   end
   else
    if (n.numero < A^.dato.numero) then crear(A^.HI,n)
    else crear(A^.HD,n)   
End;
```
Función Máximo Mínimo
===========
```pascal
{Cuando el arbol esta ordenado en base a lo que queremos sacar}
	function conseguirMaximo(a:arbol):integer;
	begin
		if (a = nil) then 
			conseguirMaximo:=-1
		else if (a^.hd = nil) then 
			conseguirMaximo:=a^.dato.numero
		else conseguirMaximo:=conseguirMaximo(a^.hd);
	end;
```
Procedure Máximo Mínimo
===========
```pascal
	procedure buscarMasEdad(a:arbol; var maxE:integer; var maxN:integer);
	begin
	   if ( a <> nil ) then begin
		writeln(a^.dato.numero);
		if (a^.dato.edad > maxE) then begin
			maxE:=a^.dato.edad;
			maxN:=a^.dato.numero;
		end;
		buscarMasEdad (a^.hi, maxE, maxN);
		buscarMasEdad (a^.hd, maxE, maxN);
   end;
```