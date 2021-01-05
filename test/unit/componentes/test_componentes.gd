extends "res://addons/gut/test.gd"

var sut

func after_each():
    autoqfree(sut)

func test_mostrar_menu_unidad():
    sut = load("res://componentes/menu_unidad/menu_unidad.tscn").instance()
    var atacar_boton = sut.get_node("VBoxContainer/Atacar")
    var mover_boton = sut.get_node("VBoxContainer/Mover")

    get_tree().get_root().add_child(sut)
    sut.mostrar({
        "atacar": true,
        "mover": true
    })

    assert_true(sut.visible)
    assert_true(atacar_boton.visible)
    assert_true(mover_boton.visible)

func test_mostrar_solo_boton_atacar():
    sut = load("res://componentes/menu_unidad/menu_unidad.tscn").instance()
    var atacar_boton = sut.get_node("VBoxContainer/Atacar")
    var mover_boton = sut.get_node("VBoxContainer/Mover")

    get_tree().get_root().add_child(sut)
    sut.mostrar({
        "atacar": true,
        "mover": false
    })

    assert_true(sut.visible)
    assert_true(atacar_boton.visible)
    assert_false(mover_boton.visible)

func test_mostrar_solo_boton_mover():
    sut = load("res://componentes/menu_unidad/menu_unidad.tscn").instance()
    var atacar_boton = sut.get_node("VBoxContainer/Atacar")
    var mover_boton = sut.get_node("VBoxContainer/Mover")

    get_tree().get_root().add_child(sut)
    sut.mostrar({
        "atacar": false,
        "mover": true
    })

    assert_true(sut.visible)
    assert_false(atacar_boton.visible)
    assert_true(mover_boton.visible)
