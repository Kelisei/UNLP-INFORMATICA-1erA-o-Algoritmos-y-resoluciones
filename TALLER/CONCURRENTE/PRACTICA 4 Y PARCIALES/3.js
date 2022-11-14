programa jamonela 
areas
  linea1: AreaP (1, 1, 1, 100)
  linea2: AreaP (2, 1, 2, 100)
  linea3: AreaP (3, 1, 3, 100)
  spawnc: AreaP (4, 1, 4, 1)
robots 
  robot trabajador 
  variables  
    soy, aux1, aux2, papeles, termine: numero
  comenzar
    RecibirMensaje (soy, rc)
    mientras (PosCa < 100)
      Random (papeles, 1, 5)
      mientras (PosCa < 100) & (papeles > 0) 
        mientras (papeles > 0)  & (HayPapelEnLaEsquina)
          tomarPapel
          papeles:= papeles - 1
        si ~(HayPapelEnLaEsquina)
          mover
      si (soy = 1)
        EnviarMensaje (1, r2)
        EnviarMensaje (2, r3)
      sino
        si (soy = 2)
          EnviarMensaje (1, r1)
          EnviarMensaje (3, r3)
        sino
          EnviarMensaje (1, r1)
          EnviarMensaje (2, r2)
      si (aux1 <> 420)
        RecibirMensaje (aux1, *)
      si (aux2 <> 420)
        RecibirMensaje (aux2, *)
    mientras (HayPapelEnLaEsquina)
      Random (papeles, 1, 5)
      mientras (papeles > 0)  & (HayPapelEnLaEsquina)
        tomarPapel
        papeles:= papeles - 1
      si (soy = 1)
        EnviarMensaje (1, r2)
        EnviarMensaje (2, r3)
      sino
        si (soy = 2)
          EnviarMensaje (1, r1)
          EnviarMensaje (3, r3)
        sino
          EnviarMensaje (1, r1)
          EnviarMensaje (2, r2)
      si (aux1 <> 420)
        RecibirMensaje (aux1, *)
      si (aux2 <> 420)
        RecibirMensaje (aux2, *)
    si (soy = 1)
      EnviarMensaje (420,  r2)
      EnviarMensaje (420, r3)
    sino
      si (soy = 2)
        EnviarMensaje (420, r1)
        EnviarMensaje (420, r3)
      sino
        EnviarMensaje (420, r1)
        EnviarMensaje (420, r2)
  fin
  robot coordinador 
  comenzar
    EnviarMensaje (1, r1)
    EnviarMensaje (2, r2)
    EnviarMensaje (3, r3)
  fin
variables
  r1: trabajador
  r2: trabajador
  r3: trabajador
  rc: coordinador
comenzar  
  AsignarArea(r1, linea1)
  AsignarArea(r2, linea2)
  AsignarArea(r3, linea3)
  AsignarArea(rc, spawnc)
  Iniciar(r1, 1, 1)
  Iniciar(r2, 2, 1)
  Iniciar(r3, 3, 1)
  Iniciar(rc, 4, 1)
fin
