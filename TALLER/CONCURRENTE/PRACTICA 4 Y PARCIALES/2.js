programa ej2p4
areas
  fuente: AreaC(50,50,50,50)
  spawnc1: AreaP(11,1,11,1)
  spawnc2: AreaP(12,1,12,1)
  av1: AreaP(5,1,5,100)
  av2:AreaP(10,1,10,100)
robots
  robot productor
  variables 
    p:numero
    ca, av:numero
  comenzar
    av:=PosAv
    mientras(PosCa < 100)
      mientras(HayPapelEnLaEsquina)
        tomarPapel
        p:=p+1
        si(p = 5)
          ca:=PosCa
          BloquearEsquina(50,50)
          Pos(50,50)
          repetir 5 
            depositarPapel
          Pos(av,ca)
          LiberarEsquina(50,50)
          p:=0
      mover  
  fin
  robot consumidor
  variables 
    intentos:numero
    cant: numero
    ca, av:numero
  comenzar
    ca:=PosCa
    av:=PosAv
    intentos:=0
    mientras(intentos < 8)
      Random(cant, 2, 5)
      BloquearEsquina(50,50)
      Pos(50,50)
      si (~HayPapelEnLaEsquina)
        intentos:=intentos+1
      sino
        intentos:=0
        repetir cant
          si(HayPapelEnLaEsquina)
            tomarPapel
      Pos(av, ca)
      LiberarEsquina(50,50)
      mientras(HayPapelEnLaBolsa)
        depositarPapel
  fin
variables
  p1: productor
  p2: productor
  c1: consumidor
  c2: consumidor
comenzar
  AsignarArea(p1, fuente)
  AsignarArea(p2, fuente)
  AsignarArea(c1, fuente)
  AsignarArea(c2, fuente)
  AsignarArea(p1, av1)
  AsignarArea(p2, av2)
  AsignarArea(c1, spawnc1)
  AsignarArea(c2, spawnc2)
  Iniciar(p1, 5,1)
  Iniciar(p2, 10,1)
  Iniciar(c1, 11,1)
  Iniciar(c2, 12,1)
fin
