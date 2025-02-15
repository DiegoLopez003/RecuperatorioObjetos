object pepe{
    var property sueldoNeto = 0
    var property cantidadTotalSueldo = 0
    var property cantidadFaltas = 0

    method sueldo(){
        //return  self.sueldoNeto() + bono + self.bonoPorResultado()
    }
}

object gerente{
    method neto() = 1000
}

object cadete{
    method neto() = 1500
}

object noFaltoNunca{
    method monto(empleado){
        if(empleado.cantidadFaltas() == 0){
            return 100
        }
        else if(empleado.cantidadFaltas() == 1){
            return 50
        }
        else{
            return 0
        }
    }
}

object bonoPorcentaje{
    method monto(empleado){
        return empleado.sueldoNeto() * 0.1
    }
}

object bonoFijo{
    method monto(empleado){
        return 80
    }
}

object bonoNulo{
    method monto(empleado){
        return 0
    }
}

