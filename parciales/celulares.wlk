object juliana{
    const modelo = "samsungS21"
    var property cantidadBateria = 0

    method cantidadBateria() = cantidadBateria.min(5).max(0)

    method cantBateria(){
        if(self.cantidadBateria() != 0){
            return self.cantidadBateria()
        }else {
            return "No hay bateria" //asumimos que al estar sin bateria, esta apagado
        }
    }
    method recargarBateria(cantidad){
        cantidadBateria += cantidad
    }

    method estaApagado(){
        return self.cantidadBateria() == 0
    }

    method llamar(){
        const cantidadDescuentoBateria = 0.25
        cantidadBateria = cantidadBateria - cantidadDescuentoBateria
    }


}

//catalina es similar a juliana, pero con un iphone 