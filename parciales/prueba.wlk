object pruebaDeListas{
    const prueba = [1,2,3]

    method agregar(numero) = prueba.add(numero)

    var prueba2 = #{5,6,7}
}

class Gato{
    var energia = 100

    method energia() = energia

    method pasear(cantidadKms){
        energia -= 5* cantidadKms
    }
}


const garfield = new Gato() 