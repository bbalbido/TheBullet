extends KinematicBody2D
export var MOTION_SPEED = 350
# TODO(kjayakum): Update the path of the bullet to the bullet scene or group
onready var bullet = preload("res://Bullet.tscn")
onready var root_node = get_node(".")

var mouseLoc
var count
func _ready():
	set_fixed_process(true)
	set_process_input(true)
	count = 1
	playervariables.set("playerRID", get_instance_ID())

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == 1):
			if(count > 0):
				var bulletVector = mouseLoc - get_pos()
				bulletVector.normalized()
				var cur = bullet.instance()
				cur.set_dir(get_pos(), mouseLoc)
				root_node.get_parent().add_child(cur)
				count = count - 1

func _fixed_process(delta):
	var motion = Vector2()
	
	if(Input.is_action_pressed("ui_up")):
		motion += Vector2(0, -1)
		
	if(Input.is_action_pressed("ui_down")):
		motion+= Vector2(0, 1)
	if(Input.is_action_pressed("ui_right")):
		motion+= Vector2(1, 0)
	if(Input.is_action_pressed("ui_left")):
		motion+= Vector2(-1, 0)
	if(Input.is_action_pressed("reset")):
		get_tree().reload_current_scene()

	motion = motion.normalized() * MOTION_SPEED * delta
	move(motion)
	if (is_colliding()):
        var n = get_collision_normal()
        motion = n.slide(motion)
        move(motion)

	mouseLoc = get_node("Camera2D").get_global_mouse_pos()
	var angle = get_pos().angle_to_point(mouseLoc)
	set_rot(angle)
	playervariables.set("playerLocation", get_global_pos())