{1)Practica: 
Un comercio dispone de las ventas realizadas para sus productos. De cada venta se conoce Numero 
de Producto(1..300), Cantidad Vendida y Nombre de Producto. Ademas el comercio cuenta con una 
tabla con el precio por unidad de cada uno de los 300 productos. Se pide calcular el nombre con el 
cual el comercio Obtuvo la menor ganancia. 
Notas: las ventas estan ordenadas por numero de producto. Un producto pudo ser vendido O, 1 0 
mas veces. }

program Examen2015;
const 
tope = 30;
type
ventas = ^nodo;
venta = record
    nprod: 1..tope;
    cvendida: integer;
    nombre: string[20];
end;
nodo = record   
    dato:venta;
    sig:ventas;
end;
tabla = array [1..tope] of real;



procedure iniciarTabla (var t: tabla); //se dispone
var
i: integer;
begin
for i:=1  to tope do begin
    t[i]:=random(200)*0.5;
    {writeln('tabla[',i,']: ',t[i]);}
end;
end;

procedure agregarAdelante(var v:ventas;d:venta);
var
    aux:ventas;
begin
    {writeln('agregando adelante');}
    new(aux); aux^.dato:=d; aux^.sig:=nil;
    if v=nil then
        v:=aux
    else begin
        aux^.sig:=v;
        v:=aux;
    end;
end;
Procedure minimaVenta(ventas : real; Var minimo: real; nombre: String; Var nombreMin: String; preciou:real; var precioMin:real);
Begin
  If (ventas < minimo) Then
    Begin
        writeln('minimo haciendose');
        minimo := ventas;
        nombreMin := nombre;
        precioMin := preciou;
    End;
End;

procedure mGanancia (V:ventas; T:tabla);
var
    actualP, minimoP: real; actualN,minimoN:string; nProdAct:integer; preciounitario, preciounitarioMin:real;
begin
    {writeln ('Entro en mGanancia');}
    minimoN:='X'; minimoP:=9999999;
     while ( V<>nil ) do begin
        {writeln('bucle 1');}
        actualN:=V^.dato.nombre;
        actualP:=0;
        preciounitario:=T[V^.dato.nprod];
        nProdAct:=V^.dato.nprod;
        while (V<>nil) and (V^.dato.nprod = nProdAct) do begin
            {writeln('bucle 2');}
            actualP:=actualP + T[V^.dato.nprod]*V^.dato.cvendida;
            V:=V^.sig;
        end;
        minimaVenta(actualP, minimoP, actualN, minimoN,preciounitario,preciounitarioMin);
    end;
    writeln('El producto de menos ganancia es: ', minimoN, ' con el valor por unidad de: ', preciounitarioMin:2:2,' con un total de: ',minimoP:2:2); 
    {writeln ('Salio en mGanancia');}
end;


procedure armarVentas(var v:ventas);
var
    nue: venta; i:integer;
begin
    writeln ('Entro en armarVentas');
    for i:=1 to tope do begin
        if (i<=5) then begin nue.nprod:=10; nue.nombre:='pizza'; end
        else if ((i>5) and (i<=10)) then begin nue.nprod:=20; nue.nombre:='queso'; end
        else if ((i>10) and (i<20)) then begin nue.nprod:=25; nue.nombre:='jamon'; end
        else begin nue.nprod:=tope; nue.nombre:='pepino'; end;
        
        nue.cvendida:=random(100)+1;
        agregarAdelante(v,nue);
        writeln(nue.nombre,', prods: ',nue.nprod,', vendidos: ',nue.cvendida);
    end;
end;
{Programa principal}
var
    V :ventas ; T:tabla;
begin
    V:=nil;
  iniciarTabla(T);
  armarVentas(V); //se dispone!
  mGanancia(V, T);
end.
