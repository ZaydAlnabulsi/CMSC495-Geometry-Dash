extends Control


func _on_level_1_button_pressed() -> void:
	Global.set_scene_change_root(1)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")


func _on_test_level_button_pressed() -> void:
	Global.set_scene_change_root(2)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")
