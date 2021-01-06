extends "res://addons/gut/test.gd"

var sut
var items_list
var vida_valor
var unidad
var mostrar_componente = "mostrar"

const SUT_PATH = "res://componentes/info_unidad/info_unidad.tscn"
const UNIDAD_PATH = "res://unidad/unidad.tscn"

func after_each():
    autoqfree(sut)
    autoqfree(unidad)

func test_mostrar_info_unidad():
    # Preparar unnidad
    unidad = load(UNIDAD_PATH).instance()
    get_tree().get_root().add_child(unidad)
    unidad.vida = 50
    unidad.equipamiento = ["arco", "armadura", "casco"]

    # Preparar SUT
    var configuracion = {
        mostrar_componente : true,
        "unidad_a_mostrar_id": unidad.get_instance_id()
    }
    sut = load(SUT_PATH).instance()
    get_tree().get_root().add_child(sut)
    sut.hide()
    
    # Metodo a testear
    sut.mostrar(configuracion)
    
    # Asserts
    items_list = sut.find_node("items").find_node("items_list")
    var items_names = []
    for item in items_list.get_children():
        items_names.append(item.text)

    vida_valor = sut.find_node("vida").find_node("value")

    assert_true(sut.visible)
    assert_eq(vida_valor.text, str(unidad.vida))
    assert_eq_deep(items_names, unidad.equipamiento)
    

    