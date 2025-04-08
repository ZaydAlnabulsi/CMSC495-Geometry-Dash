extends StaticBody2D

##	Variable to hold the player
@onready var player = get_node("../Player")

##	Function to keep the floor under the player
func _process(delta):
	position.x = player.position.x + 250
	$Sprite2D.region_rect.position.x += (player.SPEED / 60) * delta
