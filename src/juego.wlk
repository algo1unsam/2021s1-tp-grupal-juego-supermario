import wollok.game.*
import mario.*
import direcciones.*
import Piso.*
import Gravedad.*
import Malo.*
import pared.*
import Bandera.*
import Niveles.*
import audio.*

object juego {

	method cargar() {
		game.title("Mario Bro")
		game.height(16)
		game.width(25)
		game.boardGround("fondonivel1.png")
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posPared = []
		const mobs = []
		 mario.positionOriginal(game.at(1, 3))
		// AGREGO A Mario Bross
		game.addVisual(mario)
		game.onTick(1000, "musica", { audio.reproducir()})
		//game.schedule(0, { audio.reproducir()})
		self.bordesDelMapa(ancho, largo, posPared)
			// TECLADO
		keyboard.left().onPressDo{ izquierda.movimientoIzquierda(mario)}
		keyboard.right().onPressDo{ derecha.movimientoDerecha(mario)}
		keyboard.up().onPressDo{ arriba.movimientoArriba(mario)}
		keyboard.down().onPressDo{ mario.tocoLaBandera()}
			// COLISIONES
		game.whenCollideDo(mario, { algo => algo.chocaCon(mario)})
			// resetea para volver a colicionar con 1 malo
		game.onTick(1000, "mario pierde 1 vida", { mario.contador()})
		const posPiso = []
		const bloques = []
			// zona mapa
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 1))}
		(0 .. ancho).forEach{ n => posPiso.add(game.at(n, 2))}
		bloques.addAll([ game.at(7,3), game.at(8,3), game.at(8,4), game.at(9,3), game.at(9,4) ])
		bloques.addAll([ game.at(16,3), game.at(17,3), game.at(17,4), game.at(18,3), game.at(16,4) ])
		bloques.addAll([game.at(1,8),game.at(2,8),game.at(3,8),game.at(4,8),game.at(5,8),game.at(6,9),game.at(7,10),game.at(8,11),game.at(9,12),game.at(10,12),game.at(11,12),game.at(12,12),game.at(13,12),game.at(14,12),game.at(15,12),game.at(16,12),game.at(17,11),game.at(18,10),game.at(19,9),game.at(20,8),game.at(21,7)])
		bloques.addAll([ game.at(20,3), game.at(21,3), game.at(21,4), game.at(22,3), game.at(22,4),game.at(23,3),game.at(23,4),game.at(23,5) ])
		posPiso.forEach{ p => self.dibujar(new PisoNivel1(position = p))}
		bloques.forEach{ p => self.dibujar(new LadrillosPared(position = p))}
			// mobs
		const maloHongo = new Malo(imagen = "maloHongo.png", position = game.at(15, 4), cantidadpasosIzquierda = 4, cantidadpasosDerecha = 3, cantidadDePasos = 3)
		const tortuga = new Malo(imagen = "tortugaVoladora.png", position = game.at(5, 10), cantidadpasosIzquierda = 5, cantidadpasosDerecha = 5, cantidadDePasos = 5)
		const tortuga2 = new Malo(imagen = "tortugaVoladora.png", position = game.at(18, 13), cantidadpasosIzquierda = 5, cantidadpasosDerecha = 5, cantidadDePasos = 5)
		self.dibujar(maloHongo)
		self.dibujar(tortuga)
		self.dibujar(tortuga2)
		//maloHongo.cantidadPasos()
		const personajeGravedad=[mario,maloHongo]
		mobs.add(maloHongo)
		mobs.add(tortuga)
		mobs.add(tortuga2)
		game.onTick(700, "caminaHacialaIzquierda", { mobs.forEach{ malos => malos.movimiento()}})
		mobs.add(mario)
		game.onTick(200, "gravedad", { gravedad.bajar(personajeGravedad)})
			// agregados
		bloques.addAll(posPiso)
		const banderanivel1 = new Bandera(position = game.at(1, 3), stageanterior = self)
		banderanivel1.crearMoneda([game.at(10,5),game.at(11,5),game.at(12,5),game.at(13,5),game.at(14,5),game.at(15,5),game.at(1,9),game.at(2,9),game.at(3,9),game.at(4,9),game.at(9,13),game.at(10,13),game.at(11,13),game.at(12,13),game.at(13,13)])
		mario.agregarBandera(banderanivel1)
		mario.ponerVidas()
		
		game.start()
		audio.reproducir()
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}

	method borrar(dibujo) {
		game.removeVisual(dibujo)
	}

	method bordesDelMapa(ancho, largo, posPared) {
		(0 .. largo).forEach{ n => posPared.add(game.at(ancho, n))} // bordeDer
		(0 .. largo).forEach{ n => posPared.add(game.at(0, n))} // bordeDer
		posPared.forEach{ p => self.dibujar(new LadrillosPared(position = p))}
	}


}

