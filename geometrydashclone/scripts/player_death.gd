extends Area2D

signal player_died

func _on_body_entered(body):
	if body.is_in_group("kill"):
		get_tree().reload_current_scene()

		# added a signal to this method
		emit_signal("player_died")
		print("player has died.")
		# could be use to trigger game over screen 
		# added print for testing purposes 
		
	
