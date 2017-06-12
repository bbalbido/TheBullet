extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	set_text("Shots: " + str(globals.shots))
	
	pass

func _incrementShot():
	globals.shots = globals.shots + 1
	set_text("Shots: " + str(globals.shots))
