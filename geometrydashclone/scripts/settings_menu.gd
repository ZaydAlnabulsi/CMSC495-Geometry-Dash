extends Control


func _on_back_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/main_menu.tscn")
