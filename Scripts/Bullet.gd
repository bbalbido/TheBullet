extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 2
var angle

func set_dir(var PlayerDir, var MouseLoc):
	angle = PlayerDir.angle_to_point(MouseLoc)
	get_node("BulletSprite").set_rot(angle)
	set_pos(PlayerDir)
	var BulletVector = MouseLoc - PlayerDir;
	BulletVector.normalized();
	set_linear_velocity(BulletVector * speed);
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
func _fixed_process(delta):
	pass