extends Area2D

func _ready():
	connect("body_enter", self, "on_pickup")
	pass

func on_pickup(body):
	if (body.is_in_group("pickupable")):
		get_parent().count += 1
		body.free()