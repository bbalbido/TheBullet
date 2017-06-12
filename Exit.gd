extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var dest = ""
onready var globalSound = get_node("/root/globalmusic")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	# set_fixed_process(true)
	# set_enable_monitoring(true)
	connect("body_enter", self, "on_exit")
	pass

func on_exit(body):
	if(body.get_name() == "Player"):
		if(body.count > 0):
			globalSound.exitSound()
			get_tree().change_scene(dest)

func _process(delta):
	pass

# func _fixed_process(delta):
	# var contactList = get_overlapping_bodies()
	
	# for i in range(contactList.size()):
		# if(contactList[i].get_name() == "Player"):
			# get_tree().change_scene(dest)
	
	# pass
