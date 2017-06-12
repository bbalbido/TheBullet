extends KinematicBody2D
export var MOTION_SPEED = 350
# TODO(kjayakum): Update the path of the bullet to the bullet scene or group
onready var bullet = preload("res://Bullet.tscn")
onready var root_node = get_node(".")

onready var shotsFiredLabel = get_node("HUD").get_node("HudCanvas").get_node("ShotsLabel")

onready var cam = get_node("Camera2D")
var shaken = false
var shakeTick = 0

var RayNode
var mouseLoc
var count

var sprite
var animationPlayer
#var animationPlaying = false;

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
	sprite = get_node("Sprite")
	animationPlayer = get_node("AnimationPlayer")
	
	count = 1
	playervariables.set("playerRID", get_instance_ID())

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == 1):
			if(count > 0):
				if(mouseLoc != null):
					var bulletVector = mouseLoc - get_pos()
					bulletVector.normalized()
					var cur = bullet.instance()
					cur.set_dir(get_pos(), mouseLoc)
					root_node.get_parent().add_child(cur)
					count = count - 1
					shotsFiredLabel._incrementShot()
					shaken = true
				else:
					root_node.get_node("Area2D").get_node("SamplePlayer2D").play("empty")

func _fixed_process(delta):
	var motion = Vector2()
	
	if(shaken):
		shake()

	if(Input.is_action_pressed("ui_up")):
		
		#	animationPlayer.queue("player_down")
		motion += Vector2(0, -1) #add 0 to x and -1 to y

	if(Input.is_action_pressed("ui_down")):
		#if(!animationPlaying):
		#	animationPlayer.play("player_down")
		#	animationPlaying = true;
		motion+= Vector2(0, 1)
	if(Input.is_action_pressed("ui_right")):
		motion+= Vector2(1, 0)
	if(Input.is_action_pressed("ui_left")):
		motion+= Vector2(-1, 0)
	if(Input.is_action_pressed("reset")):
		get_tree().reload_current_scene()

	motion = motion.normalized() * MOTION_SPEED * delta
	if(motion != Vector2(0,0) && animationPlayer.get_current_animation() != "player_move"):
		animationPlayer.play("player_move")
	if(motion == Vector2(0,0)):
		animationPlayer.stop(true)
		animationPlayer.play("player_idle")
	move(motion)
	if (is_colliding()):
        var n = get_collision_normal()
        motion = n.slide(motion)
        move(motion)

	mouseLoc = get_node("Camera2D").get_global_mouse_pos()
	var angle = get_pos().angle_to_point(mouseLoc)
	#get_node("Sprite").set_rot(angle)
	#get_node("Collision1").set_rot(angle)
	set_rot(angle)
	playervariables.set("playerLocation", get_global_pos())

func shake():
	var camPos = cam.get_pos()
	
	if(shakeTick == 0):
		camPos.x = camPos.x + 4
		camPos.y = camPos.y + 4
		cam.set_pos(camPos)
		shakeTick = shakeTick + 1
	elif(shakeTick == 1):
		camPos.x = camPos.x - 8
		camPos.y = camPos.y - 8
		cam.set_pos(camPos)
		shakeTick = shakeTick + 1
	elif(shakeTick == 2):
		camPos.x = camPos.x + 4
		camPos.y = camPos.y + 4
		cam.set_pos(camPos)
		shakeTick = -1
		shaken = false
	else:
		shakeTick = 0
	
	pass
