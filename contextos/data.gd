extends Node

var acciones = {}
var unidad_seleccionada_id = null


func primera_accion():
	return devolver_accion(1)

func segunda_accion():
	return devolver_accion(2)

func tercera_accion():
	return devolver_accion(3)
	
func ultima_accion():
	var ultima_acion = Data.acciones.size()
	return devolver_accion(ultima_acion)

func devolver_accion(key):
	if acciones.has(key):
		return acciones[key]
