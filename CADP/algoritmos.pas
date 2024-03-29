{	
    ORDENAR VECTOR
    Es un algoritmo de dimL pasadas.
    Para cada pasada i
    Se elige el mínimo en el vector a partir de la
    posición (i+1) hasta el final
    Si el mínimo de vector es más chico que lo que
    está almacenado en la posición i del vector se
    intercambia
}
Procedure Ordenar ( var v: numeros; dimLog: integer);
var 
  i, j, p, item: integer; {declaramos 4 integers, los 2 primeros sin indices y el siguiente es posicion, e item}
begin
 for i:=1 to dimLog-1 do
  begin {busca el mínimo v[p] entre v[i] , ..., v[N] }
  p := i; {asignamos i}
  for j := i+1 to dimLog do {avanzamos del siguiente hasta el final}
    if v[ j ] < v[ p ] then {de ser el siguiente menor que la posicion hay que intercambiar lugares}
  p:=j; 
  {intercambia v[i] y v[p] }
  item := v[ p ]; {item funciona para guardar el lugar (como un aux)}
  v[ p ] := v[ i ];
  v[ i ] := item;
  end;
 end;
{
    INSERTAR VECTOR:
    1- Verificar si hay espacio (cantidad de elementos actuales es menor a la cantidad de 
    elementos posibles)
    2- Verificar que la posición sea válida (esté entre los valores de dimensión definida del vector y la dimensión lógica).
    3- Hacer lugar para poder insertar el elemento.
    4- Incrementar la cantidad de elementos actuales.
}
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
{
    BUSQUEDA DICOTOMICA:
    1- Se calcula el elemento que esta en la posición del medio
    2- Si es el elemento que busco, entonces la búsqueda termino
    Si NO es el elemento que busco, entonces comparo contra el valor del medio elijo del vector la mitad que me convenga 
}
procedure busquedaDicotomica (var vector: numeros; dimL: integer; bus:integer; var ok:boolean); //Se pasa el vector como var en caso de tener que hacer algo, lol
var 
    pri, ult, medio: integer;
begin
  ok:=false; //Ok chequea si lo encontró
  //calculamos las posiciones por primera vez
  pri:=1;
  ult:=dimL;
  medio:=(pri+ult) div 2;
  while (pri <= ult) and (bus <> vec[medio]) do //mientras no hayamos llegado al final y no hallamos encontrado el objeto 
   begin
        if (bus < vec[medio]) then
            ult:=medio-1 //Si el busqueda esta del lado menor del vector entonces el ultimo tiene que pasarse alli
        else pri:=medio+1; //Lo mismo con le primero si esta en el lado mayor
        medio:= (pri+ult) div 2; //Reseteamos el medio
    end;
    if (pri <= ult) and (bus = vec[medio]) then ok:=True; //Si esta en un posicion posible, y se encontró, entonces le devolvemos verdadero
  end;
end;

{ 
    BUSQUEDA VECTOR ORDENADO:
    1-Si NO es el elemento que busco, entonces 
    2-Comparo contra el valor del medio
    3-Elijo del vector la mitad que me convenga 
}
procedure busquedaOrdenado (vector:numeros; dimL:integer; bus:integer; ok:Boolean);
var
    pos:integer;
begin
    pos:=1;
    while (pos <= dimL) and (vector[pos] < bus) do begin {Mientras este ordenado menor va seguir moviendose, 
    esto sirve para cuando es de menor a mayor, ya que por ejemplo nos dan 
    el 8, y hay 3, 6, 7, 9: el 3 es menor entonces se mueve, el 6 tambien, etc, hasta llegar al 9}
    {para cuando es de mayor a menor:
    while (pos <= dimL) and (a[pos] > bus) do begin
    ya que nos dan 9, 7, 6, 3 y hay que buscar el 6, el 9 es mayor, entonces se mueve, etc}
      pos:=pos+1;
    end;
    if (pos <= dimL) and (vector[pos] = bus) then ok:=true;
end;
{   
    ELIMINAR VECTOR:
    1- Verificar que la posición sea válida (esté entre los valores de dimensión definida del vector y la dimensión lógica).
    2- Hacer el corrimiento a partir de la posición y hasta el final.
    3- Decrementar la cantidad de elementos actuales.
}
procedure eliminarVector (var vector:numeros; dimL:integer; bus:integer; ok:boolean);
var
  i:integer;
begin
  ok:=false;
  if (bus >= 1) and (bus <= dimL) then begin
    for i:= bus to dimL-1 do 
      a[i]:=a[i+1];
    ok:=true;
    dimL:=dimL-1;
  end;
end;
{
    INSERTAR UN ELEMENTO EN UNA LISTA ORDENADA:
    • Se necesita que la estructura tenga un orden e implica agregar el elemento a la lista de manera que la misma siga ordenada.
    • Generar un nuevo nodo.
    • Cargar el nuevo nodo con el dato que corresponda y la dirección siguiente ‘nil’
    • Verificar que la lista no esté vacía
    • Si la lista está vacía, asigna al nuevo nodo la dirección del puntero inicial.
    • Si la lista no está vacía, buscar la posición a insertar recorriéndola con dos punteros auxiliares que indiquen 
    el nodo actual y el anterior.
    • Hacer que campo siguiente del puntero anterior apunte a la dirección del nuevo nodo, 
    y que el campo siguiente del nuevo nodo apunte a la dirección del puntero actual.
}
procedure insertarOrdenado (var L:lista; N:dato); 
var
    nue, act, ant: lista;
begin
    new (nue); nue^.sig:=nil; nue^.dato:=N; act:=L; ant:=L;
    while (act <> nil) and (act^.dato.code < nue^.dato.code ) do begin //recuerden que va de menor a mayor asi
        ant:=act;
        act:=act^.sig;
    end;    
    if (act = ant) then L:=nue //Si no se movio, hacemos que el puntero de lista sea el nuevo (va al inicio)
    else ant^.sig:=nue; //Si se movio, el siguiente de anterior es el nuevo, para agregar entre medio del anterior y actual
    nue^.sig:=act; {En ambos casos, el siguiente del nuevo tiene que ser el actual 
    (si esta al inicio, el actual es L, sino es el siguiente del ant}
end;
{
        ELIMINAR DE UNA LISTA:
        • Inicializar dos punteros auxiliares (anterior y actual) con la dirección del puntero inicial de la lista
        • Recorrer con ellos la lista nodo por nodo mientras no se llegue a final y no se encuentre el elemento a eliminar.
        • Si el elemento a eliminar resultara ser el primero de la lista, se actualiza el puntero inicial y se hace un dispose del nodo a eliminar.
        • Si el elemento a eliminar estuviera en el medio de la lista, el campo siguiente del puntero auxiliar anterior pasa a tener la dirección del 
        campo siguiente del puntero auxiliar actual y se elimina con un dispose el nodo actual.

}
procedure eliminar (var l: lista);
var
	ant, act:lista; eliminador: integer;
begin
	ant:=l; act:=l; readln (eliminador);
	while (act <> nil) and (act^.dato.numero <> eliminador) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act <> nil) then begin
		if (act = l) then begin
			l:=l^.sig;
			dispose (act);
		end
		else begin 
			ant^.sig:=act^.sig;
			dispose(act);
		end;
	end;
end;

Procedure eliminar(Var l:lista; valor:Integer);
//buscas en una lista un valor y si existe lo elimina
Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) Do //Mientras no nos caigamos
    Begin
      If (actual^.dato <> valor)  Then //Mientras no encuentre lo que quiere eliminar
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            If (actual = l) Then begin
                l := l^.sig;
                dispose (actual);
				actual:=l;
              end
              Else begin
                ant^.sig := actual^.sig;
                dipose (actual);
				actual := ant;
            End;
        End;
    End;
end;
{   ELIMINAR CON LA LISTA ORDENADA     }
procedure eliminar (var L:lista; valor:Integer; var ok:boolean);
var 
    actual, ant: lista;
begin
    actual:=L;
    ok:=true;
    while (actual <> nil) and (ok = true) do begin
        if (actual^.dato < valor) then begin //Si la lista va de menor a mayor, es así sino al reves
            ant:=actual;
            actual:=ant^.sig;
        end;
        if (actual^.dato > valor) then ok:=false; //Si la lista va de menor a mayor, es así sino al reves
		if (actual <> nil) and (actual^.dato = valor) then begin
			if (actual = L) then begin
				L:=L^.sig;
				dispose(actual);
				actual:=L;
			end
			else begin 
				ant^.sig:=actual^.sig;
				dispose(actual);
				actual:=ant;
			end;
		end;
	end;
end;
{ AGREGAR ATRAS/FINAL }
procedure agregarAtras {agregar al final} (var l:lista; nue:alumno; var U:lista);
var
	N:lista;
begin
	new(N); N^.dato:=nue; N^.sig:=nil;
	if (l = nil) then
		l:=N
	else u^.sig:=N;
	u:=N;
end;
