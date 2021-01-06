extends Node

func remove_children(source : Node):
    for child in source.get_children():
        source.remove_child(child)
        child.queue_free()
        
