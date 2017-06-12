extends Node2D

onready var bullet = preload("res://enemyBullet.tscn")
export var isAlive = true
var aggro = false;
var animationPlaying = false;
export var reloadMax = 90
var sprite
var animationPlayer
var reload = 0

func _ready():
	set_fixed_process(true)
	sprite = get_node("Sprite")
	animationPlayer = get_node("AnimationPlayer")
	animationPlayer.set_speed(0.5)

func _fixed_process(delta):
	if(aggro && reload == 0):
		reload = reloadMax
		shoot()
	if(reload > 0):
		reload -= 1
	if(!aggro):
		if (animationPlayer.get_current_animation() != "enemy_idle" ):
			animationPlayer.play("enemy_idle")
	else:
		animationPlayer.stop(false)

func shoot():
	reload = reloadMax
	var cur = bullet.instance()
	add_child(cur)
