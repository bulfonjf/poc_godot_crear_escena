extends Node

func unir(source : Dictionary, target: Dictionary):
    for key in source.keys():
        target[key] = source[key]
        
