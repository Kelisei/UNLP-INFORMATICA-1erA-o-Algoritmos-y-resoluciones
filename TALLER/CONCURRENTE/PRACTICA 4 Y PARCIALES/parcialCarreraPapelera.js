programa carrerapapelera
procesos
  proceso juntarp(ES p:numero)
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
      p:=p+1
  fin
  proceso ids
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
  fin
  proceso enviarEsq
  variables
    av:numero
    ca:numero
  comenzar
    Random(av, 1, 7)
    Random(ca, 1, 40)
    EnviarMensaje(av, r1)
    EnviarMensaje(ca, r1)
    Random(av, 8, 14)
    Random(ca, 1, 40)
    EnviarMensaje(av, r2)
    EnviarMensaje(ca, r2)
    Random(av, 15, 21)
    Random(ca, 1, 40)
    EnviarMensaje(av, r3)
    EnviarMensaje(ca, r3)
  fin
areas
  a1: AreaPC(1,1,7,100)
  a2: AreaP(8,1,14,100)
  a3: AreaP(15,1,21,100)
  af: AreaP(25,1,25,1)
robots
  robot jugador
  variables
    cont, pasos, p, id, av,ca:numero
    ok: boolean
  comenzar
    p:=0
    RecibirMensaje(id, rf)
    RecibirMensaje(av, rf)
    RecibirMensaje(ca, rf)
    Pos(av, ca)
    cont:=0
    repetir 5
      Random(pasos, 1, 10)
      cont:=pasos+cont
      repetir pasos
        juntarp(p)
        mover
    juntarp(p)
    EnviarMensaje(ok, rf)
    RecibirMensaje(ok, rf)
    av:=PosAv
    ca:=PosCa
    BloquearEsquina(1,30)
    Pos(1,30)
    repetir p
      depositarPapel
    Pos(av, ca)
    LiberarEsquina(1,30)
    EnviarMensaje(id, rf)
    EnviarMensaje(cont, rf)
  fin
  robot jefe
  variables
    av, termino, id, idmax, pasos, maxpasos:numero
    aux:boolean
  comenzar
    ids
    enviarEsq
    repetir 3
      RecibirMensaje(aux, *)
    EnviarMensaje(aux, r1)
    EnviarMensaje(aux, r2)
    EnviarMensaje(aux, r3)
    repetir 3
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(pasos, r1)
      sino
        si(id = 2)
          RecibirMensaje(pasos, r2)
        sino
          RecibirMensaje(pasos, r3)
      si(pasos > maxpasos)
        idmax:=id
        maxpasos:=pasos
    Informar(id, maxpasos) 
  fin
variables
  r1, r2, r3:jugador
  rf: jefe
comenzar
  AsignarArea(r1, a1)
  AsignarArea(r2, a2)
  AsignarArea(r3, a3)
  AsignarArea(rf, af)
  AsignarArea(r2, a1)
  AsignarArea(r3, a1)
  Iniciar(r1, 1,1)
  Iniciar(r2, 8,1)
  Iniciar(r3, 15,1)
  Iniciar(rf, 25,1)
fin
