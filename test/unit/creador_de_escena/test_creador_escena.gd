extends "res://addons/gut/test.gd"

func test_mostrar_menu_unidad():
    var target_signal = "mostrar_menu_unidad_signal"

    watch_signals(CreadorEscena)

    CreadorEscena\
    .iniciar()\
    .mostrar_menu_unidad()\
    .build()


    assert_signal_emitted(CreadorEscena, target_signal)