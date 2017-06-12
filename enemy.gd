extends Node2D

onready var bullet = preload("res://enemyBullet.tscn")
export var isAlive = true
var aggro = false;
export var reloadMax = 90
var reload = 0
onready var root_node = get_node(".")
func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(aggro && reload == 0):
		reload = reloadMax
		shoot()
	if(reload > 0):
		reload -= 1

func shoot():
	reload = reloadMax
	var cur = bullet.instance()
	add_child(cur)