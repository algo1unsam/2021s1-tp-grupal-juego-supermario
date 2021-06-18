import wollok.game.*
import Piso.*

object mapa {
	var posDeBloques = []
	var tamanioPantalla = game.width() - 1
	method cargar(){
		
		(0 .. tamanioPantalla).forEach{ n => posDeBloques.add(game.at(0, n))}
	}
	method escenario1(){
		posDeBloques.addAll([game.at(6,5),game.at(7,5),game.at(8,5)])
	}
}
