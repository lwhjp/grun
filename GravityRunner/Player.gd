extends KinematicBody2D

export var gravity_direction = Vector2.DOWN
var velocity = Vector2()

func _process(delta):
	# Select sprite
	var sprite
	var flip = false
	var speed = 1.0
	if velocity.length() < 1:
		sprite = 'wait'
	elif is_on_floor():
		sprite = 'run'
		flip = velocity.dot(gravity_direction.tangent()) < 0
		speed = velocity.length() * 0.05
	else:
		sprite = 'fall'
	$AnimatedSprite.animation = sprite
	$AnimatedSprite.flip_h = flip
	$AnimatedSprite.speed_scale = speed

func _physics_process(delta):
	rotation = Vector2.DOWN.angle_to(gravity_direction)
	velocity += delta * gravity_direction * 98
	velocity = move_and_slide(velocity, -gravity_direction, false, 4, deg2rad(60), true)
	# Slow down on level
	if is_on_floor() and abs(get_floor_normal().angle_to(-gravity_direction)) < deg2rad(10):
		velocity *= pow(0.5, delta)
		if velocity.length() < 10:
			velocity = Vector2()
