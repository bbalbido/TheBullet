extends StreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func exitSound():
	get_node("SamplePlayer").play("exit")
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
