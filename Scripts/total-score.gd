extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# Calculate score here
	
	
	
	var score = 0x7FFFFFFF # Max int value
	print(str(score))
	score = score / globals.time;
	score = score / globals.shots;
	
	set_text("Score: " + str(score))
	
	pass
