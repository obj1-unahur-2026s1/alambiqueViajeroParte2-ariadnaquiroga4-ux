import elAlambiqueViajero.*
object centroInscrpcion {
    const inscriptos = []
    const rechazados = []
    var ciudad = paris
    method puedeCompetir(vehiculo) {
        if (ciudad.puedeLlegar(vehiculo)) {
            inscriptos.add(vehiculo)
        } else {
            rechazados.add(vehiculo)
        }
    }
    method cambiarCiudad(nuevaCiudad) {
        ciudad = nuevaCiudad
        inscriptos.filter({ v => !ciudad.puedeLlegar(v) }).forEach({ v => inscriptos.remove(v) rechazados.add(v) })
        rechazados.filter({ v => ciudad.puedeLlegar(v) }).forEach({ v => rechazados.remove(v) inscriptos.add(v) })
    }
    method vehiculosALaCiudad() {
        inscriptos.all({v => v.desgaste()})
    }
    method ganador() {
        inscriptos.min({v => v.tiempoHasta(ciudad)})
    }
    
}