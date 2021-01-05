extends "res://componentes/componente_controlador.gd"

onready var info_ronda = $VBoxContainer/info_ronda
onready var info_unidad = $VBoxContainer/info_unidad

func _ready():
    CreadorEscena.connect("mostrar_menu_lateral_mapa_signal", self, "aplicar_configuracion")
    
    self.agregar_hijo(info_ronda.get_instance_id())
	self.agregar_hijo(info_unidad.get_instance_id())
	
    self.configuracion[info_ronda.name.to_lower()] = true
    self.configuracion[info_unidad.name.to_lower()] = true