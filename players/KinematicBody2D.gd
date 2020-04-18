extends KinematicBody2D
const speed = 60
const g = 10
const jump = -250
const FLOOR = Vector2(0,-1)
var velocity = Vector2()
var ground = false
func _physics_process(delta):

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0

	if Input.is_action_pressed("ui_up"):
		if ground == true:
			velocity.y = jump
	ground = false

	velocity.y += g
	if is_on_floor():
		ground = true
	velocity = move_and_slide(velocity,FLOOR)
