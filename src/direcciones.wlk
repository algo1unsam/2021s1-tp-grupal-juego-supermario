object derecha {

	method chocaCon(algo) {
	}
	method movimientoDerecha(alguien) {
		alguien.position(alguien.position().right(1))
		alguien.posicionAnterior(self)
	}
	method teMueres() {
	}
}

object izquierda {

	method chocaCon(algo) {
	}

	method movimientoIzquierda(alguien) {
	alguien.position(alguien.position().left(1))
	alguien.posicionAnterior(self)
	}

	method teMueres() {
	}

}