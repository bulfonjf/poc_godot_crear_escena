extends Node2D

onready var unidad : KinematicBody2D = $unidad

func _ready():
	unidad.connect("click_unidad_signal", self, "_on_click_unidad")

func _on_click_unidad(accion):
	Comandos.agregar_accion(accion)
	Comandos.procesar_accion()
	