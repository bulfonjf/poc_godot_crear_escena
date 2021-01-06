extends "res://componentes/componente_controlador.gd"

onready var vida = $vida
onready var items = $items
const ITEMS_LIST_NAME = "items_list"
const VIDA_VALUE_NOMBRE = "value"

const mostrar_componente = "mostrar"

func _ready():
	self.agregar_hijo(vida.get_instance_id())
	self.agregar_hijo(items.get_instance_id())
	
	self.configuracion[vida.name.to_lower()] = {
		mostrar_componente: true
	}
	self.configuracion[items.name.to_lower()] = {
		mostrar_componente: true
	}

# Sobreescribe la funcion mostrar
func mostrar(_configuracion = {}):
	if _configuracion.has("unidad_a_mostrar_id"):
		var unidad = obtener_unidad(_configuracion)
		mostrar_vida(unidad.vida)
		mostrar_equipamiento(unidad.equipamiento)
	# Continua con la funcion mostrar de la clase base
	.mostrar(_configuracion)

func ocultar():
	mostrar_vida(0)
	mostrar_equipamiento([])
	.ocultar()

func obtener_unidad(_configuracion):
	var unidad_id = _configuracion["unidad_a_mostrar_id"]
	return instance_from_id(unidad_id)

func mostrar_vida(_vida):
	var vida_value = vida.find_node(VIDA_VALUE_NOMBRE)
	vida_value.text = str(_vida)

func mostrar_equipamiento(equipamiento):
	var items_list = items.find_node(ITEMS_LIST_NAME)
	
	AuxiliarNode.remove_children(items_list)

	for item in equipamiento:
		var item_label = Label.new()
		item_label.text = item
		items_list.add_child(item_label)
