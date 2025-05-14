extends CharacterBody2D

@export var speed = 600.0
@export var is_right_paddle: bool
@export var is_ai_player: bool = false
@onready var ball: RigidBody2D = $"../Ball"

func get_input():
	velocity = -transform.y * Input.get_axis("p1_down" if !is_right_paddle else "p2_down", "p1_up" if !is_right_paddle else "p2_up") * speed

func ai_player():
	var dead_zone = 10
	var distance_to_ball = ball.position.y - position.y
	if abs(distance_to_ball) <= dead_zone:
		velocity.y = 0
		return
	
	var target_speed = speed if distance_to_ball > 0 else -speed
	var interpolation_speed = 0.1
	velocity.y = lerp(velocity.y, target_speed, interpolation_speed)

func _ready() -> void:
	is_ai_player = GameManager.game_mode == "1_player" and is_right_paddle

func _physics_process(_delta: float) -> void:
	if is_ai_player:
		ai_player()
	else:
		get_input()
	move_and_slide()
