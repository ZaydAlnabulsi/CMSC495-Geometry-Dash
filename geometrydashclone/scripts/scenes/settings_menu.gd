extends Control


func _on_back_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/main_menu.tscn")


func _on_difficulty_minus_button_pressed() -> void:
	match Global.difficulty:
		3:
			Global.difficulty = 2
			get_node("GridContainer/DifficultySettingLabel").text = "Medium"
		2:
			Global.difficulty = 1
			get_node("GridContainer/DifficultySettingLabel").text = "Easy"


func _on_difficulty_plus_button_pressed() -> void:
	match Global.difficulty:
		1:
			Global.difficulty = 2
			get_node("GridContainer/DifficultySettingLabel").text = "Medium"
		2:
			Global.difficulty = 3
			get_node("GridContainer/DifficultySettingLabel").text = "Hard"


func _on_music_volume_minus_button_pressed() -> void:
	if Global.music_volume > 1:
		Global.music_volume -= 1
		get_node("GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)

func _on_music_volume_plus_button_pressed() -> void:
	if Global.music_volume < 10:
		Global.music_volume += 1
		get_node("GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)


func _on_sound_effects_volume_minus_button_pressed() -> void:
	if Global.sound_effects_volume > 1:
		Global.sound_effects_volume -= 1
		get_node("GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)


func _on_sound_effects_volume_plus_button_pressed() -> void:
	if Global.sound_effects_volume < 10:
		Global.sound_effects_volume += 1
		get_node("GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
