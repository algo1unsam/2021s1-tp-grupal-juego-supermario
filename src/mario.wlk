import wollok.game.*
import juego.*

object mario {
	var property sigueVivo = true
	var property puntos = 3
	var property position = game.at(1, 3)
	var property positionOriginal=null
	var property imagen = "marioBross1.0.png"
	var property posicionAnterior = null
	var property colision = true
	var tiempo=5
	method nombre() = "mario"
	method chocaCon(algo) {
	}

	method image() {
		return imagen
	}
	method comer(unObjeto) {
		if (self.sigueVivo()) {
			
			juego.borrar(unObjeto)
			
		}
	}
	method teMueres() {
		if (puntos == 0) {
			position=positionOriginal
			game.clear()
			juego.cargar()
			puntos=3
		} else {
			self.restarVida()
		}
	}
	method restarVida() {
		if (puntos >= 1) {
			puntos -= 1			
		} else {
			self.teMueres()
		}
	}
	method resetcolision() {
		colision = true
	}
	method contador() {
		if(tiempo==0){
		self.resetcolision()
		tiempo=5
		}else{
			tiempo--
		}
	}
	method chocoConMalo(param1) {
		
		if (colision) {
			
			colision = false
			self.restarVida()
			game.say(self, "Te Quedan:" + puntos + "de vida")
		}
	}
}
