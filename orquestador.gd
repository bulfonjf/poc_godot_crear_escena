extends Node2D

onready var unidad : KinematicBody2D = $unidad_1

func _ready():
	unidad.connect("click_unidad_signal", self, "_on_click_unidad")

func _unhandled_input(event):
	pass

func _on_click_unidad(accion):
	Comandos.agregar_accion(accion)
	Comandos.procesar_accion()
	
func _on_click_atacar(accion):
	Comandos.agregar_accion(accion)
	Comandos.procesar_accion()
