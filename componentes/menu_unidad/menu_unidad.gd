extends "res://componentes/componente_controlador.gd"

onready var ataque_boton : Button = $VBoxContainer/Atacar
onready var mover_boton : Button = $VBoxContainer/Mover

func _ready():
    CreadorEscena.connect("mostrar_menu_unidad_signal", self, "aplicar_configuracion")
    
    self.agregar_hijo(ataque_boton.get_instance_id())
    self.agregar_hijo(mover_boton.get_instance_id())
    self.configuracion[ataque_boton.name.to_lower()] = true
    self.configuracion[mover_boton.name.to_lower()] = true

func _on_atacar_pressed():
    print("atacar")

func _on_mover_pressed():
    print("mover")