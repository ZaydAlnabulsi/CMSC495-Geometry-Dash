extends Area2D

##	Variable to hold the GamePlay node
@onready var gameplay = get_node("/root/SceneManager/Gameplay")

##	Function that causes player's death on collision
func _on_body_entered(body):
	if body.is_in_group("kill") :
		gameplay.display_death_overlay()
		$"..".death()
		self.queue_free() 
