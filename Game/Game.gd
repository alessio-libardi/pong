extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var screen_size = get_viewport_rect().size

var left_paddle_position = Vector2(50, (screen_size.y / 2))
var right_paddle_position = Vector2(screen_size.x - 50, (screen_size.y / 2))
var ball_position = Vector2(screen_size.x / 2, screen_size.y / 2)

var velocity = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	left_paddle_position = Vector2(50, (screen_size.y / 2))
	right_paddle_position = Vector2(screen_size.x - 50, (screen_size.y / 2))
	ball_position = Vector2(screen_size.x / 2, screen_size.y / 2)
	
	$LeftPaddle.position = left_paddle_position
	$RightPaddle.position = right_paddle_position
	$Ball.position = ball_position

func _physics_process(delta):
	$LeftPaddle.position.y = clamp($LeftPaddle.position.y, 100, screen_size.y - 100)
	$RightPaddle.position.y = clamp($RightPaddle.position.y, 100, screen_size.y - 100)
	
	var collision = $Ball.move_and_collide((velocity * 400) * delta)
	if collision:
		print(collision.collider.name)
		velocity = velocity.bounce(collision.normal)

func _on_Menu_pressed():
	Global.goto_scene('res://Menu/Menu.tscn')
