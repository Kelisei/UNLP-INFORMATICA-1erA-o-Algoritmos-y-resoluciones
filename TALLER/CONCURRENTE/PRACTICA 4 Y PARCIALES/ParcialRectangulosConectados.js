programa parcialxd
procesos
  proceso juntarf(ES f:numero)
  comenzar
    mientras(HayFlorEnLaEsquina)
      tomarFlor
      f:=f+1
  fin
  proceso juntarp(ES p:numero)
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
      p:=p+1
  fin
  proceso ladoCorto(ES f:numero; ES p:numero)
  comenzar
    repetir 2
      juntarp(p)
      juntarf(f)
      mover
  fin
  proceso bloquearYpasar1(ES f:numero; ES p:numero)
  comenzar
    BloquearEsquina(PosCa, PosAv +1)    
    repetir 2
      juntarp(p)
      juntarf(f)
      mover
    LiberarEsquina(PosCa, PosAv -1)
  fin
  proceso bloquearYpasar2(ES f:numero; ES p:numero)
  comenzar
    BloquearEsquina(PosCa, PosAv -1)
    repetir 2 
      juntarp(p)
      juntarf(f)
      mover
    LiberarEsquina(PosCa, PosAv +1)
  fin
  proceso bloquearYpasar3(ES f:numero; ES p:numero)
  comenzar
    BloquearEsquina(PosCa+1, PosAv)    
    repetir 2
      juntarp(p)
      juntarf(f)
      mover
    LiberarEsquina(PosCa -1, PosAv)
  fin
  proceso bloquearYpasar4(ES f:numero; ES p:numero)
  comenzar
    BloquearEsquina(PosCa -1, PosAv)
    repetir 2 
      juntarp(p)
      juntarf(f)
      mover
    LiberarEsquina(PosCa+1, PosAv)

  fin
areas
  a1: AreaPC(1,1,9,9)
  spawn1: AreaPC(20,1,20,1)
  spawn2: AreaPC(20,2,20,2)
  spawn3: AreaPC(20,4,20,4)
  spawn4: AreaPC(20,5,20,5)
  spawnrf: AreaP(20,15,20,15)
robots
  robot horizontal
  variables
    id:numero
    f, p:numero
  comenzar
    RecibirMensaje(id, rf)
    si(id = 1)
      Pos(1, 2)
    sino
      Pos(1,6)
    ladoCorto(f, p)
    derecha
    repetir 4
      bloquearYpasar1(f, p)
    derecha
    ladoCorto(f, p)
    derecha
    repetir 4
      bloquearYpasar2(f, p)
    EnviarMensaje(id, rf)
    EnviarMensaje(f, rf)
    EnviarMensaje(p, rf)
  fin
  robot vertical
  variables
    id:numero
    f, p:numero
  comenzar
    RecibirMensaje(id, rf)
    si(id = 3)
      Pos(2,1)
    sino
      Pos(6,1)
    repetir 4
      bloquearYpasar3(f,p)
    derecha
    ladoCorto(f,p)
    derecha
    repetir 4
      bloquearYpasar4(f,p)
    derecha
    ladoCorto(f,p)
    EnviarMensaje(id, rf)
    EnviarMensaje(f, rf)
    EnviarMensaje(p, rf)
  fin
  robot jefe
  variables
    id: numero
    totalF, totalP, f, p:numero
  comenzar
    EnviarMensaje(1, r1)
    EnviarMensaje(2, r2)
    EnviarMensaje(3, r3)
    EnviarMensaje(4, r4)
    totalF:=0
    totalP:=0
    repetir 4
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(f, r1)
        RecibirMensaje(p, r1)
      sino
        si(id = 2)
          RecibirMensaje(f, r2)
          RecibirMensaje(p, r2)
        sino
          si(id = 3)
            RecibirMensaje(f, r3)            
            RecibirMensaje(p, r3)
          sino
            RecibirMensaje(f, r4)
            RecibirMensaje(p, r4)
      totalF:=totalF+f
      totalP:=totalP+p
    Informar(totalF, totalP)      
  fin
variables
  r1:horizontal
  r2:horizontal
  r3, r4:vertical
  rf: jefe
comenzar
  AsignarArea(r1, a1)
  AsignarArea(r2, a1)
  AsignarArea(r3, a1)
  AsignarArea(r4, a1)
  AsignarArea(r1, spawn1)
  AsignarArea(r2, spawn2)
  AsignarArea(r3, spawn3)
  AsignarArea(r4, spawn4)
  AsignarArea(rf, spawnrf)
  Iniciar(r1, 20,1)
  Iniciar(r2, 20,2)
  Iniciar(r3, 20,4)
  Iniciar(r4, 20,5)
  Iniciar(rf, 20,15)
fin
