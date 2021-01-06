extends KinematicBody2D

signal click_unidad_signal

var faccion = "faccion_activa"
var vida = 100
var equipamiento = ["espada", "armadura"]

func _on_unidad_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		var accion = {
			"accion": "click_unidad",
			"unidad_clickeada_id": self.get_instance_id()
		}
		emit_signal("click_unidad_signal", accion)
