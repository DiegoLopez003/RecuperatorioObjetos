class Animal {
  var property cantidadComida = 0 //en gramos
  var property peso = 0
  var property vacuna
  
  method comer(cantidad)
  
  method beber()
  
  method vacunar(animal)
  
  method tieneHambre(animal)
}

class Vaca inherits Animal {
  const pesoPerdido = 500
  var sed = true
  const pesoPerdidoCaminata = 3
  
  override method comer(cantidad){
    peso += cantidad / 3
    sed = true
  }
  
  override method beber() {
    peso -= pesoPerdido
    sed = false
  }
  
  override method vacunar(animal) {
    vacuna = true
  }
  
  method seVacuno(animal) {
    if (!animal.vacuna()) animal.vacunar(animal)
    else self.error("El animal ya fue vacunado")
  }
  
  override method tieneHambre(animal) = animal.peso() < 200

  method caminata(cantidad){
    peso = peso - pesoPerdidoCaminata * cantidad
  }
}
/*
class Cerdo inherits Animal{
    const animal
    override method comer(cantidad){
        if(cantidad > 200 && cantidad < 1000){
            peso += peso + cantidad

        }else if(cantidad < 200){
            self.error("La cantidad de comida es insuficiente")
        }else if(cantidad > 1000){
            self.tieneHambre(animal) = false
        }
    }
}*/

