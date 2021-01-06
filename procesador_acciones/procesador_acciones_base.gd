extends Node

func procesar(path_acciones) -> bool:
	if self.aplica(path_acciones):
		if contexto_valido():
			self.mostrar_escena()
			return true
		else:
			self.mostrar_error()
			return true
	else:
		return false

func aplica(path_acciones) -> bool:
	return false

func contexto_valido() -> bool:
	return false

func mostrar_escena():
	pass

func mostrar_error():
	pass
