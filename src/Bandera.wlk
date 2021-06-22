import direcciones.*
import mario.*
import wollok.game.*
import juego.*
import monedas.*
import Niveles.*

class Bandera {
	var property nombre ="bandera"
	var property position
	var property stageanterior
	var cantidad = null
	var posicion = []
	method image() = "bandera.png"
	

	method cambioStague(){
		if(stageanterior==juego){
			game.clear()
		 stage1.cargar()
		 mario.position(mario.positionOriginal())
		}else{
				game.clear()
		}
		
	}
	method chocaCon(algo) {
	//	return self.cambioStague()
	}
	method crearMoneda(pos){
		
		posicion.addAll(pos)
		self.monedasFaltantes(pos.size())
		posicion.forEach{ p => game.addVisual(new Monedas(position = p))}
	}
	method monedasFaltantes(param1) {
		cantidad = param1
	}
	method restarMonedas() {
		cantidad -= 1
		if (cantidad == 0) {
			juego.dibujar(self)
			
		}
	}
}