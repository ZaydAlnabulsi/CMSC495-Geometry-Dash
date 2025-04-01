extends Area2D

var speed = 600
var angle_speed = PI * 2

func _process(delta: float) -> void:
	rotation += angle_speed * delta
