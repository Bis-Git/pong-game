extends RigidBody2D

@export var velocity = Vector2(200, 0)
const MAX_SPEED = 1000
var speed = 300

func tweak_angle(collision: KinematicCollision2D):
	var collision_position = collision.get_position()
	var paddle = collision.get_collider()
	var paddle_centre = paddle.global_position
	var paddle_height = (paddle.get_node("CollisionShape2D") as CollisionShape2D).shape.get_rect().size.y
	
	var centre_offset = collision_position.y - paddle_centre.y
	var normalized_offset = centre_offset / (paddle_height / 2.0)
	
	var max_angle = deg_to_rad(60)
	var angle_offset = normalized_offset * max_angle
	var direction_x = sign(velocity.x)
	
	var new_angle = angle_offset
	
	var new_velocity = Vector2(cos(new_angle), sin(new_angle)).normalized() * speed
	new_velocity.x = abs(new_velocity.x) * direction_x
	
	return new_velocity
	
func increase_speed():
	if speed < MAX_SPEED:
		speed = min(speed * 1.2, MAX_SPEED)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
			
		if collision.get_collider().is_in_group("paddle"):
			SoundManager.paddle_hit_sfx.play()
			velocity = tweak_angle(collision)
			increase_speed()
		if collision.get_collider().is_in_group("wall"):
			SoundManager.wall_hit_sfx.play()
