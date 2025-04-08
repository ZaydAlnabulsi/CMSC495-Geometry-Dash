extends Control

##	Godot engine ready() function
##	Sets appropriate settings based on global variables
func _ready() -> void:
	match Global.difficulty:
		1:
			get_node("GridContainer/DifficultySettingLabel").text = "Easy"
		2:
			get_node("GridContainer/DifficultySettingLabel").text = "Medium"
		3:
			get_node("GridContainer/DifficultySettingLabel").text = "Hard"
	get_node("GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)
	get_node("GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)

##	Settings menu back button connected function
##	Returns to main menu
func _on_back_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/main_menu.tscn")

##	Settings menu decrease difficulty button connected function
##	Decreases difficulty by 1 if able
func _on_difficulty_minus_button_pressed() -> void:
	match Global.difficulty:
		3:
			Global.difficulty = 2
			get_node("GridContainer/DifficultySettingLabel").text = "Medium"
		2:
			Global.difficulty = 1
			get_node("GridContainer/DifficultySettingLabel").text = "Easy"

##	Settings menu increase difficulty button connected function
##	Increases difficulty by 1 if able
func _on_difficulty_plus_button_pressed() -> void:
	match Global.difficulty:
		1:
			Global.difficulty = 2
			get_node("GridContainer/DifficultySettingLabel").text = "Medium"
		2:
			Global.difficulty = 3
			get_node("GridContainer/DifficultySettingLabel").text = "Hard"

##	Settings menu decrease music volume button connected function
##	Decreases music volume by 1 if able
func _on_music_volume_minus_button_pressed() -> void:
	if Global.music_volume > 1:
		Global.music_volume -= 1
		get_node("GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)

##	Settings menu increase music volume button connected function
##	Increases music volume by 1 if able
func _on_music_volume_plus_button_pressed() -> void:
	if Global.music_volume < 10:
		Global.music_volume += 1
		get_node("GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)

##	Settings menu increase sound effects volume button connected function
##	Increases sound effects volume by 1 if able
func _on_sound_effects_volume_minus_button_pressed() -> void:
	if Global.sound_effects_volume > 1:
		Global.sound_effects_volume -= 1
		get_node("GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)

##	Settings menu decreases sound effects volume button connected function
##	Decreases sound effects volume by 1 if able
func _on_sound_effects_volume_plus_button_pressed() -> void:
	if Global.sound_effects_volume < 10:
		Global.sound_effects_volume += 1
		get_node("GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
