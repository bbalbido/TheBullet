extends Area2D

func _ready():
	connect("body_enter", self, "on_pickup")

func on_pickup(body):
	if (body.is_in_group("pickupable") ):
		body.get_node("KillSample").play("hit")
		if(randi() % 10 == 0):
			body.get_node("KillSample").play("die")
		var parent = get_parent()
		parent.queue_free()
