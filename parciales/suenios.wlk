class Persona {
    var cantidadHijos = 0
    var felicidonios = 0
	const suenios = []
    const lugaresVisitados = []
    const carrerasQueQuiereEstudiar = []
	const carrerasCompletadas = []
    var property tipoPersona
	
	method cumplir(suenio) {
		if (!self.sueniosPendientes().contains(suenio)) {
			throw new UserException(message = "El sueño " + suenio + " no está pendiente")
		}
		suenio.cumplir(self)
	}
	
	method sueniosPendientes() = suenios.filter { suenio => suenio.estaPendiente() }
    
    //Hijos
    method tieneHijos() = cantidadHijos > 0
	
	method agregarHijos(cantidad) {
		cantidadHijos += cantidad
	}

    //viajar

    method viajarA(lugar) {
		lugaresVisitados.add(lugar)
	}

    //recibirse

    
	
	method quiereEstudiar(carrera) = carrerasQueQuiereEstudiar.contains(carrera)
	
	method completoCarrera(carrera) = carrerasCompletadas.contains(carrera)
	
	method completarCarrera(carrera) {
		carrerasCompletadas.add(carrera)
	}
    
    method cumplirSuenioElegido() {
		const suenioElegido = tipoPersona.elegirSuenio(self.sueniosPendientes())
		self.cumplir(suenioElegido)
	}

    method sumarFelicidad(cantidad){
        felicidonios = felicidonios + cantidad
    }

    method esFeliz() = felicidonios > self.sueniosPendientes().sum { suenio => suenio.felicidonios() } 
	// sirve así para sueños simples o múltiples

    method esAmbiciosa() = self.sueniosAmbiciosos().size() > 3
	method sueniosAmbiciosos() = suenios.filter { suenio => suenio.esAmbicioso() }


}

class Suenio {
	var cumplido = false
    var felicidonios = 0

	method estaPendiente() = !cumplido

    method validar(persona)
    method realizar(persona)

	method cumplir(persona) {
		self.validar(persona)
		self.realizar(persona)
		self.cumplir()
		persona.sumarFelicidad(felicidonios)
	}
	
	method cumplir() { cumplido = true }
    method felicidonios()

    method esAmbicioso() = self.felicidonios() > 100 
}

class SuenioSimple {
	var felicidonios = 0
	method felicidonios() = felicidonios
}

class SuenioMultiple inherits Suenio {
	const suenios = []
	
	override method felicidonios() = suenios.sum { suenio => suenio.felicidonios() } 
	// los sueños múltiples deben sumar los felicidonios de sus sueños

	override method validar(persona) {
		suenios.forEach { suenio => suenio.validar(persona) }
	}
	
	override method realizar(persona) {
		suenios.forEach { suenio => suenio.realizar(persona) }
	}	
}

class AdoptarHijo inherits Suenio {
	const hijosAAdoptar // const si los sueños son inmutables, o var si queremos que se modifique
	
	override method validar(persona) {
		if (persona.tieneHijos()) {
			error.throwExceptionWithMessage("No se puede adoptar si se tiene un hijo")
		}
	}
	
	override method realizar(persona) {
		persona.agregarHijos(hijosAAdoptar)
	}
}

class Viajar inherits Suenio {
	const lugar
	
	override method validar(persona) {
		// Sin comportamiento
	}
	
	override method realizar(persona) {
		persona.viajarA(lugar)
	}
}

class Recibirse inherits Suenio {
	const carrera  // o var, como dijimos antes si queremos inmutabilidad/mutabilidad
	
	override method validar(persona) {
		if (!persona.quiereEstudiar(carrera)) {
			error.throwExceptionWithMessage(persona.toString() + " no quiere estudiar " + carrera)
		}
		if (persona.completoCarrera(carrera)) {
			error.throwExceptionWithMessage(persona.toString() + " ya completó los estudios de " + carrera)
		}
	}
	
	override method realizar(persona) {
		persona.completarCarrera(carrera)
	}
}

object realista { // strategy stateless
	method elegirSuenio(sueniosPendientes) {
		sueniosPendientes.max { suenio => suenio.felicidonios() }
	}
}

object alocado { // strategy stateless
	method elegirSuenio(sueniosPendientes) {
		sueniosPendientes.anyOne()
	}
}

object obsesivo { // strategy stateless
	method elegirSuenio(sueniosPendientes) {
		sueniosPendientes.first()
	}
}