import gimnasia.*
import clubes.*

class Persona {
    var property peso

    // El tiempo que ejercitan una rutina depende del tipo de persona en cuestión
    method tiempoDePractica()

    method kilosPorCaloriasQueQuema()

    // Cuidado, no siempre pueden hacer una rutina, cada tipo de persona tiene su regla
    method puedeHacerRutina(rutina)
    
    //Peso que pierde al hacer una rutina: calorias que baja la rutina en el tiempo que la practica / kilosPorCaloríaQuePierde
    method pesoQuePierdeAlHacerRutina(rutina) {
        return rutina.cantCaloriasQueQuema( self.tiempoDePractica() / self.kilosPorCaloriasQueQuema() )
    }

    // Que una persona aplique una rutina alterando su peso
    method aplicarRutina(rutina) {
        // validar
        self.validarSiPuedeAplicarRutina(rutina)
        // alterar el peso
        peso = peso - self.pesoQuePierdeAlHacerRutina(rutina)
    }

    method validarSiPuedeAplicarRutina(rutina) {
        if ( !self.puedeHacerRutina(rutina) ) {
            self.error("No puedes aplicar esta rutina")
        }
    }
}

class PersonaSedentaria inherits Persona {
    // El tiempo que ejercita una rutina se establece para cada persona sedentaria
    var property tiempoDePractica

    // La cantidad de kilosPorCaloría de las personas sedentarias es 7000
    override method kilosPorCaloriasQueQuema() {
        return 7000
    }

    // solo aplican una rutina si su peso es mayor a 50
    override method puedeHacerRutina(rutina){
        return peso > 50
    }
}

class PersonaAtleta inherits Persona {
    // Formula de peso que se pierde al hacer una rutina: (calorias que baja la rutina / kilosPorCaloría) - 1
    override method pesoQuePierdeAlHacerRutina(rutina){
        return super(rutina) - 1
    }

    // La cantidad de kilosPorCaloría de las personas atletas es 8000
    override method kilosPorCaloriasQueQuema() {
        return 8000
    }

    // El tiempo que ejercita una rutina es siempre 90
    override method tiempoDePractica() {
        return 90
    }

    // Solo realizan una rutina si las calorías que consumiría al realizarla es mayor a 10000
    override method puedeHacerRutina(rutina) {
        rutina.cantCaloriasQueQuema( self.tiempoDePractica() ) > 10000
    }

}