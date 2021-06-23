import wollok.game.*
import juego.*
import audio.*

object mario {

	var property sigueVivo = true
	var property puntos = 3
	var property position = game.at(1, 3)
	var property positionOriginal = game.at(1, 3)
	var property imagen = "marioBross1.0.png"
	var property posicionAnterior = null
	var property colision = true
	var property monedas = 0
	var property contadorVidas = [ new Vidaroja(position=game.at(1,15), numeroVida=1), new Vidaroja(position=game.at(2,15), numeroVida=2), new Vidaroja(position=game.at(3,15), numeroVida=3) ]
	var tiempo = 5
	var banderaMapa = null

	method nombre() = "mario"

	method chocaCon(algo) {
	}

	method image() {
		return imagen
	}

	method agarrar(unObjeto) {
		if (self.sigueVivo()) {
			monedas++
			juego.borrar(unObjeto)
			self.subirVida()
			banderaMapa.restarMonedas()
			game.say(self, "monedas:" + monedas)
			audio.parar()
			audio.reproducirMoneda()
			audio.reproducir()
		}
	}

	method subirVida() {
		var vidaGanada = null
		if (monedas >= 10 and puntos<3) {
			puntos++
			monedas = monedas - 10
			game.say(self, "ganaste 1 vida te quedan " + puntos + " de vida")
			vidaGanada=self.buscoVida(contadorVidas,puntos)
			juego.borrar(vidaGanada)
			contadorVidas.remove(vidaGanada)
			contadorVidas.add(new Vidaroja(position = vidaGanada.position(), numeroVida = vidaGanada.numeroVida()))
			juego.dibujar(contadorVidas.find{ unaVida => unaVida.numeroVida() == vidaGanada.numeroVida()})
			audio.parar()
			audio.reproducirVida()
			audio.reproducir()
		}
	}
	method buscoVida(vidas,numero){
		return vidas.find{unaVida=>unaVida.nombre()=="vidanegra" and unaVida.numeroVida()==numero}
	}
	method teMueres() {
		if (puntos == 0) {
			audio.parar()
			
			perdiste.cargar()
			/*audio.reproducir()
			position = positionOriginal
			game.clear()
			 * juego.cargar()
			puntos = 3
			self.ponerVidas()*/
		} else {
			self.restarVida()
		}
	}


	method restarVida() {
		var vidaPerdida = null
		vidaPerdida = contadorVidas.get(1)
			contadorVidas.remove(vidaPerdida)
			contadorVidas.add(new Vidanegra(position = vidaPerdida.position(), numeroVida = vidaPerdida.numeroVida()))
			juego.dibujar(contadorVidas.find{ unaVida => unaVida.numeroVida() == vidaPerdida.numeroVida()})
		if (puntos >= 1) {
			puntos -= 1
			
		} else {
			self.teMueres()
			contadorVidas.forEach{vida=>juego.borrar(vida)}
			contadorVidas.forEach{vida=>contadorVidas.remove(vida)}
		}
	}

	method resetcolision() {
		colision = true
	}

	method contador() {
		if (tiempo == 0) {
			self.resetcolision()
			tiempo = 5
		} else {
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

	method agregarBandera(unaBandera) {
		banderaMapa = unaBandera
	}

	method tocoLaBandera() {
		if (position == banderaMapa.position()) {
			banderaMapa.cambioStague()
		}
	}

	method ponerVidas() {
		contadorVidas.forEach{ vida => juego.dibujar(vida)}
	}

}

class Vidaroja {

	var property position = game.at(1, 15)
	var property image = "vidaroja.png"
	var property numeroVida = 0

	method nombre() = "vidaroja"

}

class Vidanegra {

	var property position = game.at(1, 15)
	var property image = "vidanegra.png"
	var property numeroVida = 0

	method nombre() = "vidanegra"

}
