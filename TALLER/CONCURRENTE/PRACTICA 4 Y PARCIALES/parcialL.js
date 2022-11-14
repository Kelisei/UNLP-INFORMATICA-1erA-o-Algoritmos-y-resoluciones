programa mesa
procesos
  proceso viajef (E soy: numero)
  variables
    av, ca: numero
  comenzar
    BloquearEsquina (15, 15)
    Pos (15, 15)
    tomarFlor
    si(soy = 1)
      BloquearEsquina (5, 4)
      Pos (5, 4)
    sino
      BloquearEsquina (11, 4)
      Pos (11, 4)
    LiberarEsquina (15, 15)
    av:= PosAv
    ca:= PosCa
    depositarFlor
    mientras (PosCa < 16)
      ca:= ca +1
      BloquearEsquina (15, 15)
      Pos (15, 15)
      LiberarEsquina (av, ca -1)
      tomarFlor
      BloquearEsquina (av, ca)
      Pos (av, ca)
      LiberarEsquina (15, 15)
      depositarFlor
      si (ca = 5)
        si (soy = 1)
          EnviarMensaje (1, r3)
        sino
          EnviarMensaje (2, r4)
  fin
  proceso viajep (ES soy: numero)
  variables
    av, ca: numero
  comenzar
    BloquearEsquina (15, 15)
    Pos (15, 15)
    tomarPapel
    si(soy = 3)
      BloquearEsquina (5, 4)
      Pos (5, 4)
    sino
      BloquearEsquina (11, 4)
      Pos (11, 4)
    LiberarEsquina (15, 15)
    av:= PosAv
    ca:= PosCa
    depositarPapel
    si (soy = 3)
      mientras (PosAv < 9)
        av:= av +1
        BloquearEsquina (15, 15)
        Pos (15, 15)
        LiberarEsquina (av -1, ca)
        tomarPapel
        BloquearEsquina (av, ca)
        Pos (av, ca)
        LiberarEsquina (15, 15)
        depositarPapel
    sino  
      mientras (PosAv < 15)
        av:= av +1
        BloquearEsquina (15, 15)
        Pos (15, 15)
        LiberarEsquina (av -1, ca)
        tomarPapel
        BloquearEsquina (av, ca)
        Pos (av, ca)
        LiberarEsquina (15, 15)
        depositarPapel
  fin
areas
  linea1: AreaP (5, 5, 5, 16) 
  esq1: AreaPC (5, 4, 5, 4)
  linea2: AreaP (6, 4, 9, 4)
  linea3: AreaP (11, 5, 11, 16)
  esq2: AreaPC (11, 4, 11, 4)
  linea4: AreaP (12, 4, 15, 4)
  depo: AreaPC (15, 15, 15, 15)
  spawn1: AreaP (50, 50, 50, 50)
  spawn2: AreaP (51, 51, 51, 51)
  spawn3: AreaP (52, 52, 52, 52)
  spawn4: AreaP (53, 53, 53, 53)
  spawnj: AreaP (1, 1, 1, 1)
robots
  robot florero
  variables
    soy: numero
  comenzar
    RecibirMensaje (soy, rj)
    viajef (soy)
    EnviarMensaje (soy, rj)
  fin
  robot papelero
  variables
    soy, aux: numero
  comenzar
    RecibirMensaje (soy, rj)
    RecibirMensaje (aux, *)
    viajep (soy)
    EnviarMensaje (soy, rj)
  fin
  robot jefe 
  variables
    equi1, equi2, soy, ganador: numero
    ok: boolean
  comenzar
    EnviarMensaje (1, r1)
    EnviarMensaje (2, r2)
    EnviarMensaje (3, r3)
    EnviarMensaje (4, r4)
    equi1:= 0
    equi2:= 0
    ok:= V
    repetir 4
      RecibirMensaje (soy, *)
      si (soy = 1)
        equi1:= equi1 + 1
      sino
        si (soy = 2)
          equi2:= equi2 +1
        sino
          si (soy = 3)
            equi1:= equi1 +1
          sino
            equi2:= equi2 + 1
      si (equi1 = 2) & (ok = V)
        ganador:= 1
        ok:= F
      si (equi2 = 2) & (ok = V)
        ganador:= 2
        ok:= F
    Informar (ganador)  
  fin
variables
  r1: florero
  r2: florero
  r3: papelero
  r4: papelero
  rj: jefe
comenzar
  AsignarArea (r1, linea1)
  AsignarArea (r1, esq1)
  AsignarArea (r3, esq1)
  AsignarArea (r3, linea2)
  AsignarArea (r2, linea3)
  AsignarArea (r2, esq2)
  AsignarArea (r4, esq2)
  AsignarArea (r4, linea4)
  AsignarArea (r1, depo)
  AsignarArea (r2, depo)
  AsignarArea (r3, depo)
  AsignarArea (r4, depo)
  AsignarArea (r1, spawn1)
  AsignarArea (r2, spawn2)
  AsignarArea (r3, spawn3)
  AsignarArea (r4, spawn4)
  AsignarArea (rj, spawnj)
  Iniciar (r1, 50, 50)
  Iniciar (r2, 51, 51)
  Iniciar (r3, 52, 52)
  Iniciar (r4, 53, 53)
  Iniciar (rj, 1, 1)
fin
