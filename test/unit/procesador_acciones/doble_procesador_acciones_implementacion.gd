extends "res://procesador_acciones/procesador_acciones_base.gd"

var configuracion = {}

func _init(_configuracion = {}):
    self.configuracion = _configuracion

func aplica(path_acciones) -> bool:
    return configuracion["aplica"]

func contexto_valido() -> bool:
    print("doble de processador_acciones_base, se llamo a la funcion: contexto_valido")
    return configuracion["contexto_valido"]
    

func mostrar_escena():
    print("doble de processador_acciones_base, se llamo a la funcion: mostrar_escena")