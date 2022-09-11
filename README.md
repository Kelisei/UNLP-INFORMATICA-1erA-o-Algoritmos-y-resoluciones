<h1 align="center">🖥️Algoritmos Utiles🖥️</h1>

Este es un repositorio donde pienso guardar todos los algoritmos realizados durante el la carrera, por ahora solo de taller en adelante.

Si ves algún error o tenes alguna duda o sabes como hacer una función que encuentre el máximo de un dato por el que el arbol no esta ordenado mensajeame a:
.【𝓚𝓮𝓵𝓲𝓼𝓮𝓲】#6143


**Indice:** 

1. Arboles (BST) 🌲

* [Declaración](#Declaración)
* [Inserción](#Inserción)
* [Informar Simple](#Informar-Simple)
* [Función Maximo/Minimo Ordenado](#Función-Máximo-Mínimo)
* [Función Máximo Minimo Desordenado](#función-máximo-minimo-desordenado)
* [Procedure Máximo/Mínimo](#Procedure-Máximo-Mínimo)
* [Encontrar Ordenado](#Encontrar-Ordenado)
* [Encontrar](#Encontrar)
* [Informar Acumulando](#Informar-Acumulando)
* [Informar Uno](#Informar-Uno)
* [Informar Inferior](#Informar-Inferior)
* [Informar Rango](#Informar-Rango)

2. Vectores/Arrays 📰

* [Ordenación por inserción](#Ordenación-por-inserción)
* [Ordenación por selección](#Ordenación-por-selección)
* [Insertar Vector](#Insertar-Vector)
* [Dicotómica Recursiva](#Busqueda-Binaria)
* [Eliminar Rango](#Eliminación-de-rango)

3. Listas 🧾

* [Imprimir Orden Inverso](#Imprimir-inverso)
* [Merge](#Merge)
* [Merge Acumulador](#merge-acumulador)

4. Recursivo Random

* [Imprimr Numero Sin guardar](#Imprimir-sin-guardar)
<h1 align="center">🌲Arboles🌲</h1>

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
    if (n.numero < A^.dato.numero) then insertar(A^.HI,n)
    else insertar(A^.HD,n)   
End;
```
Informar Simple
===========
```pascal
Procedure x ( a : arbol );
begin
   if ( a<> nil ) then begin
    x (a^.hi);
	writeln ('Numero de socio:',a^.dato.numero);
    x (a^.hd);
   end;
end;
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
Función Máximo Minimo Desordenado
===========
```pascal
function m (a:arbol):integer;
        function max (actual, derecho, izquierdo:integer):integer;
        begin
            if (actual > derecho) and (actual > izquierdo)then
              max:=actual
            else if (derecho > actual) and (derecho > izquierdo)then
              max:=derecho
            else if (izquierdo > derecho) and (izquierdo > actual)then
              max:=izquierdo;
        end;
    begin
        if (a = nil) then
            m:=-1
        else m:=max(a^.dato.dni, m(a^.hi), m(a^.hd));
    end;
```
Procedure Máximo Mínimo
===========
```pascal
{Cuando buscamos elementos no ordenados en el arbol}
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
Encontrar Ordenado
===========
```pascal
procedure bv (a:arbol);
var
	valor:Integer;
	function encontrar (a:arbol; v:integer):boolean;
	begin
		if (a = nil) then
			encontrar:=false
		else if (a^.dato.numero = v) then encontrar:=true
		else if (a^.dato.numero < v) then encontrar:=encontrar(a^.hd, v)
		else encontrar:=encontrar(a^.hi, v);
	end;
begin
	readln (valor);
	if (encontrar(a,valor)) then 
		writeln('encontrao numero')
	else writeln ('no ta numero');
end;
```
Encontrar
===========
```pascal
procedure bvi (a:arbol);
var
	valor:string;
	function encontrar (a:arbol; nom:string):boolean;
	begin
		if (a = nil) then
			encontrar:=false
		else encontrar:=(a^.dato.nombre = nom) or encontrar(a^.hi, nom) or encontrar(a^.hd, nom);
	end;
begin
	readln (valor);
	if (encontrar(a,valor)) then 
		writeln('encontrao nombre')
	else writeln ('no ta nombre');
end;
```
Informar Acumulando
===========
```pascal
procedure b (var a:arbol; var cantv1:integer);
var
	num:integer; 
	function total (a:arbol; num:integer):integer;
	begin
		if (a = nil) then
			total:=0
		else if (a^.dato.codigo = num) then
			total:= a^.dato.cantidad+total(a^.hd, num)
		else if (num < a^.dato.codigo) then 
			total:=total(a^.hi, num) 
		else total:=total(a^.hd, num);
	end;
begin
	readln(num);
	cantv1:=total(a,num);
	writeln('Diga un numero de producto!');
	writeln('Las ventas de ',num,' son de ',cantv1);
end;
```
Informar Uno
===========
```pascal
procedure c (var a:arbol2);
var
	num:integer;
	function total (a:arbol2; num:integer):integer;
	begin
		if (a = nil) then
			total:=0
		else begin 
			if (a^.dato.codigo = num) then
				total:=a^.dato.cantidad
			else begin
				if (num < a^.dato.codigo) then 
					total:= total(a^.hi, num) 	
				else total:= total(a^.hd, num);
			end;
		end;
	end;
begin
	writeln('Diga un numero de producto!');
	readln(num);
	writeln(total(a,num));
end;
```
Informar Inferior 
===========
```pascal
procedure informarInferior(A: arbol; legajo: integer;);
begin
  if(A <> nil) then begin
    if(A^.dato.legajo > legajo) then
      informarInferior(A^.HI, legajo)
    else
      if(A^.dato.legajo <= legajo) then begin
        write(a^.dato.legajo,'|');
        informarInferior(A^.HD, legajo);
        informarInferior(A^.HI, legajo);
      end
  end;
end;
```
Informar Rango
===========
```pascal
procedure informarRango(A: arbol; legajo1: integer; legajo2: integer);
begin
  if(A <> nil) then begin
    if(A^.dato.legajo > legajo2) then
      informarRango(A^.HI, legajo1, legajo2)
    else
      if(A^.dato.legajo >= legajo1) then begin
        write(a^.dato.legajo,'|');
        informarRango(A^.HD, legajo1, legajo2);
        informarRango(A^.HI, legajo1, legajo2);
      end
      else
        informarRango(A^.HD, legajo1, legajo2);
  end;
end;
```

<h1 align="center">📰Vectores/Arrays📰</h1>

Ordenación por Inserción 
===========
```pascal
Procedure Ordenar ( var v: tVector; dimLog: indice );
var i, j: indice; actual: tipoElem;		
begin
 for i:=2 to dimLog do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) y (v[j] > actual) do      
       begin
         v[j+1]:= v[j];
         j:= j – 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;
```
Ordenación por Selección
===========
```pascal
Procedure Ordenar ( var v: tVector; dimLog: indice );
var i, j, p: indice; item : tipoElem;		
begin
 for i:=1 to dimLog-1 do begin {busca el mínimo y guarda en p la posición}
          p := i;
          for j := i+1 to dimLog do
             if v[ j ] < v[ p ] then p:=j;

         {intercambia v[i] y v[p]}
         item := v[ p ];   
         v[ p ] := v[ i ];   
         v[ i ] := item;
      end;
end;
```
Insertar Vector
===========
```pascal
procedure insertarVector (var v:vector; var ok:boolean; var dimf:integer; valor, diml, pos:integer);
var
    i:integer;
begin
    ok:=false;
    if (diml + 1 < dimf) and (pos > 1) and (pos < diml) then begin
        for i:= diml downto pos do
            v[i+1]:=v[i];
        ok:=true;
        diml:=diml+1;
    end;
end;
```
Inserción
===========
```pascal
procedure insertarVector (var v:vector; var ok:boolean; var dimf:integer; valor, diml, pos:integer);
var
    i:integer;
begin
    ok:=false;
    if (diml + 1 < dimf) and (pos > 1) and (pos < diml) then begin
        for i:= diml downto pos do
            v[i+1]:=v[i];
        ok:=true;
        diml:=diml+1;
    end;
end;
```
Busqueda binaria
===========
```pascal
procedure busDicotómica (arr: vector ; primero: integer ; ultimo: integer ; dato: integer ; var pos: integer);
var
	medio: integer;
begin
	if (primero > ultimo) then
		pos:= -1
	else begin
		medio:= (primero + ultimo) div 2;
		if (dato = arr[medio]) then
			pos:= medio;
		else
			if (dato < arr[medio]) then
				busDicotómica(arr, primero, (medio - 1), dato, pos)
			else busDicotómica(arr, (medio + 1), ultimo, dato, pos)
	end;
end;
```
Eliminación de rango
===========
```pascal
procedure eliminar (var arr:arrVentas ; var dimL:integer; num1, num2:integer);
    function buscarPosInf (arr:arrVentas; dimL, buscado:integer):integer;
    var
        pos:integer;
    begin
        pos:=1;
        while (pos <= dimL) and (buscado > arr[pos].codigo) do {Busco el codigo para guardarme su posicion en posInf}
            pos:= pos + 1;

        if (pos > dimL) then {Si la posicion esta fuera de la dimL asignamos 0 para no buscar la posSup, caso contrario nos guardamos la posicion}
            buscarPosInf:= 0
        else
            buscarPosInf:= pos;
    end;
    function buscarPosSup (arr:arrVentas; dimL, buscado, pos:integer):integer;
    begin
        while (pos <= dimL) and (buscado >= arr[pos].codigo) do {Busco el codigo para guardarme su posicion en posSup}
            pos:= pos + 1;

        if (pos > dimL) then    {Si la posicion esta fuera de la dimL asignamos dimL para correr el resto del array, caso contrario restamos 1 a pos para qeudar en la posicion correcta}
            buscarPosSup:= dimL
        else
            buscarPosSup:= pos - 1;
    end;
var
    i, posInf,posSup, salto, aux:integer;
begin
    posInf:= buscarPosInf(arr, dimL, num1);
    if (posInf <> 0) then
    begin
        posSup:=buscarPosSup(arr, dimL, num2, posInf);
        salto:= posSup - posInf + 1;
        aux:=posInf;
        writeln(posInf);
        writeln(posSup);
        for i:= (posSup + 1) to dimL do
            arr[aux]:= arr[i];
        dimL:= dimL - salto;
        end
    else
        writeln('La posicion esta fuera del rango del Vector')
end;
```

<h1 align="center">🧾Listas🧾</h1>

Imprimir inverso
===========
```pascal
procedure impLInv {g} (l:lista; aux:char);
begin
	if (l^.letra = '.') then begin {Caso base, podría ser nil el caso base e estar implicito}
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
```
Merge
===========
```pascal
procedure b (al:arrLista; var l:lista);
var
	min:peliculaGuardada; u:lista;
	procedure agregarAlFinal(var l:lista; var u:lista; n:peliculaGuardada);
	var
		nue:lista;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
	end;
	procedure minimo (var al:arrLista; var min:peliculaGuardada);
	var
		posMin, i:integer; 
	begin
		writeln('Entro a minimo');
		posMin:=-1; min.codigo:=9999;
		for i:= 1 to 8 do
			if (al[i] <> nil) and (al[i]^.dato.codigo < min.codigo) then begin
				writeln('i:', i);
				writeln(al[i]^.dato.codigo);
				min:=al[i]^.dato;
				posMin:=i;
				writeln('*Accediendo ', al[i]^.dato.codigo);
			end;
		writeln(posMin);
		if (posMin <> -1) then begin
			writeln('Moviendo nodo del indice ', i);
			al[posMin]:=al[posMin]^.sig;		
		end;
		writeln('Saliendo minimo');	
	end;
begin
	l:=nil; u:=nil;
	writeln('Minimo');
	minimo(aL, min);
	while (min.codigo <> 9999) do begin
		writeln('Agregar');		
		agregarAlFinal(l, u, min);
		writeln('Minimo');
		minimo(aL, min);
	end;
end;
```
Merge Acumulador
===========
```pascal
procedure incisoB (v:vector; var l:listaB);
var
	min:infoGuardar; var u:listaB; actual:infoB;
	procedure agregarAlFinal(var l:listaB; var u:listaB; n:infoB);
	var
		nue:listaB;
	begin
		new(nue); nue^.dato:=n; nue^.sig:=nil;
		if (l <> nil) then
			u^.sig:=nue
		else l:=nue;
		u:=nue;
		writeln(u^.dato.codigo);
	end;
	procedure minimo(var v:vector; var min:infoGuardar);
	var
		posMin:integer; i:integer;
	begin
		posMin:=-1; min.codigo:=9999;
		for i:= 1 to dimF do
			if (v[i] <> nil) and (v[i]^.dato.codigo < min.codigo) then begin
				min:=v[i]^.dato;
				posMin:=i;
			end;
		if (posMin <> -1) then
			v[posMin]:=v[posMin]^.sig;
	end;
begin
	l:=nil; u:=nil;
	writeln('Minimo *debug*'); 
	minimo(v, min);
	while(min.codigo <> 9999) do begin
		writeln('While superior *debug*');
		actual.codigo:=min.codigo; actual.cant:=0;
		while(min.codigo <> 9999) and (min.codigo = actual.codigo) do begin
			actual.cant:=actual.cant+1;
			writeln('Minimo|Codigo de minimo actual: *debug*', min.codigo); 
			minimo(v, min);
		end;
		agregarAlFinal(l, u, actual);
	end;
end;
```


<h1 align="center">🖥️Recursivos Random🖥️</h1>

Imprimir sin guardar
===========
```pascal
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
```
