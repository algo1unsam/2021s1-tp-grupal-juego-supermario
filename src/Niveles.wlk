import wollok.game.*
import mario.*
import juego.*
import pared.*
import Piso.*
import Malo.*
import Bandera.*
import direcciones.*

object stage1 {

	method cargar() {
		game.title("Mario Bro")
		game.height(16)
		game.width(25)
		game.boardGround("fondonivel1.png")
		const ancho = game.width() - 1
		const largo = game.height() - 1
		mario.position(game.at(1, 3))
		mario.positionOriginal(game.at(1, 3))
		const posPared = []
		const mobs = []
		const maloHongo = new Malo(imagen = "maloHongo.png", position = game.at(15, 4), cantidadpasosIzquierda = 4, cantidadpasosDerecha = 3, cantidadDePasos = 3)
		const banderanivel1 = new Bandera(position = game.at(23, 3), stageanterior = self)
		maloHongo.cantidadPasos()
		const posPiso = []
		const bloques = []
		
		//mapa
		self.bordesDelMapa(ancho, largo, posPared)
			
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 1))}
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 2))}
		bloques.addAll([ game.at(7,3), game.at(8,3), game.at(8,4), game.at(9,3), game.at(9,4), game.at(9,5) ])
		bloques.addAll([ game.at(16,3), game.at(17,3), game.at(17,4), game.at(18,3), game.at(16,4), game.at(16,5) ])
		posPiso.forEach{ p => juego.dibujar(new PisoNivel1(position = p))}
		bloques.forEach{ p => juego.dibujar(new LadrillosPared(position = p))}
			// mobs
		juego.dibujar(maloHongo)
		mobs.add(maloHongo)
		const personajeGravedad=[mario,maloHongo]
		game.onTick(700, "caminaHacialaIzquierda", { mobs.forEach{ malos => malos.movimiento()}})
		game.onTick(200, "gravedad", { gravedad.bajar(personajeGravedad)})
			// agregados
		bloques.addAll(posPiso)
		juego.dibujar(banderanivel1)
			
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda(mario)}
		keyboard.right().onPressDo{ derecha.movimientoDerecha(mario)}
		keyboard.up().onPressDo{ arriba.movimientoArriba(mario)}
		keyboard.down().onPressDo{ mario.tocoLaBandera()}
			// COLISIONES
		game.whenCollideDo(mario, { algo => algo.chocaCon(mario)})
			// resetea para volver a colicionar con 1 malo
		game.onTick(1000, "conejo pierde 1 vida", { mario.contador()})
		
			// zona mapa
		game.start()
	}

	method bordesDelMapa(ancho, largo, posPared) {
		(0 .. largo).forEach{ n => posPared.add(game.at(ancho, n))} // bordeDer
		(0 .. largo).forEach{ n => posPared.add(game.at(0, n))} // bordeDer
		posPared.forEach{ p => juego.dibujar(new LadrillosPared(position = p))}
	}

}

object stage2 {

	method cargar() {
	}

}
