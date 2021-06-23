import direcciones.*
import juego.*
import wollok.game.*

class Piso {

	var property position

	method image() = "pisoBase.png"
	method movimiento(){}
	method cantidadPasos(){}
	method chocaCon(param1){}
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
class PisoCueva inherits Piso{
	override method image()="bloquecueva.png"
	override method choque(alguien){	
	}
	
}
class Slavon inherits Piso{
	method image()="puente.png"
	method choque(alguien){
		if (alguien.posicionAnterior() == arriba) {
			alguien.position(alguien.position().up(1))
	}
}

}

class Lava inherits Piso{
	method image()="lava.png"
	method choque(alguien){
		alguien.teMueres()
	}
	method alguienArriba(){
		if(!game.getObjectsIn(self.position().up(1)).isEmpty()){
			game.getObjectsIn(self.position().up(1)).teMueres()
		}
	}
	
	
}