import wollok.game.*

object audio {

	var property cancionActual = null
	var property rep = true

	method cancion() = game.sound("assets/sonidoMario.mp3")

	method moneda() = game.sound("assets/marioMoneda.mp3")

	method vida() = game.sound("assets/marioVida.mp3")

	method pierdes() = game.sound("assets/marioPierde.mp3")

	method reproducir() {
		if (rep) {
			rep = false
			cancionActual = self.cancion()
			cancionActual.volume(0.1)
			cancionActual.play()
		}
	}

	method parar() {
		if (cancionActual != null) {
			cancionActual.stop()
		}
		cancionActual = null
	}

	method reproducirpierdes() {
		rep = true
		cancionActual = self.pierdes()
		cancionActual.play()
		self.reproducir()
	}

	method reproducirVida() {
		rep = true
		cancionActual = self.vida()
		cancionActual.play()
		self.reproducir()
	}

	method reproducirMoneda() {
		rep = true
		cancionActual = self.moneda()
		cancionActual.play()
		self.reproducir()
	}

}

