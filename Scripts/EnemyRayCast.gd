extends RayCast2D
var enemy_root
var angle

func _ready():
	enemy_root = get_parent()
	set_fixed_process(true)
	add_exception(enemy_root)
	force_raycast_update() #Allows the collided node to be deleted within the same frame

func _fixed_process(delta):
	var self_gtrans = self.get_global_transform()
	var player_local = self_gtrans.xform_inv(playervariables.get("playerLocation"))
	set_cast_to(player_local)
	if(is_colliding()):
		if(get_collider().get_instance_ID() == playervariables.get("playerRID")):
			var angle = get_pos().angle_to_point(player_local)
			enemy_root.rotate(angle)
			#enemy_root.set_rot(angle)
			enemy_root.aggro = true
		else:
			enemy_root.aggro = false