extends RigidBody2D

var speed = 700

func _on_enemy_body_enter(body):
	queue_free()
	if(body.get_name() == "Player"):
		get_tree().reload_current_scene() #should really be play player death animation and let player reset scene
		#get_tree().change_scene("res://main-menu.tscn")

func _ready():
	# Called every time the node is added to the scene.
	set_contact_monitor(true)
	#var self_gtrans = self.get_global_transform()
	#var player_local = self_gtrans.xform_inv(playervariables.get("playerLocation"))
	get_node("SamplePlayer").play("laser")
	var Direction = playervariables.get("playerLocation") - get_global_pos()
	Direction = Direction.normalized()
	set_pos(get_pos() + (Direction * 60))
	set_linear_velocity(Direction * speed)
	connect("body_enter", self, "_on_enemy_body_enter")