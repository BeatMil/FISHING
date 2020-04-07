extends Node2D


func _ready() -> void:
	var loli = get_node("illiya").get_nickname()
	print(loli.substr(0,3))

