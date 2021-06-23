class Monedas {
	
	var property position

	method nombre() = "moneda"

	method image() = "monedas.png"

	method chocaCon(unpersonaje) {
		
		unpersonaje.agarrar(self)
	}

	method teMueres() {
	}
}
