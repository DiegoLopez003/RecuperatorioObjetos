object pepita {

    var property energia = 0
    var property ubicacion = 0

    method volar(kms){
        const vueloFijo = 10 //expresado en kilometros
        energia =energia - (kms + vueloFijo)
    }

    method comer(gramos){
        energia = energia + (gramos * 4)
    }

    method lugar(kms){
        ubicacion = kms
        self.volar(kms)
    }

    method distancia(kms){
        return (kms - self.ubicacion()).abs()
    }

    method puedeIrLugar(kmsSeleccionado){
        if(self.energia() >= (self.distancia(kmsSeleccionado)).energia()){
            return "Llegue al lugar"
        }else{
            return "No llegue al lugar"
        }
    }

}