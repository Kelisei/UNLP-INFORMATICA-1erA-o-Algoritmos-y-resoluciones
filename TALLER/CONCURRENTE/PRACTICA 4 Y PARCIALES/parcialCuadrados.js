programa parcial2
procesos
  proceso posicionarse
  comenzar
    repetir 2
      derecha
  fin
  proceso agarrarPapeles(ES p:numero)
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
      p:=p+1
  fin
  proceso ladoDerechoPapelero(ES p:numero)
  comenzar
    repetir 10
      agarrarPapeles(p)
      BloquearEsquina(PosAv, PosCa -1)
      mover
      LiberarEsquina(PosAv, PosCa + 1)
  fin
  proceso ladoInferiorPapelero(ES p:numero)
  comenzar
    repetir 10
      agarrarPapeles(p)
      BloquearEsquina(PosAv -1, PosCa)
      mover
      LiberarEsquina(PosAv +1 , PosCa )
  fin
  proceso ladoIzquierdoPapelero(ES p:numero)
  comenzar
    repetir 10
      agarrarPapeles(p)
      BloquearEsquina(PosAv, PosCa +1)
      mover
      LiberarEsquina(PosAv, PosCa - 1)
  fin
  proceso ladoSuperiorPapelero(ES p:numero)
  comenzar
    repetir 10
      agarrarPapeles(p)
      BloquearEsquina(PosAv +1, PosCa)
      mover
      LiberarEsquina(PosAv -1 , PosCa )
  fin
  {------------------------------------------------------------------------}
  proceso agarrarFlores(ES f:numero)
  comenzar
    mientras(HayFlorEnLaEsquina)
      tomarFlor
      f:=f+1
  fin
  proceso ladoDerechoFlorero(ES f:numero)
  comenzar
    repetir 10
      agarrarFlores(f)
      BloquearEsquina(PosAv, PosCa -1)
      mover
      LiberarEsquina(PosAv, PosCa + 1)
  fin
  proceso ladoInferiorFlorero(ES f:numero)
  comenzar
    repetir 10
      agarrarFlores(f)
      BloquearEsquina(PosAv -1, PosCa)
      mover
      LiberarEsquina(PosAv +1 , PosCa )
  fin
  proceso ladoIzquierdoFlorero(ES f:numero)
  comenzar
    repetir 10
      agarrarFlores(f)
      BloquearEsquina(PosAv, PosCa +1)
      mover
      LiberarEsquina(PosAv, PosCa - 1)
  fin
  proceso ladoSuperiorFlorero(ES f:numero)
  comenzar
    repetir 10
      agarrarFlores(f)
      BloquearEsquina(PosAv +1, PosCa)
      mover
      LiberarEsquina(PosAv -1 , PosCa )
  fin
  proceso mandarIds
  comenzar
    EnviarMensaje(1, p1)
    EnviarMensaje(2, p2)
    EnviarMensaje(3, f1)
    EnviarMensaje(4, f2)
  fin
areas
  c1: AreaPC(3,3,13,13)
  c2: AreaPC(16,3,26,13)
  fiscal: AreaP(14,6,14,6)
robots
  robot papelero
  variables 
    p:numero
    id:numero
  comenzar
    RecibirMensaje(id, rf)
    p:=0
    posicionarse
    BloquearEsquina(PosAv, PosCa)
    ladoDerechoPapelero(p)
    derecha
    ladoInferiorPapelero(p)
    derecha
    ladoIzquierdoPapelero(p)
    derecha
    ladoSuperiorPapelero(p)
    LiberarEsquina(PosAv, PosCa)
    EnviarMensaje(id, rf)
    EnviarMensaje(p, rf)
  fin
  robot florero
  variables
    f:numero
    id:numero
  comenzar
    RecibirMensaje(id, rf)
    f:=0
    BloquearEsquina(PosAv, PosCa)
    ladoIzquierdoFlorero(f)
    derecha
    ladoSuperiorFlorero(f)
    derecha
    ladoDerechoFlorero(f)
    derecha
    ladoInferiorFlorero(f)
    LiberarEsquina(PosAv, PosCa)
    EnviarMensaje(id, rf)
    EnviarMensaje(f, rf)
  fin
  robot jefardo
  variables 
    id:numero
    cant, aux:numero
    ganador:numero
  comenzar
    cant:=0
    mandarIds
    repetir 4
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(aux, p1)
        cant:= cant + aux
        ganador:=2
      sino
        si(id=2)
          RecibirMensaje(aux, p2)
          cant:= cant + aux
          ganador:=2
        sino
          si(id=3)
            RecibirMensaje(aux, f1)
            cant:= cant + aux
            ganador:=1
          sino
            RecibirMensaje(aux, f2)
            cant:= cant + aux
            ganador:=1
    si(ganador = 1)
      Informar('gano-equipo-papelero',0)
    sino
      Informar('gano-equipo-florero',0)
    Informar('juntaron',cant)    
  fin
variables
  p1, p2:papelero
  f1, f2:florero
  rf: jefardo
comenzar
  AsignarArea(p1, c1)
  AsignarArea(f1, c1)
  AsignarArea(p2, c2)
  AsignarArea(f2, c2)
  AsignarArea(rf, fiscal)
  Iniciar(p1, 13,13)
  Iniciar(f1, 3,3)
  Iniciar(p2, 26, 13)
  Iniciar(f2, 16, 3)
  Iniciar(rf, 14,6)
fin
