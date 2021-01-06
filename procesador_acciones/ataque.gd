extends "res://procesador_acciones/procesador_acciones_base.gd"

var unidad_a_seleccionar_id

func aplica(path_acciones) -> bool:
	return path_acciones == "/click_unidad/atacar"

func contexto_valido() -> bool:
	var unidad_clickeada_id = Data.primera_accion().unidad_clickeada_id
	var unidad_clickeada = instance_from_id(unidad_clickeada_id)

	if unidad_clickeada.faccion == "faccion_activa": # todo, cambiar por singleton de Ronda
		unidad_a_seleccionar_id = unidad_clickeada_id
		return true

	return false

func mostrar_escena():
	Comandos.seleccionar_unidad(unidad_a_seleccionar_id)
	
	CreadorEscena\
	.mostrar_menu_unidad()\
	.mostrar_info_unidad(unidad_a_seleccionar_id)\
	.mostrar_ataque()\
	.build()
