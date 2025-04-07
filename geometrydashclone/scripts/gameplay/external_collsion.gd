extends Area2D

##	Function that causes player's death on collision
func _on_area_entered(area):
	if area.is_in_group("kill") :
		get_node("/root/SceneManager").get_child(0).display_death_overlay()
		$"..".death()
		self.queue_free()
