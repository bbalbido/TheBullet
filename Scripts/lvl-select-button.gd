extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _pressed():
	# Reset stats here
	globals.time = 0
	globals.shots = 0
	globals.legit = false;
	
	get_tree().change_scene("res://level-select.tscn")
