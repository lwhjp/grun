extends Node

var tilt = 0
var score = 0
var total_prizes

func updateHUD():
	$HUD/Score.text = '%d / %d' % [score, total_prizes]

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	total_prizes = $Prizes.get_child_count()
	updateHUD()

func _input(event):
	if event is InputEventMouseMotion:
		tilt += PI * event.relative.x / get_viewport().size.x
		$Player.gravity_direction = Vector2.DOWN.rotated(-tilt)
	elif event.is_action_pressed('ui_cancel'):
		get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _on_Player_got_prize():
	score += 1
	updateHUD()
