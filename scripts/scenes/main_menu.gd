extends Control

##	Main menu new game button connected function
##	Opens the gameplay scene
func _on_new_game_button_pressed() -> void:
	Global.set_scene_change_root(1)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")

##	Main menu settings button connected function
##	Opens the settings scene
func _on_settings_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/settings_menu.tscn")

##	Main menu exit button connected function
##	Exits the game
func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_dev_test_button_pressed() -> void:
	Global.set_scene_change_root(2)
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")
