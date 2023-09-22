extends RigidBody2D

func _integrate_forces(state):
	rotation = Vector2.DOWN.angle_to(state.total_gravity)
