extends Control

var hijos = []

var configuracion = {}

func agregar_hijo(hijo_id):
	hijos.append(hijo_id)

func aplicar_configuracion(_configuracion = {"mostrar": false}):
	if _configuracion["mostrar"]:
		self.mostrar(_configuracion)
	else:
		self.ocultar()

func mostrar(_configuracion = {}):
	var configurar_local = configuracion.duplicate()
	Diccionario.unir(_configuracion, configurar_local)

	for hijo_id in hijos:
		var hijo = instance_from_id(hijo_id)
		var hijo_nombre = hijo.name.to_lower()
		if configurar_local.has(hijo_nombre):
			if configurar_local[hijo_nombre].mostrar:
				hijo.mostrar(configurar_local[hijo_nombre])
			else:
				hijo.ocultar()

	if configurar_local.has("deshabilitar"):
		if configurar_local["deshabilitar"]:
			# to-do: esta forma de deshabilitar solo funciona con botones
			self.disabled = true
		else:
			self.disabled = false

	self.show()

func ocultar():
	for hijo_id in hijos:
		var hijo = instance_from_id(hijo_id)
		hijo.ocultar()
		
	self.hide()
