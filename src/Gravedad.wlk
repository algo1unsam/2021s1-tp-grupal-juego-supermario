import wollok.game.*

object gravedad {

	method nombre() = self
	method bajar(personaje) {
			personaje.forEach{alguien =>self.comprueboPosicion(alguien)}
		}
		
		method comprueboPosicion(algo)
		{
			if( game.getObjectsIn(algo.position().down(1)).isEmpty()){
				self.muevo(algo)
			}
			
		}

	method teMueres() {
	}

	method muevo(alguien) {
	  alguien.position(alguien.position().down(1))
		
	}
	
}