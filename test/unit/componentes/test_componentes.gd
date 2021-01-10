extends "res://addons/gut/test.gd"

var sut

# Keys de configuracion de componentes
const mostrar_componente = "mostrar"
const deshabilitar_componente = "deshabilitar"

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

func test_deshabilitar_button():
    # Arrange
    sut = load(SUT_PATH).new()

    var boton = Button.new()
    var boton_script = load(SUT_PATH)
    boton.set_script(boton_script)
    boton.name = "boton"
    
    sut.agregar_hijo(boton.get_instance_id())

    var configuracion_test = {
        mostrar_componente: true,
        "boton" : {
            mostrar_componente: true,
            deshabilitar_componente: true
        }
    }

    # Act
    sut.mostrar(configuracion_test)

    # Assert
    assert_true(sut.visible)
    assert_true(boton.visible)
    assert_true(boton.disabled)

    autoqfree(boton)