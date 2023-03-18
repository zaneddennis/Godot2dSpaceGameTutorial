extends CharacterBody2D
class_name Ship


@export var maxSpeed = 256.0  # px/s
@export var turnSpeed = TAU/6  # rads/s
@export var acceleration = 128.0  # px/s

@export var pilot : Pilot

var speed = 0.0

var throttle = 0
var turning = 0


func _ready():
	# set up Pilot
	assert(pilot)
	pilot.throttle.connect(_on_pilot_throttle)
	pilot.turn.connect(_on_pilot_turn)


func _physics_process(delta):
	speed += float(throttle) * acceleration * delta
	speed = clamp(speed, 0.0, maxSpeed)
	
	rotation += turning * turnSpeed * delta
	
	var dir = Vector2(cos(rotation), sin(rotation))
	velocity = dir * speed
	
	HandleAnimations()
	
	move_and_slide()


func HandleAnimations():
	if throttle or turning:
		$AnimatedSprite2D.play("go")
	else:
		$AnimatedSprite2D.play("idle")


func _on_pilot_throttle(value):
	throttle = value

func _on_pilot_turn(value):
	turning = value
