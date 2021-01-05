extends "res://addons/gut/test.gd"

var menu_unidad

func after_each():
    autoqfree(menu_unidad)

func test_procesar():
    var path_acciones = "/click_unidad"
    menu_unidad = load("res://componentes/menu_unidad/menu_unidad.tscn").instance()
    get_tree().get_root().add_child(menu_unidad)
    var aplica = SeleccionUnidad.procesar(path_acciones)

    assert_true(aplica)
    assert_true(menu_unidad.visible)

    