extends Area2D

##	Variables that hold the saw's properties
var speed = 600
var angle_speed = PI * 2

##	Rotates the saw
func _process(delta: float) -> void:
	rotation += angle_speed * delta
