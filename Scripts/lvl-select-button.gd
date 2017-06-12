extends TextureButton

func _ready():
	pass

func _pressed():
	# Reset stats here
	globals.time = 0
	globals.shots = 0
	globals.legit = false;
	
	get_tree().change_scene("res://level-select.tscn")
