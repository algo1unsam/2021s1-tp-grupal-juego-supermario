import direcciones.*
import juego.*

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
class PisoCueva inherits Piso{
	override method image()="bloquecueva.png"
	override method choque(alguien){	
	}
}
class Slavon{
	method image()="slavon.png"
	method choque(alguien){
		if (alguien.posicionAnterior() == arriba) {
			alguien.position(alguien.position().up(1))
	}
}

}
object puente{
	var property slavones=[]
	var property position
	var property image="palanca.png"
	method agregoSlavon(variosSlavones){
		variosSlavones.addAll(variosSlavones)
		variosSlavones.forEach{sl=>juego.dibujar(sl)}
	}
	method borroTodo(){
		slavones.forEach{s=>self.eliminarSlavon(s)}
		
	}	
	method choque(alguien){
		self.borroTodo()
	}
	method eliminarSlavon(unSlavon){
		juego.dibujar(unSlavon)
		slavones.remove(unSlavon)
	}
}
class Lava{
	var property position
	var property image="palanca.png"
	method choque(alguien){
		alguien.teMueres()
	}
}