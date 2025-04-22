extends Area2D

##	Function that causes player's death on collision
func _on_area_entered(area):
	if area.is_in_group("levelEnd") :
		if Global.scene_manager.current_scene.scene_file_path == "res://scenes/gameplay.tscn":
			Global.scene_manager.current_scene.display_level_end_overlay()
		$"..".death()
		self.queue_free()
	if area.is_in_group("kill"):
		if Global.scene_manager.current_scene.scene_file_path == "res://scenes/gameplay.tscn":
			Global.scene_manager.current_scene.display_death_overlay()
		$"..".death()
		self.queue_free()
