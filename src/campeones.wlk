import items.*
import oleadas.*

class Campeon {
	// Atributos del campeon
	var puntosDeDanio = 0
	var property puntosDeVida 
	var property puntosDeAtaque
	var estaMuerto = false
	const property items = #{}
	var puntosDeBloqueo = 0
	
	// Metodos de consulta sobre el estado del campeon
	method estaMuerto() = estaMuerto
	
	method puntosDeDanio() = puntosDeDanio
	method puntosDeVidaTotal() = puntosDeVida + self.totalDePuntosDeVidaDeItems()
	method puntosDeAtaqueTotal() = puntosDeAtaque + self.totalDePuntosDeAtaqueDeItems()
	method totalDePuntosDeVidaDeItems() = items.sum({i => i.puntosDeVida(self)})
	method totalDePuntosDeAtaqueDeItems() = items.sum({i => i.puntosDeAtaque(self)})
	method itemQueOtorgaMasPuntosDeVida() = 
		items.max({i => i.puntosDeVida(self)})
		
	method itemQueOtorgaMasPuntosDeAtaqueQueDeVida() =
		items.max({i=> i.diferenciaEntreAtaqueyVida(self)})
		
	method hayAlgunItemQueOtorgueMasDe70PuntosDeVida() =
		items.any({i => i.puntosDeVida(self) > 70})
		
	method hayAlgunItemQueOtorgueMasDe30PuntosDeVida() =
		items.any({i => i.puntosDeAtaque(self) > 30})
	
	method pesosDeLosItems() = 
		items.map({i => i.peso()})
	
	method itemsQuePesanMenosDe300Gramos() = 
		items.filter({i => i.peso() < 300})
	
	
	
	// Metodos de indicacion para equipar y desequipar items 
	method equiparItem(unItem) {
		items.add(unItem)
		
	}	
	
	method desequiparItem(unItem) {
		items.remove(unItem)
	}	
	
	// Metodo de indicacion en caso de ataque 
	method recibirAtaque(unaOleada){
		unaOleada.efectoDeLaBatallaContra(self)
		puntosDeDanio += unaOleada.danio()
		self.registrarCampeonMuertoSiCorresponde()
		
	}
	
	method registrarCampeonMuertoSiCorresponde() {
		if (puntosDeDanio > self.puntosDeVidaTotal()){
			estaMuerto = true
			puntosDeVida = 0
			puntosDeAtaque = 0
		}
	}
	
	method puntosDeBloqueo(puntos) {
		puntosDeBloqueo += puntos
	}	
	
	method puntosDeDanio(puntos) {
		puntosDeDanio = 0.max(puntosDeDanio + puntos)
	}	
}
