extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var t = get_node("Ticker")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	t.set_wait_time(1.0);
	t.connect("timeout",self,"_on_timer_timeout") 
	t.start()
	
	set_text("Time: " + str(globals.time))
	
	pass

func _on_timer_timeout():
	globals.time = globals.time + 1
	set_text("Time: " + str(globals.time))
	pass
