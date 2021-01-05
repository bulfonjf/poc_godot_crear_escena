extends "res://procesador_acciones/procesador_acciones_base.gd"

func aplica(path_acciones) -> bool:
    return path_acciones == "/click_unidad"

func contexto_valido() -> bool:
    return true

func mostrar_escena():
    CreadorEscena.mostrar_menu_unidad()