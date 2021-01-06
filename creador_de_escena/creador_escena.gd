extends Node

# Componentes
const mostrar_componente = "mostrar"
var menu_unidad = "menu_unidad"
var menu_lateral_mapa = "menu_lateral_mapa"
var info_unidad = "info_unidad"
var ataque = "ataque"

# Signals
signal mostrar_menu_unidad_signal(_configuracion)
signal mostrar_menu_lateral_mapa_signal(_configuracion)
signal configurar_ataque(_configuracion)

# Escena a construir, con valores por defecto
var escena_por_defecto = {
    menu_unidad: {mostrar_componente: false},
    menu_lateral_mapa: {mostrar_componente: false},
    ataque: {mostrar_componente: false}
}
var escena = {}

func iniciar() -> Node:
    escena = escena_por_defecto.duplicate()
    return self
    
func mostrar_menu_unidad() -> Node:
    escena[menu_unidad] = {mostrar_componente: true}
    return self

func mostrar_info_unidad(unidad_id) -> Node:
    escena[menu_lateral_mapa] = {
        mostrar_componente: true,
        info_unidad: {
            mostrar_componente: true,
            "unidad_a_mostrar_id": unidad_id
        }
    }
    return self

func mostrar_ataque() -> Node:
    escena[ataque] = {
        mostrar_componente: true
    }
    return self

func build():
    emit_signal("mostrar_menu_unidad_signal", escena[menu_unidad])
    emit_signal("mostrar_menu_lateral_mapa_signal", escena[menu_lateral_mapa])
    emit_signal("configurar_ataque", escena[ataque])
