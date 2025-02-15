class Micro{
    var property capacidadParados = 0
    var property capacidadSentados = 0
    var property capacidad = 0
    var property volumen

    var property sentados
    var property parados
    var property totalParadosSentado = sentados + parados

    method puedeSubir(persona){
        return capacidadParados + capacidadSentados < capacidad && persona.aceptaSubir()
    }

    method condicionSubir(persona){
        if(!self.puedeSubir(persona)){
            self.error("No se puede subir a la persona")
        }
        else{
            if((capacidadSentados > 0 && persona.estadoPreferencia() == "sentado") || (capacidadSentados > 0 && persona.estadoPreferencia() == null)){
                capacidadSentados -= 1
                sentados += 1
                persona.asignarAsiento("sentado")
            }
            else if(capacidadParados > 0 && persona.estadoPreferencia() == "parado"){
                capacidadParados -= 1
                parados += 1
                persona.asignarAsiento("parado")
            }
            else if(capacidadParados > 0 && capacidadSentados == 0){
                capacidadParados -= 1
                parados += 1
                persona.asignarAsiento("parado")
            }
        }
    }

    method bajar(persona){
        if(totalParadosSentado == 0){
            self.error("No hay nadie en el micro, no hay razon para obligar a bajar")
        }
        else{
            if(persona.asientoElegido() == "sentado"){
                capacidadSentados += 1
                sentados -= 1
            }
            else if(persona.asientoElegido() == "parado"){
                capacidadParados += 1
                parados -= 1
            }
        }
    }
}

class Pasajero{

    var property micro
    const property estadoPreferencia
    var property asientoElegido = null
    method asignarAsiento(asiento){asientoElegido = asiento}
    
    method aceptaSubir()
}

class PasajeroApurado inherits Pasajero (estadoPreferencia = "NULL"){
    override method aceptaSubir() = true
}

class PasajeroClaustrofobico inherits Pasajero(estadoPreferencia = "NULL"){
    override method aceptaSubir() = micro.volumen() > 120
}

class PasajeroFiaca inherits Pasajero (estadoPreferencia = "sentado"){
    override method aceptaSubir() = micro.capacidadSentados() < micro.capacidad()
}

class PasajeroModerado inherits Pasajero (estadoPreferencia = "NULL"){
    override method aceptaSubir() = micro.lugaresLibres() < micro.capacidad() // revisar
}

class PasajeroObsecuente inherits Pasajero (estadoPreferencia = "NULL"){
    var property jefe
    override method aceptaSubir() = jefe.puedeSubir()
}

