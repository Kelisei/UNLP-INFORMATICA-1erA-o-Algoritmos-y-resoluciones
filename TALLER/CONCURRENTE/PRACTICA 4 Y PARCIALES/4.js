programa jamonela
areas
  area1: AreaPC (2, 2, 100, 100)
  spawn1: AreaP (2, 1, 2, 1)
  spawn2: AreaP (3, 1, 3, 1)
  spawnj: AreaP (1, 1, 1, 1)
robots
  robot trabajador
  variables
    soy, tarea, av, ca, avi, cai: numero
  comenzar
    RecibirMensaje (soy, rj)
    avi:= PosAv
    cai:= PosCa
    RecibirMensaje (tarea, rj)
    mientras (tarea <> 4)
      si (tarea = 1)
        RecibirMensaje (av, rj)
        RecibirMensaje (ca, rj)
        BloquearEsquina (av, ca)
        Pos (av, ca)
        mientras (HayFlorEnLaEsquina)
          tomarFlor
        Pos (avi, cai)
        LiberarEsquina (av, ca)
      si (tarea = 2)
        RecibirMensaje (av, rj)
        RecibirMensaje (ca, rj)
        BloquearEsquina (av, ca)
        Pos (av, ca)
        mientras (HayPapelEnLaEsquina)
          tomarPapel
        Pos (avi, cai)
        LiberarEsquina (av, ca)
      si  (tarea = 3)
        RecibirMensaje (av, rj)
        RecibirMensaje (ca, rj)
        BloquearEsquina (av, ca)
        Pos (av, ca)
        mientras (HayFlorEnLaBolsa)
          depositarFlor
        mientras (HayPapelEnLaBolsa)
          depositarPapel
        Pos (avi, cai)
        LiberarEsquina (av, ca)
      EnviarMensaje(V, rj)
      RecibirMensaje (tarea, rj)       
    EnviarMensaje(V, rj)  
  fin
  robot jefe
  variables
    robi, tarea, av, ca, cont: numero
    aux1, aux2, ack: boolean
  comenzar
    EnviarMensaje (1, r1)
    EnviarMensaje (2, r2)
    aux1:= V
    aux2:= V
    cont:= 0
    mientras (cont < 10) & ((aux1) | (aux2)) 
      Random (tarea, 1, 4) 
      si (aux1) & (aux2)
        Random (robi, 1, 2)
      sino
        si (aux1) & ~(aux2)
          robi:= 1
        sino
          si ~(aux1) & (aux2) 
            robi:= 2
      Random (av, 2, 100)
      Random (ca, 2, 100)
      si (robi = 1)
        EnviarMensaje (tarea, r1)
        si (tarea <> 4)
          EnviarMensaje (av, r1)
          EnviarMensaje (ca, r1)
        sino
          aux1:= F
          RecibirMensaje (ack, r1)
      sino
        EnviarMensaje (tarea, r2)
        si ( tarea <> 4)
          EnviarMensaje (av, r2)
          EnviarMensaje (ca, r2)
        sino
          aux2:= F
          RecibirMensaje (ack, r2)
      cont:= cont + 1
      si (robi = 1) & (aux1)
        RecibirMensaje(ack, r1)
      sino
        si(robi =2 ) & (aux2)
          RecibirMensaje(ack, r2)
    si (cont = 10)
      si (aux1) & (aux2)
        EnviarMensaje (4, r1)
        EnviarMensaje (4, r2)
        RecibirMensaje (ack, r1)
        RecibirMensaje (ack, r2)
      sino
        si (aux1) & ~(aux2)
          EnviarMensaje (4, r1)
          recibirMensaje (ack, r1)
        sino
          si ~(aux1) & (aux2)
            EnviarMensaje (4, r2)
            RecibirMensaje (ack, r2)
  fin
variables
  r1: trabajador
  r2: trabajador
  rj: jefe
comenzar
  AsignarArea (r1, area1)
  AsignarArea (r2, area1)
  AsignarArea (r1, spawn1)
  AsignarArea (r2, spawn2)
  AsignarArea (rj, spawnj)
  Iniciar (r1, 2, 1)
  Iniciar (r2, 3, 1)
  Iniciar (rj, 1, 1)
fin
