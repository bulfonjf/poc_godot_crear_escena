extends "res://componentes/componente_controlador.gd"

onready var vida = $vida
onready var items = $items

func _ready():
    CreadorEscena.connect("mostrar_menu_lateral_mapa_signal", self, "aplicar_configuracion")
    
    self.agregar_hijo(vida.get_instance_id())
	self.agregar_hijo(items.get_instance_id())
	
    self.configuracion[vida.name.to_lower()] = true
    self.configuracion[items.name.to_lower()] = true