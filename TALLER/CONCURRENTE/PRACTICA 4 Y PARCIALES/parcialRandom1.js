programa parcialuno
procesos
  proceso enviarIds
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
    EnviarMensaje(4, r4)
  fin
  proceso max(ES idmax:numero; E t1:numero; E t2:numero; E t3:numero; E t4:numero)
  comenzar
    si((t2 > t1) & (t2 > t3) & (t2 > t4))
      idmax:=2
    sino
      si((t3 > t1) & (t3 > t2) & (t3 > t4))
        idmax:=3
      sino
        si((t4 > t1) & (t4 > t2) & (t4 > t3))
          idmax:=4
        sino
          idmax:=1
  fin
  proceso enviarGanador(E idmax:numero)
  comenzar
    si(idmax = 1)
      EnviarMensaje(V, r1)
      EnviarMensaje(F, r2)
      EnviarMensaje(F, r3)
      EnviarMensaje(F, r4)
    sino
      si(idmax=2)
        EnviarMensaje(F, r1)
        EnviarMensaje(V, r2)
        EnviarMensaje(F, r3)
        EnviarMensaje(F, r4)
      sino
        si(idmax = 3)
          EnviarMensaje(F, r1)
          EnviarMensaje(F, r2)
          EnviarMensaje(V, r3)
          EnviarMensaje(F, r4)         
        sino
          EnviarMensaje(F, r1)
          EnviarMensaje(F, r2)
          EnviarMensaje(F, r3)
          EnviarMensaje(V, r4)
  fin
areas
  aC: AreaPC (45, 48, 62, 69)
  spawn1: AreaP(10,10,10,10)
  spawn2: AreaP(11,10,11,10)
  spawn3: AreaP(12,10,12,10)
  spawn4: AreaP(13,10,13,10)
  spawnrf: AreaP(1,1,1,1)
robots
  robot recolector
  variables
    f, p:numero
    av, ca: numero
    avI, caI:numero
    id:numero
    gane:boolean
  comenzar
    RecibirMensaje(id, rf)
    f:=0
    p:=0
    avI:=PosAv
    caI:=PosCa
    repetir 5
      Random(av, 45, 62)
      Random(ca, 48, 69)
      BloquearEsquina(av, ca)
      Pos(av, ca)
      mientras(HayPapelEnLaEsquina)
        tomarPapel
        p:=p+1
        EnviarMensaje(id, rf)
        EnviarMensaje(V, rf)
      mientras(HayFlorEnLaEsquina)
        tomarFlor
        f:=f+1
        EnviarMensaje(id, rf)
        EnviarMensaje(V, rf)
      Pos(avI, caI)
      LiberarEsquina(av, ca)
    EnviarMensaje(id, rf)
    EnviarMensaje(F, rf)
    RecibirMensaje(gane, rf)
    Informar(gane)
    si(gane)
      repetir f
        depositarFlor
      repetir p
        depositarPapel
  fin
  robot jefardo
  variables
    ok1, ok2, ok3, ok4:boolean
    t1, t2, t3, t4:numero
    idmax:numero
    id:numero
  comenzar
    enviarIds
    t1:=0
    t2:=0
    t3:=0
    t4:=0
    ok1:=V
    ok2:=V
    ok3:=V
    ok4:=V
    mientras(ok1 | ok2 | ok3 | ok4)
      RecibirMensaje(id, *)
      si (id = 1)
        RecibirMensaje(ok1, r1)
        si(ok1)
          t1:=t1+1
      sino
        si(id = 2)
          RecibirMensaje(ok2, r2)
          si(ok2)
            t2:=t2+1
        sino
          si(id = 3)          
            RecibirMensaje(ok3, r3)
            si(ok3)
              t3:=t3+1
          sino
            RecibirMensaje(ok4, r4)            
            si(ok4)
              t4:=t4+1
    max(idmax, t1, t2, t3, t4)
    enviarGanador(idmax)
    Informar('el-q-mas-junto-es', idmax)
  fin
variables
  rf: jefardo
  r1,r2,r3,r4:recolector
comenzar
  AsignarArea(rf, spawnrf)
  AsignarArea(r1, spawn1)
  AsignarArea(r2, spawn2)
  AsignarArea(r3, spawn3)
  AsignarArea(r4, spawn4)
  AsignarArea(r1, aC)
  AsignarArea(r2, aC)
  AsignarArea(r3, aC)
  AsignarArea(r4, aC)
  Iniciar(rf, 1,1)
  Iniciar(r1, 10,10)
  Iniciar(r2, 11,10)
  Iniciar(r3, 12,10)
  Iniciar(r4, 13,10)
fin
