extends RigidBody2D

var speed = 700

func _on_enemy_body_enter(body):
	queue_free()
	if(body.get_name() == "Player"):
		get_tree().reload_current_scene() #should really be play player death animation and let player reset scene

func _ready():
	# Called every time the node is added to the scene.
	get_node("SamplePlayer").play("laser")
	var Direction = playervariables.get("playerLocation") - get_global_pos()
	Direction = Direction.normalized()
	set_global_pos(get_parent().get_global_pos() + (Direction * 50))
	set_linear_velocity(Direction * speed)
	connect("body_enter", self, "_on_enemy_body_enter")