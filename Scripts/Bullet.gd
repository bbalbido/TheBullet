extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 1000
var angle

func set_dir(var PlayerDir, var MouseLoc):
	angle = PlayerDir.angle_to_point(MouseLoc)
	get_node("BulletSprite").set_rot(angle)
	
	var BulletVector = MouseLoc - PlayerDir;
	BulletVector = BulletVector.normalized();
	set_pos(PlayerDir  + (BulletVector *90))
	set_linear_velocity(BulletVector * speed);
	connect("body_enter", self, "_on_enemy_body_enter")
	#if we want it to be based off of mouse position Don't normalize the Bullect Vector
	pass

func _ready():
	# Called every time the node is added to the scene.
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	pass
	
func _on_enemy_body_enter(body):
    pass
func _fixed_process(delta):
	pass