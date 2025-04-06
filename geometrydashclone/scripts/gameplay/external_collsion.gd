extends Area2D

@onready var gameplay = get_node("/root/SceneManager/Gameplay")

func _on_area_entered(area):
	if area.is_in_group("kill") :
		gameplay.display_death_overlay()
		$"..".death()
		self.queue_free()
