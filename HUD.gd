extends Control


@export var player : Ship


func _ready():
	pass


func _process(delta):
	$Throttle.value = player.speed / player.maxSpeed
	$Speed.text = "%.2f px/s" % player.velocity.length()
