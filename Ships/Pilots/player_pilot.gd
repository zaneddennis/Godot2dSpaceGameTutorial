extends "res://Ships/Pilots/pilot.gd"


func _physics_process(delta):
	HandleInput(delta)


func HandleInput(delta):
	if Input.is_action_pressed("throttle_up"):
		throttle.emit(1)
	elif Input.is_action_pressed("throttle_down"):
		throttle.emit(-1)
	else:
		throttle.emit(0)
	
	if Input.is_action_pressed("turn_left"):
		turn.emit(-1)
	elif Input.is_action_pressed("turn_right"):
		turn.emit(1)
	else:
		turn.emit(0)
