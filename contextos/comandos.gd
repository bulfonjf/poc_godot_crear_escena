extends Node

var procesadores_de_acciones = []

func _ready():
	procesadores_de_acciones = [
		load("res://procesador_acciones/seleccion_unidad.gd").new(),
	]

func agregar_accion(accion):
	var cantidad_acciones = Data.acciones.size()
	var nueva_accion_key = cantidad_acciones + 1
	if Data.acciones.has(nueva_accion_key):
		print("ERROR: Data.acciones ya tiene la nueva key que se iba a agregar")
	else:
		Data.acciones[nueva_accion_key] = accion

func procesar_accion():
	var path_acciones = self.obtener_path_acciones()
	self.ejecutar_primer_procesador_que_aplique(path_acciones)
	
func obtener_path_acciones():
	var path_acciones = ""
	for key in Data.acciones:
		path_acciones += "/" + Data.acciones[key].accion
	return path_acciones

func ejecutar_primer_procesador_que_aplique(path_acciones):
	var procesadores = self.obtener_procesadores()
	for pa in procesadores:
		var valido = pa.procesar(path_acciones)
		if valido:
			break

func borrar_acciones():
	Data.acciones = {}

func obtener_procesadores():
	return procesadores_de_acciones

func seleccionar_unidad(unidad_id):
	Data.unidad_seleccionada_id = unidad_id
