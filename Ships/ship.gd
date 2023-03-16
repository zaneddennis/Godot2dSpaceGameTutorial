extends CharacterBody2D


@export var maxSpeed = 256  # px/s
@export var turnSpeed = TAU/6  # rads/s
@export var acceleration = .5  # throttle/s

var throttle = 0.0
var turning = 0


func _ready():
	pass


func _physics_process(delta):
	rotation += turning * turnSpeed * delta
	
	var dir = Vector2(cos(rotation), sin(rotation))
	velocity = dir * throttle * maxSpeed
	
	HandleAnimations()
	
	move_and_slide()


func ThrottleUp(delta):
	throttle += acceleration * delta
	throttle = clamp(throttle, 0.0, 1.0)

func ThrottleDown(delta):
	throttle -= acceleration * delta
	throttle = clamp(throttle, 0.0, 1.0)

func TurnLeft():
	turning = -1

func TurnRight():
	turning = 1

func TurnStraight():
	turning = 0


func HandleAnimations():
	if velocity or turning:
		$AnimatedSprite2D.play("go")
	else:
		$AnimatedSprite2D.play("idle")
