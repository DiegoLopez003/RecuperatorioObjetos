class Persona{
    var property posicion
    var property elementos = #{}

    method pedirElemento()
    method pasarElemento()

}


class PersonaSorda inherits Persona{
    override method pasarElemento(){
        elementos.head({elementos = elementos.tail()})
    }
}