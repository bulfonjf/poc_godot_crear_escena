extends "res://componentes/componente_controlador.gd"

onready var ataque_boton : Button = $VBoxContainer/Atacar
onready var mover_boton : Button = $VBoxContainer/Mover
var _unused
const mostrar_componente = "mostrar"

# Signals
signal click_atacar(accion)

func _ready():
    _unused = CreadorEscena.connect("mostrar_menu_unidad_signal", self, "aplicar_configuracion")
    
    var escena_principal = get_tree().get_root().get_node("Node2D")
    _unused = self.connect("click_atacar", escena_principal, "_on_click_atacar")

    self.agregar_hijo(ataque_boton.get_instance_id())
    self.agregar_hijo(mover_boton.get_instance_id())
    self.configuracion[ataque_boton.name.to_lower()] = {
        mostrar_componente: true
    }
    self.configuracion[mover_boton.name.to_lower()] = {
        mostrar_componente: true
    }

func _on_atacar_pressed():
    var accion = {
        "accion": "atacar"
    }
    emit_signal("click_atacar", accion)

func _on_mover_pressed():
    print("mover")