# Bloquear En Linea:
```js
  proceso bloquearYpasar1(ES f:numero; ES p:numero)
  comenzar
    BloquearEsquina(PosCa, PosAv +1)    
    repetir 2
      juntarp(p)
      juntarf(f)
      mover
    LiberarEsquina(PosCa, PosAv -1)
  fin
```

# Recibir y maximo:
```js
    repetir 3
      RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(pasos, r1)
      sino
        si(id = 2)
          RecibirMensaje(pasos, r2)
        sino
          RecibirMensaje(pasos, r3)
      si(pasos > maxpasos)
        idmax:=id
        maxpasos:=pasos
```

# Dejar en un lugar de a uno:
```js
    repetir p
      BloquearEsquina(80,80)
      Pos(80,80) 
      depositarPapel
      Pos(avI, caI)
      LiberarEsquina(80,80)
```
# Quien termino primero:
```js
  repetir 2
    RecibirMensaje(id, *)
      si(id = 1)
        RecibirMensaje(pasos, r1)
      sino
        si(id = 2)
          RecibirMensaje(pasos, r2)
  si(id = 2
    Informar('gano-1',0)
  sino
    Informar('gano-2',0)
     
```
# Juntar:

```js
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
```
