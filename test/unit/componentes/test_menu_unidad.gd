extends "res://addons/gut/test.gd"

var sut

func after_each():
    autoqfree(sut)

func test_preparar_componente_desde_senial():
    var target_signal = "mostrar_menu_unidad_signal"

    sut = load("res://componentes/menu_unidad/menu_unidad.tscn").instance()
    var atacar_boton = sut.get_node("VBoxContainer/Atacar")
    var mover_boton = sut.get_node("VBoxContainer/Mover")

    get_tree().get_root().add_child(sut)
    
    watch_signals(CreadorEscena)

    CreadorEscena.mostrar_menu_unidad()

    assert_signal_emitted(CreadorEscena, target_signal)
    assert_true(sut.visible)
    assert_true(atacar_boton.visible)
    assert_true(mover_boton.visible)