extends "res://componentes/componente_controlador.gd"

func _ready():
	CreadorEscena.connect("configurar_ataque", self, "aplicar_configuracion")
	