programa parcial3
procesos
  proceso juntarF(ES f:numero)
  comenzar
    mientras(HayFlorEnLaEsquina)
      tomarFlor
  fin
  proceso hacerEsquinaIzq(E caI:numero; ES f:numero)
  comenzar
    juntarF(f)
    BloquearEsquina(PosAv, 20)
    Pos(PosAv, 20)
    repetir f
      depositarFlor
    Pos(PosAv, caI)
    LiberarEsquina(PosAv, 20)
    f:=0
    EnviarMensaje(V, centroIzq)
  fin
  proceso izquierda
  comenzar
    repetir 3
      derecha
  fin
  proceso hacerEsquinaDer(E caI:numero; ES f:numero)
  comenzar
    juntarF(f)
    BloquearEsquina(PosAv, 20)
    Pos(PosAv, 20)
    repetir f
      depositarFlor
    Pos(PosAv, caI)
    LiberarEsquina(PosAv, 20)
    f:=0
    EnviarMensaje(V, centroDer)
  fin
  proceso enviarIds
  comenzar
    EnviarMensaje(1, centroIzq)
    EnviarMensaje(2, centroDer)
  fin
areas
  a1: AreaPC(9,19, 19,21)
  a2: AreaPC(21,19, 31, 21)
  centro: AreaPC(20,20,20,20)
  areaJefe: AreaP(20,18,20,18)
robots
  robot latIzquierdo
  variables
    f:numero
    caI:numero
  comenzar
    caI:=PosCa
    f:=0
    derecha
    mover
    repetir 9
      hacerEsquinaIzq(caI, f)
      mover
    hacerEsquinaIzq(caI, f)
  fin
  robot centroIzquierdo
  variables
    f:numero
    id:numero
    ok:boolean
    avI:numero
  comenzar
    RecibirMensaje(id, rf)
    f:=0
    derecha
    avI:=PosAv
    repetir 10
      repetir 2
        RecibirMensaje(ok, *)
      mover
      juntarF(f)
    avI:=PosAv
    BloquearEsquina(20,20)
    Pos(20,20)
    mientras(HayFlorEnLaBolsa)
      depositarFlor
    Pos(avI, 20)
    LiberarEsquina(20,20)
    EnviarMensaje(id, rf)
    EnviarMensaje(f, rf)
  fin
  robot latDerecho
  variables
    f:numero
    caI:numero
  comenzar
    caI:=PosCa
    f:=0
    izquierda
    mover
    repetir 9
      hacerEsquinaDer(caI, f)
      mover
    hacerEsquinaDer(caI, f)
  fin
  robot centroDerecho
  variables
    f:numero
    id:numero
    ok:boolean
    avI:numero
  comenzar
    RecibirMensaje(id, rf)
    f:=0
    izquierda
    avI:=PosAv
    repetir 10
      repetir 2
        RecibirMensaje(ok, *)
      mover
      juntarF(f)
    avI:=PosAv
    BloquearEsquina(20,20)
    Pos(20,20)
    mientras(HayFlorEnLaBolsa)
      depositarFlor
    Pos(avI, 20)
    LiberarEsquina(20,20)
    EnviarMensaje(id, rf)
    EnviarMensaje(f, rf)
  fin
  robot jefardo
  variables
    id:numero
    f1, f2:numero
  comenzar
    enviarIds
    repetir 2
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje( f1, centroIzq)
      sino
        RecibirMensaje( f2, centroDer)
    si (id = 2 )
      Informar('gano-equipo-derecho',0)
    sino  
      Informar('gano-equipo-derecho',0)
    si(f1 > f2)
      Informar('mayor-cant-de-flores-juntadas-por-equipo-izquierdo',f1)
    sino
      Informar('mayor-cant-de-flores-juntadas-por-equipo-izquierdo',f1)
  fin
variables
  latIzq1: latIzquierdo
  latIzq2: latIzquierdo
  centroIzq: centroIzquierdo
  latDer1:latDerecho
  latDer2:latDerecho
  centroDer: centroDerecho
  rf: jefardo
comenzar
  AsignarArea(latIzq1, a1)
  AsignarArea(latIzq2, a1)
  AsignarArea(centroIzq, a1)
  AsignarArea(centroIzq, centro)
  AsignarArea(latDer1, a2)
  AsignarArea(latDer2, a2)
  AsignarArea(centroDer, a2)
  AsignarArea(centroDer, centro)
  AsignarArea(rf, areaJefe)
  Iniciar(latIzq1, 9,21)
  Iniciar(latIzq2, 9,19)
  Iniciar(centroIzq, 9, 20)
  Iniciar(latDer1, 31,21)
  Iniciar(latDer2, 31, 19)
  Iniciar(centroDer, 31, 20)
  Iniciar(rf, 20,18)
fin
