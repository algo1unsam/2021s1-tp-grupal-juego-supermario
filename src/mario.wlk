import wollok.game.*
import juego.*

object mario {
	var property sigueVivo = true
	var property puntos = 3
	var property position = game.at(1, 3)
	var property positionOriginal=game.at(1, 3)
	var property imagen = "marioBross1.0.png"
	var property posicionAnterior = null
	var property colision = true
	var property monedas=0
	var tiempo=5
	var banderaMapa = null
	method nombre() = "mario"
	
	method chocaCon(algo) {
	}

	method image() {
		return imagen
	}
	method agarrar(unObjeto) {
		if (self.sigueVivo() ) {
			monedas++
			juego.borrar(unObjeto)
			self.subirVida()
				banderaMapa.restarMonedas()
				game.say(self, "monedas:" + monedas )
		}
	}
	method subirVida(){
		if(monedas>=10){
			puntos++
			monedas=monedas-10
			game.say(self, "ganaste 1 vida te quedan "+ puntos+ " de vida")
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
	
	
	method movimiento() {
		
	}
	method agregarBandera(unaBandera){
		banderaMapa=unaBandera
	}
	method tocoLaBandera(){
		if(position==banderaMapa.position()){
			banderaMapa.cambioStague()
		}
	}
}
