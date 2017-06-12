extends RigidBody2D

var speed = 700

func set_dir(var PlayerDir, var MouseLoc):
	var angle = PlayerDir.angle_to_point(MouseLoc)
	get_node("BulletSprite").set_rot(angle)
	
	var BulletVector = MouseLoc - PlayerDir;
	BulletVector = BulletVector.normalized();
	set_pos(PlayerDir  + (BulletVector * 60))
	set_linear_velocity(BulletVector * speed);
	connect("body_enter", self, "_on_enemy_body_enter")

func _on_enemy_body_enter(body):
	queue_free()
	if(body.get_name() == "Player"):
		get_tree().reload_current_scene() #should really be play player death animation and let player reset scene
		#get_tree().change_scene("res://main-menu.tscn")

func _ready():
	# Called every time the node is added to the scene.
	spawn()
func spawn():
	var pLoc = playervariables.get("playerLocation")
	get_node("SamplePlayer").play("laser")
	set_contact_monitor(true)
	var Direction = pLoc - get_global_pos()
	Direction = Direction.normalized()
	set_pos(get_parent().get_pos() + (Direction * 60))
	set_linear_velocity(Direction * speed)
	connect("body_enter", self, "_on_enemy_body_enter")