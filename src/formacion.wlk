import vagones.*

class Formacion {

	var property listaVagones = []
	var property listaLocomotoras = []

	method agregarAFormacion(vagon) {
		listaVagones.add(vagon)
	}

	method removerDeFormacion(vagon) {
		listaVagones.remove(vagon)
	}

	method agregarLocomotora(locomotora) {
		listaLocomotoras.add(locomotora)
	}

	method removerLocomotora(locomotora) {
		listaLocomotoras.remove(locomotora)
	}
	
	method pasajerosQuePuedeLlevar() {
		return listaVagones.sum({vagon => vagon.cantidadDePasajeros()})
	}
	
	method vagonesPopulares() {
		return listaVagones.count({vagon => vagon.cantidadDePasajeros() > 50})
	}
	
	method formacionCarguera() {
		return listaVagones.all({vagon => vagon.cantidadMaximaDeCarga() > 1000})
	}
	
	method vagonMasPesado() {
		return listaVagones.max({vagon => vagon.pesoMaximoDeVagon()})
	}
	
	method pesoVagonMasPesado() {
		return self.vagonMasPesado().pesoMaximoDeVagon()
	}

	method pesoVagonMasLiviano() {
		return listaVagones.min({vagon => vagon.pesoMaximoDeVagon()}).pesoMaximoDeVagon()
	}
	
	method pesoTotalDeVagones() {
		return listaVagones.sum({ vagon => vagon.pesoMaximoDeVagon() })
	}

	method dispercionDePesos() {
		return self.pesoVagonMasPesado() - self.pesoVagonMasLiviano()
	}
	
	method cantidadDeVagonesConBanios() {
		return listaVagones.count({vagon => vagon.tieneBanios()})
	}
	
	method mantenimientoDeFormacion() {
		listaVagones.forEach({vagon => vagon.mantenimientoDeVagon()})
	}
	
	method vagonesDePasajeros() {
		return listaVagones.filter({vagon => vagon.cantidadDePasajeros() > 0})
	}

	method vagonConMasPasajeros() {
		return self.vagonesDePasajeros().max({vagon => vagon.cantidadDePasajeros()})
	}

	method vagonConMenosPasajeros() {
		return self.vagonesDePasajeros().min({vagon => vagon.cantidadDePasajeros()})
	}
	
	method vagonesSinPasajeros(){
		return listaVagones.filter({vagon => vagon.cantidadDePasajeros() == 0})
	}
	
	method estaEquilibradoEnPasajeros() {
		return 
			self.vagonConMasPasajeros().cantidadDePasajeros() - 
			self.vagonConMenosPasajeros().cantidadDePasajeros() < 20
	}
	
	method estaOrganizado() { 
		const ordenada = []
		
		ordenada.addAll(self.vagonesDePasajeros())
		ordenada.addAll(self.vagonesSinPasajeros())
		return ordenada == listaVagones
	}
	
	// Etapa 2-Locomotoras
	
	method velocidadMaxima() {
		return listaLocomotoras.min({locomotora => locomotora.velocidadMaxima()}).velocidadMaxima()
	}

	method esEficiente() {
		return listaLocomotoras.all({locomotora => locomotora.locomotoraEficiente()})
	}

	method totalArrastreDeLocomotoras() {
		return listaLocomotoras.sum({locomotora => locomotora.cuantoPesoPuedeArrastrar()})
	}

	method puedeMoverse() {
		return self.totalArrastreDeLocomotoras() >= self.pesoMaximoDeFormacion()
	}
	
	method pesoMaximoDeFormacion() {
		return listaLocomotoras.sum({locomotora => locomotora.peso()}) + self.pesoTotalDeVagones()
	}

	method kilosDeEmpujeLeFaltan() {
		return 
			if (not self.puedeMoverse()) 
				self.pesoMaximoDeFormacion() - self.totalArrastreDeLocomotoras()
				else 0
	}

	method esCompleja() {
		return 
			listaLocomotoras.size() + listaVagones.size() > 8 or self.pesoMaximoDeFormacion() > 80000
	}
}


















