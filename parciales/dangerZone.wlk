class Empleado{

    const habilidades = #{}
    const subordinados = #{}
    var property salud
    var property saludCritica
    method esJefe() = subordinados.notEmpty()

    method puedeUsarHabilidad(habilidad){
        if(!self.estaIncapacitado() && self.poseeHabilidad(habilidad)){
            return "Contiene la habilidad"
        }else{
            self.error("No posee dicha habilidad o esta incapacitado")
        }
    }

    method poseeHabilidad(habilidad) = habilidades.contains(habilidad) || (self.esJefe() && self.algunSubordinadoLaTiene(habilidad))

    method algunSubordinadoLaTiene(habilidad) = subordinados.any{subordinado => subordinado.puedeUsarHabilidad(habilidad)}


    method estaIncapacitado() = salud < self.saludCritica()
    method saludCritica()

    

}

class EmpleadoEspia inherits Empleado{
    override method saludCritica() = 15

    method estaIncapacitado() = salud < self.saludCritica()
}

class EmpleadoOficinista inherits Empleado{
    var property estrellas
    //var property estadoSupervivencia
/*
    method sobrevivirMision(){
        if(estadoSupervivencia == true){
            return 1
        }else{
            return 0
        }
    }
*/
    method ganarEstrella(){
        estrellas =  estrellas + 1
    }

    override method saludCritica() = 40 - 5 * estrellas

    override method estaIncapacitado() = salud < self.saludCritica()
}