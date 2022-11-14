programa parcial4
procesos
  proceso ids
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
  fin
  proceso juntarF(ES f:numero)
  comenzar
    mientras(HayFlorEnLaEsquina)
      tomarFlor
      f:=f+1
  fin
  proceso lado(ES f:numero)
  comenzar
    repetir 5
      juntarF(f)
      mover
  fin
  proceso informarGanador(E idmax:numero)
  comenzar
    si(idmax = 1)
      EnviarMensaje(V, r1)
      EnviarMensaje(F, r2)
      EnviarMensaje(F, r3)
    sino
      si(idmax = 2)
        EnviarMensaje(F, r1)
        EnviarMensaje(V, r2)
        EnviarMensaje(F, r3)
      sino
        EnviarMensaje(F, r1)
        EnviarMensaje(F, r2)
        EnviarMensaje(V, r3)
  fin
areas
  a1: AreaP(1,1,6,6)
  a2: AreaP(7,1,12,6)
  a3: AreaP(13,1,18,6)
  ac: AreaP(20,1,20,1)
  depo: AreaPC(10,10,10,10)
robots
  robot trabajador
  variables
    f:numero
    aux:numero
    id:numero
    ok:boolean
    avi, cai:numero
    gano:boolean
  comenzar
    RecibirMensaje(id, rc)
    repetir 3
      lado(f)
      derecha
      EnviarMensaje(V, rc)
      RecibirMensaje(ok, rc)
    lado(f)
    juntarF(f)
    EnviarMensaje(id, rc)
    EnviarMensaje(f, rc)
    RecibirMensaje(gano, rc)
    si(~gano)
      avi:=PosAv
      cai:=PosCa
      repetir f
        BloquearEsquina(10,10)
        Pos(10,10)
        depositarFlor
        Pos(avi, cai)
        LiberarEsquina(10,10)
  fin
  robot coordinador
  variables
    ok:boolean
    id, idmax:numero
    f, fmax:numero
  comenzar
    ids
    repetir 3  
      RecibirMensaje(ok, *)
      RecibirMensaje(ok, *)
      RecibirMensaje(ok, *)
      EnviarMensaje(V, r1)
      EnviarMensaje(V, r2)
      EnviarMensaje(V, r3)
    fmax:=-1
    repetir 3
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(f, r1)
      sino
        si(id=2)        
          RecibirMensaje(f, r2)
        sino
          RecibirMensaje(f, r3)
      si(f > fmax)
        fmax:=f
        idmax:=id
    Informar('gano',idmax)
    informarGanador(idmax)
  fin
variables
  r1, r2, r3: trabajador
  rc: coordinador
comenzar
  AsignarArea(r1, a1)
  AsignarArea(r2, a2)
  AsignarArea(r3, a3)
  AsignarArea(rc, ac)
  AsignarArea(r1, depo)
  AsignarArea(r2, depo)
  AsignarArea(r3, depo)
  Iniciar(r1, 1,1)
  Iniciar(r2, 7,1)
  Iniciar(r3, 13,1)
  Iniciar(rc, 20,1)
fin
