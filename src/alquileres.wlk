class Departamento {
	var property superficie
	var property artefactos
	var property cantidadHabitaciones
	var property barrio
	
	method esEspacioso() {
		if (cantidadHabitaciones <= 2) {
			return superficie > 45
		} else {
			return superficie > 75
		}
	}
	
	method consumoElectrico() { 
		return cantidadHabitaciones * 300 + artefactos.sum { arte => arte.consumoElectrico() }
	}
	method accesorioMasAlto() {  return artefactos.max { arte => arte.altura() } }
	method tieneCalefaccion() { return artefactos.any { arte => arte.daCalor() } }
	method cantidadArtefactosAltoConsumo() {
		return artefactos.count { arte => arte.consumoElectrico() > 400 }
	}
	
	method puedeOfrecerseEnLugarDe(depto) {
		return self.barrio() == depto.barrio() 
			and (self.superficie() - depto.superficie()).abs() < 10
	}
}

class EstufaDeCuarzo {
	method consumoElectrico() { return 700 }
	method altura() { return 60 }
	method daCalor() { return true }
}

class AireAcondicionado {
	var property esFrioCalor
	var property frigorias
	method consumoElectrico() { return frigorias / 4 }
	method altura() { return 40 + (frigorias / 100) }
	method daCalor() { return esFrioCalor }
}

class Mesa { 
	var property alturaPatas
	var property tieneBordeLuminoso
	
	method consumoElectrico() { return (if (tieneBordeLuminoso) { 80 } else { 0 }) }
	method altura() { return alturaPatas + 20 }
	method daCalor() { return false }
}


class Inmobiliaria {
	var property deptos
	
	method departamentosFamiliares() { return deptos.filter { depto => depto.cantidadHabitaciones() >= 3 } }
	method barrios() { return deptos.map { depto => depto.barrio() } .asSet() }
	method toleraElInvierno() { return deptos.any { depto => depto.tieneCalefaccion() } }
	method puedeCertificarBajoConsumo(wh) {
		return deptos.all { depto => depto.consumoElectrico() <= wh }
	}
}




























