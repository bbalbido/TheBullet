# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var i = 0
var pressed = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if event.button_index == BUTTON_LEFT and event.pressed == false:
			while (i != 7 and pressed == 0):
        # do something
				pressed = 1
				i+=1
				
				if (i == 7 and event.button_index == BUTTON_LEFT):
					get_tree().change_scene("main_menu.tscn")
			pressed = 0
			
			