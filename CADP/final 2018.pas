
{Práctico: Se dispone de un vector de caracteres ordenados alfabéticamente (de a lo sumo 100 elementos) que puede 
aparecer repetidos. Se pide generar un vector que contenga la cantidad total de repeticiones de cada uno de los caracteres 
alfabéticos. Luego se debe imprimir el vector resultante. }

Program practica2018;

Const 
  tope = 'z';

Type 
  vectorLetras = array [1..100] Of char;
  vectorContador = array ['a'..tope] Of integer;

Procedure ArmarVector (Var vl:vectorLetras; Var diml:integer);

Var 
  letra: char;
Begin
  write('Ingrese el char: ');
  readln (letra);
  While (diml<=100)And(letra<>'z') Do
    Begin
      diml := diml+1;
      vl[diml] := letra;
      write('Ingrese el char: ');
      readln (letra);
    End;
  write ('La diml: ',diml);
End;

Procedure contar (Var vC:vectorContador; vL:vectorLetras; dimL:integer);

Var 
  i: integer;
Begin
  write ('ENTRAMOS CONTAR');
  For i:=1 To dimL Do
    Begin
      //writeln ('la letra ', vL[i]);

      vC[vL[i]] := vC[vL[i]] + 1;
      writeln ('la letra ', vL[i], 'aparecio un total de :', vC[vL[i]]);
    End;
End;

Procedure iniciarVectorContador(Var vC: vectorContador);

Var 
  i: char;
Begin
  For i:='a' To tope Do
    vC[i] := 0;
  writeln('SALIMOS INICIAR VECTOR');
End;
Procedure mostrarVect(vc: vectorContador);

Var 
  i: char;
Begin
  For i := 'a' To tope Do
    writeln ('Letra "',i,'" : ',vc[i]);
End;

Var 
  vL: vectorLetras;
  vC: vectorContador;
  dl: integer;

Begin
  dl := 0;
  ArmarVector(vL,dl);
  iniciarVectorContador(vC);
  contar(vC, vL, dl);
  mostrarVect(vC);
End.
