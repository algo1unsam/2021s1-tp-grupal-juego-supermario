import direcciones.*

class Piso {

	var property position

	method image() = "pisoBase.png"
	method movimiento(){}
	method cantidadPasos(){}
	method choque(alguien) {
		if (alguien.posicionAnterior() == derecha) {
			alguien.position(alguien.position().left(1))
		} else if(alguien.posicionAnterior() == izquierda) {
			alguien.position(alguien.position().right(1))
		}else{
			alguien.position(alguien.position().down(1))
		}
	}

}
class PisoNivel1 inherits Piso{
	override method image()="ladrillonivel1.png"
	override method choque(alguien){	
	}
}