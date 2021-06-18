import direcciones.*

class Piso {

	var property position

	method imagen() = ""

	method choque(alguien) {
	}

}
class PisoNivel1 inherits Piso{
	override method imagen()="piso1.png"
	override method choque(alguien){
		if (alguien.posicionAnterior() == derecha) {
			alguien.position(alguien.position().left(1))
		} else {
			alguien.position(alguien.position().right(1))
		}
	}
}