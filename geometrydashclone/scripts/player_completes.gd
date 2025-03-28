extends Area2D

signal player_alive

func _level_completed(body):
	if body.is_in_group("pass"):
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
		# set up path and created duplicate new scene from the first 
		#if player reaches end of level plane
		emit_signal("player_alive")
		print("You survived.")	
	
	
		
