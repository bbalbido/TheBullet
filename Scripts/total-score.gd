extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	# Calculate score here
	
	
	var score = 0x7FFFFFFF # Max int value
	var time = globals.time
	var shots = globals.shots
	
	if(time == 0):
		time = 1
	if(shots == 0):
		shots = 1
	
	print(str(score))
	score = score / time;
	score = score / shots;
	
	if(globals.legit == false):
		set_text("Start from level 1 to get a score.")
	else:
		set_text("Score: " + str(score))
	
	pass
