extends Control

func _on_new_game_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/level1.tscn")


func _on_settings_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/settings_menu.tscn")
