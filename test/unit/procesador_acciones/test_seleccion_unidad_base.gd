extends "res://addons/gut/test.gd"

const DOBLE_PATH = 'res://test/unit/procesador_acciones/doble_procesador_acciones_implementacion.gd'
var sut
var accion_valida = "/click_unidad"

func after_each():
    autoqfree(sut)

func test_procesar_devuelve_false_por_defecto():
    var path_acciones = accion_valida
    sut = load("res://procesador_acciones/procesador_acciones_base.gd").new()

    var aplica = sut.procesar(path_acciones)

    assert_false(aplica)

func test_procesar_devuelve_true_cuando_aplica():
    var path_acciones = accion_valida
    var configuracion = {
        "aplica": true,
        "contexto_valido": true
    }

    sut = load(DOBLE_PATH).new(configuracion)
    
    var aplica = sut.procesar(path_acciones)

    assert_true(aplica)

func test_procesar_aplica_pero_contexto_invalido():
    var path_acciones = accion_valida
    var configuracion = {
        "aplica": true,
        "contexto_valido": false
    }
    sut = load(DOBLE_PATH).new(configuracion)
    
    var aplica = sut.procesar(path_acciones)

    assert_true(aplica)

func test_procesar_devuelve_false_cuando_no_aplica():
    var path_acciones = "no aplica esta accion"
    var configuracion = {
        "aplica": false
    }
    sut = load(DOBLE_PATH).new(configuracion)

    var aplica = sut.procesar(path_acciones)

    assert_false(aplica)