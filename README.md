# Algoritmos Utiles:
Este es un repositorio donde pienso guardar todos los algoritmos realizados durante el la carrera, por ahora solo de taller en adelante.
**Indice:** 

1. Arboles
* [Declaración](#Declaración)
* [Inserción](#Inserción)
* [Función Maximo/Minimo](#Función_Maximo/Minimo (Ordenado))

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
procedure insertar {a}(var A:arbol; n:socio);
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
Función_Maximo/Minimo (Ordenado)
===========
```pascal
	function conseguirMaximo(a:arbol):integer;
	begin
		if (a = nil) then 
			conseguirMaximo:=-1
		else if (a^.hd = nil) then 
			conseguirMaximo:=a^.dato.numero
		else conseguirMaximo:=conseguirMaximo(a^.hd);
	end;
```
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