extends StaticBody2D

@onready var player = get_node("../Player")

func _process(delta):
	position.x = player.position.x + 250
	$Sprite2D.region_rect.position.x += (player.SPEED / 60) * delta
