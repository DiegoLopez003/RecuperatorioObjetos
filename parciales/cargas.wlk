object camionVerduras{
    var property cantidadCajones = 0
    var property kilometraje = 700000


    method pesoCajaBase() = 50
    method maximaVelocidadCamion() = 80

    method carga() = cantidadCajones * self.pesoCajaBase()

    

    //method calculoCarga(cajas) = self.carga(cajas) / 500

    method velocidadMaxima(){
        return self.maximaVelocidadCamion() - self.carga()
    }
}

object camionScanion5000{
    method capacidadMaxima() = 5000 //su volumen
    method velocidadMaxima() = 140

    var property densidad = 0

    method carga() = self.capacidadMaxima() * densidad

}

object camionCerealero{
    var property nivelDeDeterioro = 0

    method velocidadBase() = 60

    method velocidadMaxima() = self.velocidadBase() - nivelDeDeterioro

    method cantidadCarga(cantidad) = cantidad

}

/*
-----------------------
        Puestos
-----------------------
*/

object puestoRutatlantica{

    //var property carga = 0
    const adicionalPorCarga = 100 // me sirve para los 1000kg
    const distanciaRecorrida = 400

    method cobrar(camion) = 7000 + self.cobroAdicional(camion)

    method cobroAdicional(camion) =  (camion.carga() / 1000) * adicionalPorCarga

    method dejarPasar(camion) = camion.velocidadMaxima() < 75

    method recorrido(camion) = camion.kilometraje() + distanciaRecorrida
}

