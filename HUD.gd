extends Control


@onready var main = get_parent().get_parent()
@onready var player = main.get_node("Player")


func _ready():
	pass


func _process(delta):
	$Throttle.value = player.throttle
	$Speed.text = "%.2f px/s" % player.velocity.length()
