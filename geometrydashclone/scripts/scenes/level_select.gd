extends Control

##	Starts level 1
func _on_level_1_button_pressed() -> void:
	Global.set_scene_change_root(1)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")

##	Starts the test level
func _on_test_level_button_pressed() -> void:
	Global.set_scene_change_root(2)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")

##	Returns to the main menu
func _on_back_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/main_menu.tscn")
