extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var dest = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_enable_monitoring(true)
	pass

func _fixed_process(delta):
	var contactList = get_overlapping_bodies()
	
	for i in range(contactList.size()):
		if(contactList[i].get_name() == "Player"):
			get_tree().change_scene(dest)
	
	pass
