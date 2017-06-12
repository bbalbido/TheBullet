extends PathFollow2D

var enemy_node

func _ready():
	set_fixed_process(true);
	enemy_node = get_child(0)

func _fixed_process(delta):
	var move = get_offset() + (25 * delta);
	set_offset(move)