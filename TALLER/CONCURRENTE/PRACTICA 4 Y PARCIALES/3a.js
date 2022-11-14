programa ej3p4A
procesos
  proceso juntarPapel
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
  fin
areas
  spawnrf: AreaC(50,50,50,50)
  av1: AreaP(1,1,1,100)
  av2:AreaP(2,1,2,100)
  av3: AreaP(3,1,3,100)
robots 
  robot correteador
  variables
    ok:boolean
    id:numero
    idactual:numero
  comenzar
    RecibirMensaje(id, rf)
    repetir 19
      repetir 5
        juntarPapel
        mover
      si(id = 1)
        EnviarMensaje(id, r2)
        EnviarMensaje(id, r3)
      sino
        si(id =2)
          EnviarMensaje(id, r1)
          EnviarMensaje(id, r3)
        sino
          EnviarMensaje(id, r1)
          EnviarMensaje(id, r2)
      si(id = 1)
        RecibirMensaje(idactual, r2)
        RecibirMensaje(idactual, r3)
      sino
        si(id =2)
          RecibirMensaje(idactual, r1)
          RecibirMensaje(idactual, r3)
        sino
          RecibirMensaje(idactual, r1)
          RecibirMensaje(idactual, r2)
    repetir 4
      juntarPapel
      mover
  fin
  robot nisman
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
  fin
variables
  r1,r2,r3: correteador
  rf: nisman
comenzar
  AsignarArea(r1, av1)
  AsignarArea(r2, av2)
  AsignarArea(r3, av3)
  AsignarArea(rf, spawnrf)
  Iniciar(r1, 1,1)
  Iniciar(r2, 2,1)
  Iniciar(r3, 3,1)
  Iniciar(rf, 50,50)
fin 
