extends KinematicBody2D

class_name Paddle

export (int) var speed = 400
export var go_up_action = 'ui_up'
export var go_down_action = 'ui_down'

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed(go_down_action):
		velocity.y += 1
	if Input.is_action_pressed(go_up_action):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
