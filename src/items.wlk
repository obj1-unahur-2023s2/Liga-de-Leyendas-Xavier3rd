import campeones.*

class Item {
	const property peso
	
	
	method puntosDeVida(unCampeon){
		if (peso <= 500){
			return 20
		}
		else{
			return 40
		}
	}	
	
	method puntosDeAtaque(unCampeon){
		if (peso <= 500){
			return 10 
		}
		else{
			return 5
		}
	}	
	
	method diferenciaEntreAtaqueyVida(unCampeon) = 
		self.puntosDeAtaque(unCampeon) - self.puntosDeVida(unCampeon)
		

	method efectoDeEqupamiento(unCampeon) 
	method efectoDeDesequipamiento(unCampeon)
}

class AnilloDeDoran inherits Item {
	
	override method puntosDeVida(unCampeon) = super(unCampeon) + 60
	override method puntosDeAtaque(unCampeon) = super(unCampeon) + 15	
	
	override method efectoDeEqupamiento(unCampeon) {unCampeon.puntosDeDanio(5)}
	override method efectoDeDesequipamiento(unCampeon) {unCampeon.puntosDeDanio(-10)}  
	
}

class TomoAmplificador inherits Item {
	
	override method puntosDeVida(unCampeon) = super(unCampeon) + unCampeon.puntosDeDanio() * 0.25
	override method puntosDeAtaque(unCampeon) = super(unCampeon) + unCampeon.puntosDeDanio() * 0.1
	
	override method efectoDeEqupamiento(unCampeon) {unCampeon.puntosDeBloqueo(2)} 
	override method efectoDeDesequipamiento(unCampeon) {unCampeon.puntosDeDanio(30)}
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method puntosDeVida(unCampeon) = super(unCampeon) * 2
	override method puntosDeAtaque(unCampeon) = super(unCampeon) + 2
	
	override method efectoDeEqupamiento(unCampeon) { 
		super(unCampeon) 
		unCampeon.puntosDeDanio(10)
	}
	
	override method efectoDeDesequipamiento(unCampeon) {}

}


class BastonDeVacio inherits Item {
	const property items = #{}
	
	method totalDePuntosDeVidaDeItems(unCampeon) = items.sum({i => i.puntosDeVida(unCampeon)})
	method totalDePuntosDeAtaqueDeItems(unCampeon) = items.sum({i => i.puntosDeAtaque(unCampeon)})
	
	override method puntosDeVida(unCampeon)=
		super(unCampeon) + self.totalDePuntosDeVidaDeItems(unCampeon)
	
	
	override method puntosDeAtaque(unCampeon)=
		super(unCampeon) + self.totalDePuntosDeAtaqueDeItems(unCampeon)
		
		
	override method efectoDeEqupamiento(unCampeon) {
		
	} 
	
	override method efectoDeDesequipamiento(unCampeon) {
		
	}
}












