program algoritmosPractica;
type
    lista = ^nodo;
    nodo = record   
        dato:integer;
        sig:lista;
    end;
    vector = array [1..dimF] of lista;
{Algoritmo de merge (logica):
    Uno tiene que chequear en el vector de listas cual es el más pequeño (o grande) de todos, para así "extraerlo"
    Para extraerlo chequeamos si el min actual (inicializado en 9999) es más pequeño que el del indice actual si no esta en nil
    Luego, Si hemos extraído el dato y lo hemos puesto en min debemos mover el la lista hacia adelante (Este cambio solo puede afectar al
    vecto de listas localmente, para ello se le pasa el vector de listas al cascarón por valor, y al minimo por referencia).    
    
    En el caso de que nos hagan un merge "acumulador", es decir contando las instancias de la ocurrencia de algo (donde solo tenemos que guardar su
    identificador y sus instancias), tedremos que hacer un doble corte de control en el cascarón, uno que sea min <> 9999 y otro dentro que sea
    min <> 9999 y actual.identificador = min.identificador
    Así cuando sale del corte de control interior lo agregas directamente a la lista.
}
procedure merge (var l:lista; v:vector);
var
    min:integer; u:lista;
    procedure minimo (var v:vector; var min:integer);
    var
        posMin:integer;
    begin
        posMin:=-1; min:=9999;
        for i:= 1 to dimF {dimL?}do
            if (v[i]^.dato < min) then begin
                posMin:=i;
                min:=v[i]^.dato;
            end;
        if (posMin <> -1) then 
            v[i]:=v[i]^.sig;
    end;
    procedure agregarAlFinal(var l:lista; var u:lista; n:integer);
    var
        nue:lista;
    begin
        new (nue); nue^.dato:=n; nue^.sig:=nil;
        if (l <> nil) then 
            u^.sig:=nue
        else l:=nue;
        u:=nue;
    end;
begin
    minimo(v,min);
    while (min <> 9999) do begin
        agregarAlFinal(l, m);
        minimo(v,min);
    end;
end;
//--------------------------------------------------------------------
procedure ordenacion (var v:vector; dimL:integer);
var
    i, j, pos, item:integer;
begin
    for i:=1 to dimL-1 do begin
        p:=i;    
        for i:=i+1 to dimL do 
            if(v[j] < v[p]) then p:=j;
        item:=v[p];
        v[p]:=v[i];
        v[i]:=item;  
    end;
end;
//--------------------------------------------------------------------
procedure busqueda (v:vector; pri:integer; ult:integer; var pos:integer; dato:integer);
var
    mid:integer;
begin
    if (pri > ult) then pos:=-1
    else begin
        mid:=(pri+ult) div 2;
        if (dato = v[mid]) then pos:=mid
        else begin
            if(dato < v[mid]) then
              busqueda(v, pri, (medio-1), dato, pos)
            else busqueda(v, (medio+1), ult, dato, pos);
        end;
    end;
end;
//--------------------------------------------------------------------
procedure busqueda (pri, ult, dato:integer; var pos:integer; v:vector);
var
    medio:integer;
begin
    if (pri > ult) then pos:=-1
    else begin
        medio:=(pri+ult) div 2;
        if (dato = v[medio]) then pos:=medio
        else begin
            if(dato < v[medio]) then busqueda(pri, (medio-1), dato, pos, v)
            else busqueda((medio+1), ult, dato, pos, v);
        end;
    end;
end;
//--------------------------------------------------------------------
procedure busqueda (v: vector; pri, ult, dato:integer; pos:Integer);
var
    medio:integer;
begin
    if (pri > ult) then pos:=-1
    else begin
        medio:=(pri+ult)div 2;
        if (dato = v[medio]) then pos:=medio
        else begin
          if (dato < v[medio]) then busqueda(v, pri, (medio-1), dato, pos)
          else busqueda(v,(medio+1),ult, dato, pos)
        end;
    end; 
end;
procedure ordenacion (var v:vector; dimL:integer);
var
    i,j,pos:integer; item:info;
begin
    for i:= 1 to dimL-1 do begin
        pos:=i;
        for j:=i+1 to dimL do
          if (v[j] < v[p]) then p:=j;
        item:=v[i];
        v[i]:=v[p];
        v[p]:=item;
    end;
end;
procedure crearArbol (var a:arbol);
var
    n:info;
    procedure leer(var n:info);
    begin
      readln(n.indice);
      if (n.indice <> -1) then begin
        readln(n.extra);
      end;
    end;
    procedure insertar(var a:arbol; n:info);
    begin
      if (a = nil) then begin
        new(a); a^.dato:=n; a^.hi:=nil; a^.hd:=nil;
      end
      else begin
        if (a^.dato.indice > n.indice) then
            insertar(a^.hi)
        else insertar(a^.hd)
      end;
    end;
begin
  leer(n);
  while (n.indice <> -1) do begin
    insertar(a, n);
    leer(n);
  end;
end;