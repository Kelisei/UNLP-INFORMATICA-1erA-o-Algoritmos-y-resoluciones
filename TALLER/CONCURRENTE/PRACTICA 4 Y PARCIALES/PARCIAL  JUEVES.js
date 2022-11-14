programa parcialFrancisco
procesos 
  proceso juntarP(ES p:numero)
  comenzar
    mientras(HayPapelEnLaEsquina)
      tomarPapel
      p:=p+1
  fin
  proceso dejarF
  comenzar
    si(HayFlorEnLaBolsa)
      depositarFlor
  fin
  proceso etapa(ES p:numero)
  comenzar  
    repetir 10
      juntarP(p)
      dejarF
      mover
  fin
  proceso etapaFinal(ES p:numero)
  comenzar  
    repetir 9
      juntarP(p)
      dejarF
      mover
    juntarP(p)
    dejarF
  fin
areas
  av1: AreaP(1,1,1,100)
  av2: AreaP(2,1,2,100)
  av3: AreaP(3,1,3,100)
  aj: AreaP(69,69,69,69)
  depo: AreaPC(80,80,80,80)
robots
  robot recorredor
  variables
    p:numero
    continuar:boolean
    avI, caI:numero
  comenzar
    repetir 9
      etapa(p)
      EnviarMensaje(V, rf)
      RecibirMensaje(continuar, rf)
    EnviarMensaje(V, rf)
    RecibirMensaje(continuar, rf)
    etapaFinal(p)
    avI:=PosAv
    caI:=PosCa
    repetir p
      BloquearEsquina(80,80)
      Pos(80,80) 
      depositarPapel
      Pos(avI, caI)
      LiberarEsquina(80,80)
    EnviarMensaje(p, rf)
  fin
  robot jefardo
  variables
    ok:boolean
    p, pr:numero
  comenzar
    repetir 10
      repetir 3
        RecibirMensaje(ok, *)
      EnviarMensaje(V, r1)
      EnviarMensaje(V, r2)
      EnviarMensaje(V, r3)
    repetir 3
      RecibirMensaje(pr, *)
      p:=p+pr
    Pos(80,80)
    repetir p
      tomarPapel
    Informar('reCOJIERON', p)
  fin
variables
  r1, r2, r3: recorredor
  rf: jefardo
comenzar
  AsignarArea(r1,av1)
  AsignarArea(r2,av2)
  AsignarArea(r3,av3)
  AsignarArea(rf,aj)
  AsignarArea(r1, depo)
  AsignarArea(r2, depo)
  AsignarArea(r3, depo)
  AsignarArea(rf, depo)
  Iniciar(r1,1,1)
  Iniciar(r2,2,1)
  Iniciar(r3,3,1)
  Iniciar(rf,69,69)
fin
