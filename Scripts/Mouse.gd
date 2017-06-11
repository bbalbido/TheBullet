extends Node

func _ready():
	var reticle_icon = preload("res://Pictures/reticle.png")
	var offset = Vector2(16, 16)
	Input.set_custom_mouse_cursor(reticle_icon, offset);