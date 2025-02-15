/*
-------------------
    Jugadores
-------------------
*/

class Jugador{
    var property personalidad
    var property vida
    var property skin
    const items = []
    var property arma

    method modificarVida(cantidadExtra){
        vida  = (vida + cantidadExtra).max(0).min(100)
    }

    method curarse(cantidad){
        self.modificarVida(cantidad)
    }
    
    method menorA(cantidad) = vida < cantidad
    method hacerDanio(jugador, rival)

    method recibirDanio(cantidad){
        self.modificarVida(-cantidad)
    }
    method danioArma() = arma.danio()

    //items

    method obtenerItem(item){
        return items.add(item)
    }
    method potenciarArma(potenciador){
        arma.potenciador(potenciador)
    }

    method usarItem(item, rival){
        item.usar(self, rival)
    }

}
/*
-------------------
    Jugadores
-------------------
*/

class Estandar {
    method danio(jugador) = jugador.danioArma() * self.modificadorDanio(jugador)

    method modificadorDanio(jugador) = 1

    //method zonasAAvanzar() = 1
}

const estandar = new Estandar()

object arriesgado inherits Estandar{
    override method modificadorDanio(jugador){
        if(jugador.menorA(50))
            return 1.25
        if(jugador.menorA(10))
            return 2
        return super(jugador)
    }
}

object camper inherits Estandar{
    
}

object ninioRata inherits Estandar{
    override method modificadorDanio(jugador) = 0.8
}


/*
-------------------
    Armas
-------------------
*/

class Arma{
    var potenciador = sinPotenciador

    method danioBase()
    method danio() = self.danioBase() + potenciador.danio()
    method potenciador(nuevoPotenciador){
        potenciador = nuevoPotenciador
    }

}

class Pistola inherits Arma{
    override method danioBase() = 5

}

class Escopeta inherits Arma{
    override method danioBase() = 20
}

class Rifle inherits Arma{
    override method danioBase() = 22
}

class Cuchillo inherits Arma{
    override method danioBase() = 10
}

object cuchillo{
    method danio() = 10
    method cambiarPotenciador(nuevoPotenciador) {
        // No hace nada, no puede tener potenciador
    }
}

/*
-------------------
    ITEMS
-------------------
*/

class ItemDeDanio{
    method esDeCura() = false
}

class Potenciador inherits ItemDeDanio{
    const property danioExtra

    method usar(jugador, rival){
        jugador.potenciarArma()
    }
}

const sinPotenciador = new Potenciador(danioExtra = 0)
const balasDeFuego = new Potenciador(danioExtra = 5)
const silenciador = new Potenciador(danioExtra = 3)

class ItemDeCura{
    const cantidadCurar

    method usar(jugador){
        jugador.modificarVida(cantidadCurar)
    }

    method esDeCura() = true


}

const botiquin = new ItemDeCura(cantidadCurar = 100)
const mini = new ItemDeCura(cantidadCurar = 30)

object granada inherits ItemDeDanio{
    method usar(jugador, rival){
        rival.recibirDanio(30)
    }
}