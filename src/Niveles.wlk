import wollok.game.*
import mario.*
import juego.*
import pared.*
import Piso.*
import Malo.*
import Bandera.*
import direcciones.*
import Piso.*
import Piso.*

object stage1 {

	method cargar() {
		game.title("Mario Bro")
		game.height(16)
		game.width(25)
		game.boardGround("fondonivel1.png")
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posPared = []
		const mobs = []
		mario.position(game.at(1,12))
		mario.positionOriginal(game.at(1, 12))
			// AGREGO A Mario Bross
		game.addVisual(mario)
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
		const pisolava = []
		const puentepos=[]
			// zona mapa
		(0 .. 6).forEach{ n => posPiso.add(game.at(n, 0))} // bordeAbajo
		(0 .. 6).forEach{ n => posPiso.add(game.at(n, 1))}
		(0 .. 6).forEach{ n => posPiso.add(game.at(n, 2))}
		//(6 .. ancho).forEach{ n => pisolava.add(game.at(n, 2))}
		(6 .. ancho).forEach{ n => puentepos.add(game.at(n, 3))}
			//bloques.addAll([ game.at(1,14), game.at(2,14), game.at(3,14), game.at(4,14), game.at(5,14) ])
			bloques.addAll([ game.at(7,16), game.at(7,15), game.at(7,14), game.at(7,13),game.at(7,12), game.at(6,12),game.at(5,12),game.at(4,12) ])
			 bloques.addAll([game.at(1,10),game.at(2,10),game.at(3,10),game.at(4,10),game.at(5,10),game.at(6,10),game.at(7,10),game.at(8,10),game.at(9,10),game.at(10,10),game.at(11,10),game.at(12,10),game.at(13,10),game.at(14,10),game.at(15,10),game.at(16,10),game.at(17,10),game.at(18,10),game.at(19,0),game.at(20,0),game.at(21,0)])
			// bloques.addAll([ game.at(20,3), game.at(21,3), game.at(21,4), game.at(22,3), game.at(22,4),game.at(23,3),game.at(23,4),game.at(23,5) ])
		const slavones=[]
		slavones.addAll(puentepos.map{p=>new Slavon(position=p)})
		posPiso.forEach{ p => juego.dibujar(new PisoCueva(position = p))}
		bloques.forEach{ p => juego.dibujar(new PisoCueva(position = p))}
		slavones.forEach{ sla => juego.dibujar(sla)}
		pisolava.forEach{ p => juego.dibujar(new Lava(position = p))}
			// mobs
		const boss = new Malo(imagen = "Boss.png", position = game.at(15, 4), cantidadpasosIzquierda = 4, cantidadpasosDerecha = 3, cantidadDePasos = 3)
		const tortuga = new Malo(imagen = "tortugaVoladora.png", position = game.at(22, 9), cantidadpasosIzquierda = 5, cantidadpasosDerecha = 5, cantidadDePasos = 5)
		const tortuga2 = new Malo(imagen = "tortugaVoladora.png", position = game.at(22, 6), cantidadpasosIzquierda = 5, cantidadpasosDerecha = 5, cantidadDePasos = 5)
		juego.dibujar(boss)
		juego.dibujar(tortuga)
		juego.dibujar(tortuga2)
			// maloHongo.cantidadPasos()
			//game.onTick(100, "lava", { mario.alguienArriba()})
		const personajeGravedad = [ mario, boss ]
		mobs.add(boss)
		mobs.add(tortuga)
		mobs.add(tortuga2)
		game.onTick(700, "caminaHacialaIzquierda", { mobs.forEach{ malos => malos.movimiento()}})
		mobs.add(mario)
		game.onTick(200, "gravedad", { gravedad.bajar(personajeGravedad)})
			// agregados
		bloques.addAll(posPiso)
		const banderanivel1 = new Bandera(position = game.at(1, 3), stageanterior = self)
		banderanivel1.crearMoneda([game.at(1,3), game.at(2,3), game.at(3,3), game.at(4,3), game.at(9,11), game.at(10,11), game.at(11,11), game.at(12,11), game.at(13,11) ])
		banderanivel1.crearPalanca(game.at(3,3),slavones)
		mario.agregarBandera(banderanivel1)
		mario.ponerVidas()
		
	}

	method bordesDelMapa(ancho, largo, posPared) {
		var techo = []
		(0 .. largo).forEach{ n => posPared.add(game.at(ancho, n))} // bordeDer
		(0 .. largo).forEach{ n => posPared.add(game.at(0, n))} // bordeDer
		(0 .. ancho).forEach{ n => techo.add(game.at(n, largo))}
		posPared.forEach{ p => juego.dibujar(new PisoCueva(position = p))}
		techo.forEach{ p => juego.dibujar(new PisoCueva(position = p))}
	}

}

object stage2 {

	method cargar() {
		game.clear()
	}

}

