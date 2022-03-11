extends KinematicBody2D

#variaveis para animação

#var facing_right = false

#constants e variaveis de fisica

var y_velo = 0

export var SPEED = 500
export var JUMP_FORCE = 1000
export var GRAVITY = 50
export var MAX_FALL_SPEED = 1000

#referencias

#onready var sprite = $Sprite

func _physics_process(delta):
	
	#movimentação esquerda e direita
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):
		move_dir -= 1
	move_and_slide(Vector2(move_dir * SPEED, y_velo), Vector2(0 ,-1))
	
	var grounded = is_on_floor()
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
	
	#para eventual animação do sprite
	#if facing_right and move_dir < 0:
	#	flip()
	#if !facing_right and move_dir > 0:
	#	flip()

#Para eventual animação do sprite
#func flip():
#	facing_right = !facing_right
#	sprite.flip_h = !sprite.flip_h

	
	
	
