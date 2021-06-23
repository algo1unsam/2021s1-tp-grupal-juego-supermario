import direcciones.*
import mario.*
import wollok.game.*
import juego.*
import monedas.*
import Niveles.*

class Bandera {

	var property nombre = "bandera"
	var property position
	var property stageanterior
	var cantidad = 0
	var posicion = []

	method image() = "bandera.png"

	method cambioStague() {
		if (stageanterior == juego) {
			game.clear()
			stage1.cargar()
			mario.position(mario.positionOriginal())
		} else if (stageanterior == inicio) {
			game.clear()
			juego.cargar()
		}else if(stageanterior==stage1){
			game.clear()
			ganaste.cargar()
		}
	}

	method chocaCon(algo) {
	// return self.cambioStague()
	}

	method crearMoneda(pos) {
		posicion.addAll(pos)
		self.monedasFaltantes(pos.size())
		posicion.forEach{ p => game.addVisual(new Monedas(position = p))}
	}
method crearPalanca(pos,conjuntoSlavones) {
		posicion.add(pos)
		
		game.addVisual(new Palanca(position = pos,slavones=conjuntoSlavones))
	}
	method monedasFaltantes(param1) {
		cantidad+= param1
	}

	method restarMonedas() {
		cantidad -= 1
		if (cantidad == 0) {
			juego.dibujar(self)
		}
	}

}
class Palanca inherits Monedas{
	
	var property slavones=[]
	method image()="palanca.png"
	method borrarPalancas(){
		slavones.forEach{p=>juego.borrar(p)}
		juego.borrar(self)
	}
	override method chocaCon(algo) {
	if(algo==mario){
		self.borrarPalancas()
	}
	}
}
