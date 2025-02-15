/*
-----------------
    Gremios
-----------------
*/
class Gremio {
  const magos = #{}
  var property liderGremio
  //const esGremio = {magos => magos.size() >=2}
  //var property energiaMagicaGremio


  method agregarMago(mago) {magos.add(mago)}

  method resistenciaMagicaGremio() = magos.map({mago=>mago.resistenciaMagica()}).sum()+liderGremio.resistenciaMagica()
  
  method esGremio() {
    magos.size() >= 2
  } 

  

  //----------------- PODER TOTAL DEL GREMIO -----------------
  method poderTotalGremio() = magos.map({mago => mago.poderTotal()}).sum()
  //----------------- RESERVA MAGICA DEL GREMIO -----------------
  method reservaMagicaGremio() = magos.map({mago => mago.energiaMagica()}).sum()
  //----------------- ENGRENTAMIENTO -----------------
  method vence(oponente){
    if(self.resistenciaMagicaGremio() > oponente.poderTotal()){
      liderGremio.vence(oponente)
    }
    return self.resistenciaMagicaGremio() > oponente.poderTotal()
  }

}

/*
-----------------
    Magos
-----------------

*/

class Mago {
  var property nombre
  var property poderTotal = 0
  var property poderInnato = 0
  const objetosMagicos = #{}
  var property energiaMagica  
  var property resistenciaMagica = 0
  var property categoriaMago

  method poderInnato(){
    poderInnato = poderInnato.max(1).min(10)
    return poderInnato
  }

  method agregarObjetoMagico(objetoMagico) {objetosMagicos.add(objetoMagico)}


  //----------------- PODER MAGICO -----------------
  method calculoPoderTotal() = (objetosMagicos.map({objeto => objeto.poderMagico()})).sum() * poderInnato
  //----------------- ENFRENTAMIENTO -----------------
  method vence(oponente){
    if(oponente.esVencidoPor(self)){
      energiaMagica = energiaMagica + oponente.energiaPerdida()
    }
    return oponente.esVencidoPor(self)
  }
}

class Oponente {
  var property resistenciaMagica = 0
  var property energiaMagica = 0

  method esVencidoPor(mago)
  method energiaPerdida() = 0
}

object magoAprendiz inherits Oponente{
  override method esVencidoPor(mago) = resistenciaMagica < mago.poderTotal()
  override method energiaPerdida() = energiaMagica / 2
}

object magoVeterano inherits Oponente{
  override method esVencidoPor(mago)= 1.5*resistenciaMagica <= mago.poderTotal()
  override method energiaPerdida() = energiaMagica / 4
}

object magoInmortal inherits Oponente{
  override method esVencidoPor(mago) = false
}

/*
-----------------
Objetos Magicos
-----------------

*/

class ObjetoMagico {
  var property poderBase = 0
  //var property tipoObjeto
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
  const poderEstraFijo = 10
  override method poderMagico(mago){
    return poderBase + mago.resistenciaMagica() * 2 + poderEstraFijo
  }
}

class Amuleto inherits ObjetoMagico{
  override method poderMagico(mago) = 200
}

object ojotas inherits ObjetoMagico{ 
  override method poderMagico(mago) = mago.nombre().size() * 10 + poderBase
}
/*

const varitaBasica = new Varita(poderBase = 50)
const tunicaComun = new TunicaComun(poderBase = 30)
const tunicaEpica = new TunicaEpica(poderBase = 40)
const amuletoPoderoso = new Amuleto()

const magoAprendiz1 = new Mago(nombre = "Harry", poderInnato = 5, energiaMagica = 100, resistenciaMagica = 50, categoriaMago = magoAprendiz)
const magoAprendiz2 = new Mago(nombre = "Ron", poderInnato = 3, energiaMagica = 80, resistenciaMagica = 40, categoriaMago = magoAprendiz)

const magoVeterano1 = new Mago(nombre = "Dumbledore", poderInnato = 10, energiaMagica = 300, resistenciaMagica = 150, categoriaMago = magoVeterano)
const magoVeterano2 = new Mago(nombre = "Gandalf", poderInnato = 9, energiaMagica = 280, resistenciaMagica = 140, categoriaMago = magoVeterano)

const magoInmortal1 = new Mago(nombre = "Merlin", poderInnato = 10, energiaMagica = 500, resistenciaMagica = 200, categoriaMago = magoInmortal)
const magoInmortal2 = new Mago(nombre = "Morgana", poderInnato = 10, energiaMagica = 450, resistenciaMagica = 190, categoriaMago = magoInmortal)

*/