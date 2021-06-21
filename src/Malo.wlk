import direcciones.*
import mario.*
import wollok.game.*

class Malo {

	var imagen
	var property cantidadpasosIzquierda
	var property cantidadpasosDerecha
	var property position
	var property posicionAnterior = 0
	var property cantidadDePasos = 0
	var property tiempo = 3
	var positionOriginal =null

	method image() = imagen

	method nombre() = self
	method agarrar(unObjeto){}
	method movimiento() {
		
		self.movimientoIzquierda()
		self.movimientoDerecha()
		if (cantidadpasosIzquierda == 0 && cantidadpasosDerecha == 0) {
			self.resetpasos( )
		}
	}

	method movimientoIzquierda() {
		if (cantidadpasosIzquierda > 0) {
			izquierda.movimientoIzquierda(self)
			cantidadpasosIzquierda--
		}
	}

	method movimientoDerecha() {
		if (cantidadpasosIzquierda == 0 and cantidadpasosDerecha!=0) {
			derecha.movimientoDerecha(self)
			cantidadpasosDerecha--
		}
	}

	method resetpasos() {
		cantidadpasosDerecha = cantidadDePasos
		cantidadpasosIzquierda = cantidadDePasos
	}

	method cantidadPasos() {
		cantidadDePasos = cantidadpasosIzquierda
	}

	method chocaCon(algo) {
		if (algo == mario) {
			mario.chocoConMalo(self)
		} else {
			if (posicionAnterior == derecha) {
				self.resetpasos()
			} else {
				cantidadpasosIzquierda = 0
			}
		}
	}

	method teMueres() {
		game.removeVisual(self)
	}

	method retrocede() {
		if (posicionAnterior == derecha) {
			izquierda.movimientoIzquierda(self)
		} else {
			derecha.movimientoDerecha(self)
		}
	}
	method chocoConMalo(param1) {
	}

}
