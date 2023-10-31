import campeones.*

class Oleada {
	var cantidadDeMinions
	var plusDeDanio = 0
	var danio = cantidadDeMinions + plusDeDanio
	
	method cantidadDeMinions() = cantidadDeMinions
	method danio() = danio
	method plusDeDanio() = plusDeDanio
	
	method disminuirCantidadDeMinions(unCampeon) {
		cantidadDeMinions -= (unCampeon.puntosDeAtaqueTotal() / 2)
	}
	
	method disminuirPlusDeDanio(unCampeon){
		if (unCampeon.puntosDeAtaqueTotal().between(20, 40)){
			plusDeDanio -= 1 
		}	
		else if (unCampeon.puntosDeAtaqueTotal() > 40){
			plusDeDanio -= 2
		}
	}
	
	method efectoDeLaBatallaContra(unCampeon){
		self.disminuirCantidadDeMinions(unCampeon)
		self.disminuirPlusDeDanio(unCampeon)
	}
}
