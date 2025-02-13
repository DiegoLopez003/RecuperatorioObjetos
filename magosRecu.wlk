class Mago {
  var property nombre
  var property poderTotal = 0
  var property poderInnato = 0
  const objetosMagicos = #{}
  var property energiaMagica = 0 // es la reserva si es el desafiente
  var property resistenciaMagica = 0
  var property categoria

  method limitePoderInnato() = poderInnato.max(1).min(10) 

  method desafiar(adversario) {
    if(adversario.esVencido(self)){
      self.quitarEnergia(adversario)
    }
  }

  method quitarEnergia(adversario){
    const energiaRobada = adversario.energiaPerdida()
    self.ganarEnergia(energiaRobada)
  }

  method ganarEnergia(energiaExtraida) {
    energiaMagica  += energiaExtraida
  }

  method esVencido(atacante) = categoria.esVencido(atacante)
  
   method energiaPerdida() = categoria.energiaPerdida()

  method agregarObjetoMagico(objetoMagico) {objetosMagicos.add(objetoMagico)}

  method calculoPoderTotal() = (objetosMagicos.map({objeto => objeto.poderMagico()})).sum() * self.poderInnato()
}

/*
-----------------
    Magos
-----------------

*/

object magoAprendiz {
  var property resistenciaMagica = 0
  var property energiaMagica = 0
  method esVencido(atacante) = self.resistenciaMagica() < atacante.calculoPoderTotal()
  method energiaPerdida(){
    energiaMagica = energiaMagica / 2
  }
}

object magoVeterano{
  var property resistenciaMagica = 0
  var property energiaMagica = 0
  method esVencido(atacante) = atacante.calculoPoderTotal() >= self.resistenciaMagica() * 1.5
  method energiaPerdida(){
    energiaMagica -= energiaMagica/4
  }
}


object magoInmortal{
  method esVencido(atacante) = false

  method energiaPerdida() = 0
}


/*
-----------------
Objetos Magicos
-----------------

*/

class ObjetoMagico {
  var property poderBase = 0
  //var property tipoObjeto
  
  method agregarPoderMagico()
  
  method poderMagico(mago)
}

class Varita inherits ObjetoMagico {
  override method poderMagico(nombreMago) {
    if (nombreMago.size().even()) {
      return poderBase + poderBase * 0.5
    } else {
      return poderBase
    }
  }
}

class TunicaComun inherits ObjetoMagico{
    override method poderMagico(mago){
        return poderBase + mago.resistenciaMagica() * 2
    }
}

class TunicaEpica inherits ObjetoMagico{
    const valorFijoPoder = 10
    override method poderMagico(mago){
        return poderBase + mago.resistenciaMagica() * 2 + valorFijoPoder
    }
}

class Amuleto inherits ObjetoMagico{
    method poderMagico() = 200
}

object ojotas{
  method poderBase(mago) = mago.nombre().size() * 10
} 


