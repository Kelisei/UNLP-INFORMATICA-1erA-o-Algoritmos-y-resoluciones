programa parcialRandom55
procesos
  proceso juntarf(ES x: numero)
  comenzar
    si(HayFlorEnLaEsquina)
      tomarFlor
      x:=x+1
  fin
  proceso juntarp(ES x: numero)
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
      x:=x+1
  fin

areas
  depo: AreaPC(50,50,50,50)
  ca1: AreaP(2,2,100,2)  
  ca2: AreaP(3,3,100,3)
robots
  robot papelero
  variables
    p, f: numero
    hay: boolean
    av, ca:numero
    avanzado:numero
  comenzar
    derecha
    hay:=V
    av:=PosAv
    ca:=PosCa
    p:=0
    mientras(hay)
      BloquearEsquina(50,50)
      Pos(50,50)
      si(~HayPapelEnLaEsquina)  
        hay:=F
      sino
        juntarp(p)
      Pos(av, ca)
      LiberarEsquina(50,50)
    EnviarMensaje(p, r2)
    RecibirMensaje(f, r2)
    si(p > f)     
      Informar('MayorCantidadDePapeles',p)
    avanzado:=0
    mientras(PosCa < 100) &(avanzado < p)
      mover
      avanzado:=avanzado+1
  fin
  robot florero
  variables
    p, f: numero
    hay: boolean
    av, ca:numero
    avanzado:numero
  comenzar
    derecha
    hay:=V
    av:=PosAv
    ca:=PosCa
    f:=0
    mientras(hay)
      BloquearEsquina(50,50)
      Pos(50,50)
      si(~HayFlorEnLaEsquina)  
        hay:=F
      sino
        juntarf(f)
      Pos(av, ca)
      LiberarEsquina(50,50)
    EnviarMensaje(f, r1)
    RecibirMensaje(p, r1)
    si(f > p)     
      Informar('MayorCantidadDeFlores',f)
    avanzado:=0
    mientras(PosCa < 100) &(avanzado < f)
      mover
      avanzado:=avanzado+1
  fin
variables
  r1: papelero
  r2: florero
comenzar
  AsignarArea(r1, ca1)
  AsignarArea(r2, ca2)
  AsignarArea(r1, depo)
  AsignarArea(r2, depo)
  Iniciar(r1, 2,2)
  Iniciar(r2, 3,3)
fin
