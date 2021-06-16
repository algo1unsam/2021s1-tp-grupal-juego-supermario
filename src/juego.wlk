import wollok.game.*
import mario.*
import direcciones.*
import Piso.*
import Gravedad.*
object juego {
	method cargar(){
		
		game.title("Mario Bro")
		game.height(16)
		game.width(25)
		game.ground("fondonivel1.png")
		
				//	AGREGO A Mario Bross
		game.addVisual(mario)
		var personajesConGravedad = [ ]
		personajesConGravedad.addAll([ mario])
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda(mario)}
		keyboard.right().onPressDo{ derecha.movimientoDerecha(mario)}
		// gravedad
		game.onTick(100, "gravedad", { gravedad.bajar(personajesConGravedad)})
		// COLISIONES
		game.whenCollideDo(mario, { algo => algo.chocaCon(mario)})
		
		mario.positionOriginal(game.at(1, 1))
		nivel1.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}

	method borrar(dibujo) {
		game.removeVisual(dibujo)
	}
}
object nivel1{
	
	method cargar() {
		

		const ancho = game.width() - 1
		const largo = game.height() - 1
		mario.positionOriginal(game.at(22, 1))
		
		var posicionNiveles = []
		(0 .. largo).forEach{ n => posicionNiveles.add(game.at(0, n))}
		(0 .. largo).forEach{ n => posicionNiveles.add(game.at(ancho, n))}
		posicionNiveles.forEach{ nivel => juego.dibujar(new PisoNivel1(position = nivel))}
		self.bordesDelMapa(ancho,largo)


		// movimiento		
		//game.onTick(700, "caminaHacialaIzquierda", { seMueven.forEach{ malos => malos.movimiento()}})
			
			
		}
		
	method bordesDelMapa(ancho,largo){
		var posPiso = []
		var posPared = []
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 0))} // bordeAbajo
		(0 .. largo).forEach{ n => posPared.add(game.at(0, n))} // bordeIzq 
		(0 .. largo).forEach{ n => posPared.add(game.at(ancho, n))} // bordeDer
		posPiso.forEach{ p => juego.dibujar(new PisoNivel1(position = p))}
		//posPared.forEach{ p => self.dibujar(new LadrillosPared(position = p))}

	}



}




