extends "res://addons/gut/test.gd"

var sut
const mostrar_componente = "mostrar"

const SUT_PATH = "res://componentes/componente_controlador.gd"

func after_each():
    autoqfree(sut)

func test_agregar_hijo():
    sut = load(SUT_PATH).new()
    var hijo = load(SUT_PATH).new()
    
    sut.agregar_hijo(hijo)

    assert_has(sut.hijos, hijo)
    autoqfree(hijo)

func test_ocultar():
    sut = load(SUT_PATH).new()

    sut.ocultar()

    assert_false(sut.visible)

func test_mostrar():
    sut = load(SUT_PATH).new()

    sut.mostrar()

    assert_true(sut.visible)

func test_mostrar_hijo():
    sut = load(SUT_PATH).new()
    
    # Preparar Hijo
    var hijo = load(SUT_PATH).new()
    hijo.name = "hijo"
    hijo.hide()

    # Configuracion para el root del componente
    var configurcion = {
        hijo.name: {
            mostrar_componente: true
        }
    }

    sut.agregar_hijo(hijo.get_instance_id())

    sut.mostrar(configurcion)

    assert_true(sut.visible)
    assert_true(hijo.visible)

    autoqfree(hijo)

func test_mostrar_nieto():
    sut = load(SUT_PATH).new()

    # Preparar Nieto
    var nieto = load(SUT_PATH).new()
    nieto.name = "nieto"
    nieto.hide()
    
    # Preparar Hijo
    var hijo = load(SUT_PATH).new()    
    hijo.agregar_hijo(nieto.get_instance_id())
    hijo.name = "hijo"
    hijo.hide()
    
    # Configuracion para el root del componente
    var configurcion = {
        hijo.name: {
            mostrar_componente: true,
            nieto.name: {
                mostrar_componente: true
            }
        }   
    }
    sut.agregar_hijo(hijo.get_instance_id())
    

    sut.mostrar(configurcion)

    assert_true(sut.visible)
    assert_true(hijo.visible)
    assert_true(nieto.visible)

    autoqfree(hijo)
    autoqfree(nieto)