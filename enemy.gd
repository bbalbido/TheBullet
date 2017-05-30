extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isAlive = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)
	pass
func _fixed_process(delta):
	if(is_colliding()):
		var shape = get_collider()
		print("isColliding")
		if (shape.is_in_group("pickupable")):
			print("DICKS")
	#if we want bullet to collide we need to add player code
	#var space_state = get_world_2d().get_direct_space_state()
	#var result =space_state.intersect_ray(get_pos(), Globals.get("playerLocation"))#.linear_interpolate(get_pos(),2.0) )#need to add thrid paramater of own ri
	#if(result.size()):
		#interpolatedLine = result.position
		#print("is this something?")
	#death