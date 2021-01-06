extends Control

var hijos = []

var configuracion = {}

func agregar_hijo(hijo):
	hijos.append(hijo)

func aplicar_configuracion(_configuracion = {"mostrar": false}):
	if _configuracion["mostrar"]:
		self.mostrar(_configuracion)
	else:
		self.ocultar()

func mostrar(_configuracion = {}):
	Diccionario.unir(_configuracion, configuracion)

	for hijo_id in hijos:
		var hijo = instance_from_id(hijo_id)
		var hijo_nombre = hijo.name.to_lower()
		if configuracion.has(hijo_nombre):
			if configuracion[hijo_nombre].mostrar:
				hijo.mostrar(configuracion[hijo_nombre])
			else:
				hijo.ocultar()

	self.show()

func ocultar():
	for hijo_id in hijos:
		var hijo = instance_from_id(hijo_id)
		hijo.ocultar()
		
	self.hide()
