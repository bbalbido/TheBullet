extends RigidBody2D

var speed = 1400

func set_path(var spawn_loc_global):
	var angle = spawn_loc_global.angle_to_point(playervariables.get("playerLocation"))
	set_global_rot(angle)
	var Direction = playervariables.get("playerLocation") - spawn_loc_global
	Direction = Direction.normalized()
	set_global_pos(spawn_loc_global + (Direction * 54))
	set_linear_velocity(Direction * speed)

func _on_enemy_body_enter(body):
	queue_free()
	if(body.get_name() == "Player"):
		get_tree().reload_current_scene() #should really be play player death animation and let player reset scene

func _ready():
	# Called every time the node is added to the scene.
	get_node("SamplePlayer").play("laser")
	connect("body_enter", self, "_on_enemy_body_enter")