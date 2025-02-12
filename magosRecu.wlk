class Mago {
  var property nombre
  var property resistenciaMagica = 0
  var property poderTotal = 0
  var property poderInnato = 0
  
  method poderInnato() = poderInnato.min(10).max(0)
}

class ObjetoMagico {
  var property poderBase = 0
  var property tipoObjeto
  
  method agregarPoderMagico()
  
  method poderMagico(mago)
}

class Varita inherits ObjetoMagico {
  override method poderMagico(mago) {
    if (mago.size().even()) {
      return poderBase * 0.5
    } else {
      return poderBase
    }
  }
}