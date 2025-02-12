class Mago {
  var property nombre
  var property poderTotal = 0
  var property poderInnato = 0
  const objetosMagicos = #{}
  var energiaMagica = 0 // es la reserva si es el desafiente
  var property resistenciaMagica = 0

  method vencido(mago, desafiado)

  method limitePoderInnato() = poderInnato.max(1).min(10) 
  

  method agregarObjetoMagico(objetoMagico) {objetosMagicos.add(objetoMagico)}

  method calculoPoderTotal() = (objetosMagicos.map({objeto => objeto.poderMagico()})).sum() * self.poderInnato()
}

/*
-----------------
    Magos
-----------------

*/



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


