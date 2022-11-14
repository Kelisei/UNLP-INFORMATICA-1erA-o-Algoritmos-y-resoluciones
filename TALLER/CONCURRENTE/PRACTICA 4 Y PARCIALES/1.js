programa ej1p4
areas
  spawnServer: AreaP(100,100,100,100)
  av1: AreaPC(1,1,1,100)
  av2: AreaPC(2,1,2,100)
  av3: AreaPC(3,1,3,100)
robots
  robot server
  variables
    terminados:numero
    id:numero
    f, ca, av:numero
  comenzar  
    mientras(HayFlorEnLaEsquina)
      tomarFlor
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3) 
    terminados:= 0
    mientras(terminados < 3)
      RecibirMensaje(id, *)
      si(id =1)
        RecibirMensaje(f, r1)
      sino
        si(id=2)
          RecibirMensaje(f, r2)
        sino
          RecibirMensaje(f, r3)
      si(f <> 0)
        si(id =1)
          RecibirMensaje(av, r1)
          RecibirMensaje(ca, r1)
        sino
          si(id=2)
            RecibirMensaje(av, r2)
            RecibirMensaje(ca, r2)
          sino
            RecibirMensaje(av, r3)
            RecibirMensaje(ca, r3)
        Pos(av, ca)
        repetir f
          depositarFlor
        Pos(100,100)
        si (id = 1)
          EnviarMensaje (V, r1)
        sino
          si (id = 2)
            EnviarMensaje (V, r2)
          sino
            EnviarMensaje (V, r3)
      sino
        terminados:=terminados+1  
        Informar(terminados)
  fin
  robot cliente
  variables
    id,f ,terminados:numero
    av, ca:numero
    ack:boolean
  comenzar
    RecibirMensaje(id, rf)
    av:=PosAv
    mientras(PosCa < 100)
      EnviarMensaje(id, rf)
      Random(f, 1, 4)
      EnviarMensaje(f, rf)
      ca:=PosCa+1
      EnviarMensaje(av, rf)
      EnviarMensaje(ca, rf)
      RecibirMensaje(ack, rf)
      mover
      mientras(HayFlorEnLaEsquina)
        tomarFlor
      Pos(PosAv, PosCa - 1)
      mientras(PosCa < 100 & HayFlorEnLaBolsa)
        depositarFlor
        mover
    si (PosCa = 100)
      EnviarMensaje(id, rf)
      EnviarMensaje(0, rf)
  fin
variables
  rf: server
  r1: cliente
  r2: cliente
  r3: cliente
comenzar
  AsignarArea(rf, spawnServer)
  AsignarArea(rf, av1)
  AsignarArea(rf, av2)
  AsignarArea(rf, av3)
  AsignarArea(r1, av1)
  AsignarArea(r2, av2)
  AsignarArea(r3, av3)
  Iniciar(rf, 100,100)
  Iniciar(r1, 1,1)
  Iniciar(r2, 2,1)
  Iniciar(r3, 3,1)
fin
