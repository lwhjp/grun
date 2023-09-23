extends KinematicBody2D

export var gravity_direction = Vector2.DOWN
var velocity = Vector2()

func _physics_process(delta):
	rotation = Vector2.DOWN.angle_to(gravity_direction)
	velocity += delta * gravity_direction * 98
	velocity = move_and_slide(velocity, -gravity_direction, true, 4, deg2rad(20), false)
