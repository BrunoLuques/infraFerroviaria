class VagonPasajeros {

	var property largo
	var property ancho
	var property tieneBanios
	var property estaOrdenado
	
	method cantidadDePasajeros(){
		const cantidadDePasajeros = if (ancho <= 3) largo * 8 else largo * 10		
		
		return if (not estaOrdenado)  cantidadDePasajeros - 15 else cantidadDePasajeros
	}
	method cantidadMaximaDeCarga() {return if(tieneBanios) 300 else 800}
	method mantenimientoDeVagon() {if(not estaOrdenado) estaOrdenado = true}
	method pesoMaximoDeVagon() {
		return 2000 + (self.cantidadDePasajeros() * 80) + self.cantidadMaximaDeCarga()
	}
		
}


class VagonDeCarga {
	var property cargaMaximaIdeal
	var property maderasSueltas
	
	method cantidadMaximaDeCarga() {
		return cargaMaximaIdeal - (400 * maderasSueltas)
	}
	
	method cantidadDePasajeros() {return 0}
	method tieneBanios(){return false}
	method pesoMaximoDeVagon() {return 1500 + self.cantidadMaximaDeCarga()}
	method mantenimientoDeVagon() {maderasSueltas = 0.max(maderasSueltas - 2)}
}


class VagonDormitorio {
	var property cantidadCompartimientos
	var property cantidadDeCamasEnCompartimiento
	
	method cantidadDePasajeros() {
		return cantidadCompartimientos * cantidadDeCamasEnCompartimiento
	}
	
	method mantenimientoDeVagon() {}
	method tieneBanios() {return true}
	method cantidadMaximaDeCarga() {return 1200}
	method pesoMaximoDeVagon() {
		return 4000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	}
}





















