extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var bullet = preload("res://enemyBullet.tscn")
onready var root_node = get_node(".")
export var isAlive = true
var aggro = false;
var animationPlaying = false;
export var reloadMax = 90
export var reload = 90
var pLoc
var sprite
var animationPlayer

#export var maxRotate = .000000001;
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)
	sprite = get_node("Sprite")
	animationPlayer = get_node("AnimationPlayer")
	#get_node("RayCast2D").add_exception(get_node("CollisionShape2D"))
	#get_node("RayCast2D").add_exception(get_node("ShieldWall"))
>>>>>>> 465fc1d1ce4cb7d84c190636422e5e86c0b02589
	pass
func _fixed_process(delta):
	#print(get_node("RayCast2D").get_collision_point())
	#if we want bullet to collide we need to add player code
	_checkAggro()
	if(aggro && (reload <= 0)):
		_shoot()
		
	if(!aggro):
		if (animationPlayer.get_current_animation() != "enemy_idle" ):
			animationPlayer.play("enemy_idle")
	else:
		animationPlayer.stop(false)
		
		
	#death
	reload = reload - 1
	
func _shoot():
	
	reload = reloadMax
	var bulletVector = pLoc - get_pos()
	bulletVector.normalized()
	var cur = bullet.instance()
	cur.set_dir(get_pos(), pLoc)
	root_node.get_owner().add_child(cur)

func _checkAggro():
	var space_state = get_world_2d().get_direct_space_state()
	pLoc = playervariables.get("playerLocation")
	var ignore = [self, get_parent(), get_parent().get_parent()]
	if(has_node("ShieldWall")):
		ignore = [self,get_parent(), get_parent().get_parent(), get_node("ShieldWall")]
	var result =space_state.intersect_ray(get_pos(), pLoc, ignore)#.linear_interpolate(get_pos(),2.0) )#need to add thrid paramater of own ri
	if(result.size() && result.rid.get_id() == playervariables.get("playerRID") ):
		
		#if(result.normal == Vector2(0, 1)):
			#print(result.normal)
		#interpolatedLine = result.position
		var angle = get_pos().angle_to_point(pLoc)
		#if(angle > maxRotate):
			#angle = -1 * maxRotate if (angle < 0) else maxRotate
		set_rot(angle)
		aggro = true
	else: 
		aggro = false