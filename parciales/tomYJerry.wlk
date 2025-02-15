object tom {
  var property energia = 0
  var property velocidad = 0

  method velocidad(segundos){
    velocidad = 5 * segundos + (energia / 10)
  }
  /*
  -----------------------------
    Actividades
  -----------------------------
  */

  method come(unRaton) {
    energia += self.comer(unRaton) //basicamente se modifica la energia dependiendo de la "accion" de comer que la aplico a mi mismo
  }

  method energiaPorCorrer(metros) = 0.5 * metros

  method comer(pesoRaton) = 12 + pesoRaton // revisar si se usa return 
  

  method correr(cantidadMetros){
    //velocidad = 5 * segundos + (energia / 10) revisar si se usa return
    energia = energia - self.energiaPorCorrer(cantidadMetros)
  }

  method meConvieneComerRatonA(unRaton, unaDistancia){
    self.comer(unRaton) > self.energiaPorCorrer(unaDistancia)
  }

}