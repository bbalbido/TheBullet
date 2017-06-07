extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	print("Readying Exit")
	set_contact_monitor(true)
	set_max_contacts_reported(5)
	connect("body_enter", self, "_on_enemy_body_enter")
	pass

func _on_enemy_body_enter(body):
	if(body.get_name() == "Player"):
		print("Hello world")
		# body.queue_free()
		#get_tree().reload_current_scene() #should really be play player death animation and let player reset scene
		# get_tree().change_scene("res://main-menu.tscn")
		get_tree().change_scene("res://level-02.tscn")

func _fixed_process(delta):
	pass