import wollok.game.*
import direcciones.*

class ParedDeLadrillos {

	var property position = game.at(0, 0)

	method nombre() = "ladrillo"

	method image() = ""

	method chocaCon(alguien) {
	}

	method teMueres() {
	}

}
class LadrillosPared inherits ParedDeLadrillos { 

	override method image() = "ladrillonivel1.png"

	override method chocaCon(alguien) {
		if (alguien.posicionAnterior() == derecha) {
			alguien.position(alguien.position().left(1))
		} else if(alguien.posicionAnterior() == izquierda) {
			alguien.position(alguien.position().right(1))
		}else{
			alguien.position(alguien.position().down(1))
		}
	}

}
