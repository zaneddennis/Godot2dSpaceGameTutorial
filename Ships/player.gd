extends "res://Ships/ship.gd"


func _physics_process(delta):
	HandleInput(delta)
	super(delta)


func HandleInput(delta):
	if Input.is_action_pressed("throttle_up"):
		ThrottleUp(delta)
	if Input.is_action_pressed("throttle_down"):
		ThrottleDown(delta)
	
	if Input.is_action_pressed("turn_left"):
		TurnLeft()
	elif Input.is_action_pressed("turn_right"):
		TurnRight()
	else:
		TurnStraight()
