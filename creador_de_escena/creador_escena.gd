extends Node

# Componentes
const mostrar_componente_key = "mostrar"
var menu_unidad = "menu_unidad"

# Signals
signal mostrar_menu_unidad_signal(_configuracion)

# Escena a construir, con valores por defecto
var escena = {
    menu_unidad: {mostrar_componente_key: "false"}
}

func mostrar_menu_unidad() -> Node:
    escena[menu_unidad] = {mostrar_componente_key: "true"}
    emit_signal("mostrar_menu_unidad_signal", escena[menu_unidad])
    return self