extends Node

var tilt = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		tilt += PI * event.relative.x / get_viewport().size.x
		$Player.gravity_direction = Vector2.DOWN.rotated(-tilt)
	elif event.is_action_pressed('ui_cancel'):
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
