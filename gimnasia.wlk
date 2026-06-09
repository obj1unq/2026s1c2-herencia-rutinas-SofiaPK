// Apunte CLASES https://docs.google.com/document/d/1yjNMBBlgqv_F_Fs1X7lBS54r-bexeD933dKOvh4oiRA/edit?tab=t.0#heading=h.8u2q0xt88h8h
// Apunte HERENCIA https://docs.google.com/document/d/1eCyXD-t7pnW_kDAUQLSD4Tu0nDsDOON4HsmBdk1vVvo/edit?tab=t.0#heading=h.n89qeecqm48s

import personas.*
import clubes.*

class Rutina {
    method cantCaloriasQueQuema(tiempoDePractica) {
        //100 * (tiempo - descanso) * intensidad
        return 100 * ( tiempoDePractica - self.descanso(tiempoDePractica) ) * self.intensidad()
    }

    method descanso(tiempoDePractica) 

    method intensidad()

}

class Running inherits Rutina {
    // La intensidad se establece para cada rutina en especial
    //var property intensidad
    const intensidad

    // El descanso es de 5 minutos si el tiempo es mayor a 20, si no 2
    override method descanso(tiempoDePractica) {
        return if (tiempoDePractica > 20) 5 else 2
    }

    override method intensidad() {
        return intensidad // <-- magic number
    }
}

class Maraton inherits Running {
    // Las calorías que gasta siempre es el doble de una rutina de running común
    override method cantCaloriasQueQuema(tiempoDePractica) {
        return super(tiempoDePractica) * 2 // repasar tema super()
    }
}

class Remo inherits Rutina{
    // La intensidad es siempre 1.3
    override method intensidad() {
        return 1.3
    }

    // El descanso es tiempo / 5
    override method descanso(tiempoDePractica) {
        tiempoDePractica / 5
    }
}

class RemoDeCompeticion inherits Remo{
    // La intensidad es siempre 1.7
    override method intensidad() {
        return 1.7
    }

    // El descanso son 3 minutos menos de lo que se descansa en una rutina de remo normal. Pero
    // ojo, si ese valor es menor a 2, entonces es 2 (Tip: usar el método max de los números)
    override method descanso(tiempoDePractica) {
        2.max( super(tiempoDePractica) - 3 )
    }

}