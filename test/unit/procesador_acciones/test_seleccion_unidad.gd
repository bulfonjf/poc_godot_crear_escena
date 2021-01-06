extends "res://addons/gut/test.gd"

var menu_unidad
var unidad_1
var menu_lateral_mapa
var info_unidad

const UNIDAD_PATH = "res://unidad/unidad.tscn"
const MENU_UNIDAD_PATH = "res://componentes/menu_unidad/menu_unidad.tscn"
const MENU_LATERAL_MAPA_PATH = "res://componentes/menu_lateral_mapa/menu_lateral_mapa.tscn"
const INFO_UNIDAD_PATH = "res://componentes/info_unidad/info_unidad.tscn"


func after_each():
    Data.acciones = {}
    autoqfree(menu_unidad)
    autoqfree(unidad_1)
    autoqfree(menu_lateral_mapa)
    autoqfree(info_unidad)
    

func test_debe_aplicar():
    var path_acciones = "/click_unidad"

    # Preparar unidad a ser seleccionada
    unidad_1 = load(UNIDAD_PATH).instance()
    get_tree().get_root().add_child(unidad_1)
    unidad_1.faccion = "faccion_activa"

    # Prerar Data
    Data.acciones = {
        1: {
            "accion": "click_unidad",
            "unidad_clickeada_id": unidad_1.get_instance_id()
        }
    }

    var aplica = SeleccionUnidad.procesar(path_acciones)

    assert_true(aplica)

func test_no_debe_aplicar():
    var path_acciones = "/otra_accion"

    var aplica = SeleccionUnidad.procesar(path_acciones)

    assert_false(aplica)

func test_contexto_valido():
    # Preparar unidad a ser seleccionada
    unidad_1 = load(UNIDAD_PATH).instance()
    get_tree().get_root().add_child(unidad_1)
    unidad_1.faccion = "faccion_activa"

    # Prerar Data
    Data.acciones = {
        1: {
            "accion": "click_unidad",
            "unidad_clickeada_id": unidad_1.get_instance_id()
        }
    }

    var contexto_valido = SeleccionUnidad.contexto_valido()

    assert_true(contexto_valido)

func test_contexto_invalido():
    # Preparar unidad a ser seleccionada
    unidad_1 = load(UNIDAD_PATH).instance()
    get_tree().get_root().add_child(unidad_1)
    unidad_1.faccion = "faccion_no_activa"

    # Prerar Data
    Data.acciones = {
        1: {
            "accion": "click_unidad",
            "unidad_clickeada_id": unidad_1.get_instance_id()
        }
    }

    var contexto_valido = SeleccionUnidad.contexto_valido()

    assert_false(contexto_valido)

func test_mostrar_escena():
    pass_test("es un test de integracion")
    # # Preparar unidad a ser seleccionada
    # unidad_1 = load(UNIDAD_PATH).instance()
    # get_tree().get_root().add_child(unidad_1)
    # unidad_1.faccion = "faccion_activa"
    # unidad_1.vida = 50
    # unidad_1.equipamiento = ["espada"]

    # # Prerar menu que se va a mostrar
    # menu_unidad = load(MENU_UNIDAD_PATH).instance()
    # get_tree().get_root().add_child(menu_unidad)
    # menu_unidad.hide()

    # # Prerar menu lateral mapa que se va a mostrar
    # menu_lateral_mapa = load(MENU_LATERAL_MAPA_PATH).instance()
    # get_tree().get_root().add_child(menu_lateral_mapa)
    # menu_lateral_mapa.hide()

    # info_unidad = menu_lateral_mapa.find_node("info_unidad")

    # SeleccionUnidad.mostrar_escena()

    # assert_true(menu_unidad.visible)
    # assert_true(menu_lateral_mapa.visible)
    # assert_true(info_unidad.visible)

func test_procesar():
    var path_acciones = "/click_unidad"
    
    # Preparar unidad a ser seleccionada
    unidad_1 = load(UNIDAD_PATH).instance()
    get_tree().get_root().add_child(unidad_1)
    unidad_1.faccion = "faccion_activa"

    # Prerar Data
    Data.acciones = {
        1: {
            "accion": "click_unidad",
            "unidad_clickeada_id": unidad_1.get_instance_id()
        }
    }

    var aplica = SeleccionUnidad.procesar(path_acciones)

    assert_true(aplica)

    