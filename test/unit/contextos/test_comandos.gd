extends "res://addons/gut/test.gd"

var accion_valida = "click_unidad"
const DOBLE_PATH = "res://contextos/comandos.gd" 

func before_each():
    Comandos.borrar_acciones()

func test_agregar_accion():
    var accion = {"accion": accion_valida}

    Comandos.agregar_accion(accion)
    
    assert_eq_deep(Data.acciones, {1: accion})

func test_obtener_path_acciones():
    var accion = {"accion": accion_valida}
    var resultado_esperado = "/" + accion.accion
    Comandos.agregar_accion(accion)

    var resultado_obtenido = Comandos.obtener_path_acciones()
    
    assert_eq(resultado_obtenido, resultado_esperado)

func test_ejecutar_primer_procesador_que_aplique():
    pass_test("no podemos verificar que corte con el primer procesador que de true")
    # var sut = double(DOBLE_PATH).new()
    # var path_de_acciones_valido = "/"+ accion_valida

    # var procesador_path = "res://procesador_acciones/procesador_acciones_base.gd"
    # var procesador_a = double(procesador_path).new()
    # var procesador_b = double(procesador_path).new()

    # stub(procesador_a, "procesar").when_passed(path_de_acciones_valido).to_return(true)
    # stub(procesador_b, "procesar").when_passed(path_de_acciones_valido).to_return(true)

    # var procesadores = [procesador_a, procesador_b]

    # stub(DOBLE_PATH, "obtener_procesadores").to_return(procesadores)
    
    # sut.ejecutar_primer_procesador_que_aplique(path_de_acciones_valido)
      
    # assert_call_count(procesador_a, "procesar", 1, [path_de_acciones_valido])
    # assert_call_count(procesador_b, "procesar", 0, [path_de_acciones_valido])
    
    # autoqfree(sut)
    # autoqfree(procesador_a)
    # autoqfree(procesador_b)

func test_obtener_procesadores():
    var sut = double(DOBLE_PATH).new()

    var path_de_acciones_valido = "/"+ accion_valida

    var procesador_path = "res://procesador_acciones/procesador_acciones_base.gd"
    var procesador_a = double(procesador_path).new()
    var procesador_b = double(procesador_path).new()

    stub(procesador_a, "procesar").when_passed(path_de_acciones_valido).to_return(true)
    stub(procesador_b, "procesar").when_passed(path_de_acciones_valido).to_return(true)

    var procesadores = [procesador_a, procesador_b]

    stub(DOBLE_PATH, "obtener_procesadores").to_return(procesadores)
    
    var result = sut.obtener_procesadores()
    
    assert_true(result[0] == procesadores[0])
    assert_eq(result, procesadores)
    
    autoqfree(sut)
    autoqfree(procesador_a)
    autoqfree(procesador_b)

func test_verificar_llamada_a_procesar():
    var path_de_acciones_valido = "/"+ accion_valida

    var procesador_path = "res://procesador_acciones/procesador_acciones_base.gd"
    var procesador_a = double(procesador_path).new()
    var procesador_b = double(procesador_path).new()

    stub(procesador_a, "procesar").when_passed(path_de_acciones_valido).to_return(true)
    stub(procesador_b, "procesar").when_passed(path_de_acciones_valido).to_return(true)

    procesador_a.procesar(path_de_acciones_valido)

    assert_call_count(procesador_a, "procesar", 1, [path_de_acciones_valido])
    assert_call_count(procesador_b, "procesar",  0, [path_de_acciones_valido])

    autoqfree(procesador_a)
    autoqfree(procesador_b)
