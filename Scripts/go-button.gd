extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var dest = ""

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _pressed():
	# get_tree().change_scene("res://level-01.tscn")
	get_tree().change_scene(dest);
	
