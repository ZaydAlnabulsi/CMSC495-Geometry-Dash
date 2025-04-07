extends Control

##	Variables to hold the gameplay overlays
@onready var death_overlay = get_node("CanvasLayer/DeathOverlay")
@onready var pause_menu_overlay = get_node("CanvasLayer/PauseMenuOverlay")

var instance	##	Level scene instance
var player	##	Player node of level scene
var audio_stream_player	##	Audio stream player of level scene

##	Godot engine _ready() function
##	Loads the appropriate level and sets the variables
##	Updates the volumes based on global variables
func _ready() -> void:
	var scene = preload("res://scenes/levels/level1.tscn")
	instance = scene.instantiate()
	audio_stream_player = instance.get_node("AudioStreamPlayer")
	player = instance.get_node("Player")
	update_music_volume()
	update_sound_effects_volume()
	add_child(instance)

##	Displays the death overlay
func display_death_overlay() -> void:
	death_overlay.visible = true
	get_node("CanvasLayer/DeathOverlay/CompletionLabel").text = "You completed " + str(player.position.x)

##	Displays the pause menu overlay
func display_pause_menu_overlay() -> void:
	pause_menu_overlay.visible = true

##	Pause menu overlay unpause button connected function
##	Hides the pause menu overlay and unpauses the game
func _on_unpause_button_pressed() -> void:
	pause_menu_overlay.visible = false
	get_tree().paused = false

##	Pause menu overlay decrease music volume button connected function
##	Decreases music volume by 1 if able and updates the volume
func _on_music_volume_minus_button_pressed() -> void:
	if Global.music_volume > 1:
		Global.music_volume -= 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)
		update_music_volume()

##	Pause menu overlay increase music volume button connected function
##	Increases music volume by 1 if able and updates the volume
func _on_music_volume_plus_button_pressed() -> void:
	if Global.music_volume < 10:
		Global.music_volume += 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)
		update_music_volume()

##	Pause menu overlay decrease sound effects volume button connected function
##	Decreases sound effects volume by 1 if able and updates the volume
func _on_sound_effects_volume_minus_button_pressed() -> void:
	if Global.sound_effects_volume > 1:
		Global.sound_effects_volume -= 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
		update_sound_effects_volume()

##	Pause menu overlay increase sound effects volume button connected function
##	Increases sound effects volume by 1 if able and updates the volume
func _on_sound_effects_volume_plus_button_pressed() -> void:
	if Global.sound_effects_volume < 10:
		Global.sound_effects_volume += 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
		update_sound_effects_volume()

##	Updates the sound effects volume that plays
func update_sound_effects_volume() -> void:
	player.update_sound_effects_volume()

##	Updates the music volume
func update_music_volume() -> void:
	audio_stream_player.volume_db = -30 + (Global.music_volume * 3)

func _on_new_game_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/gameplay.tscn")

func _on_return_to_main_menu_button_pressed() -> void:
	Global.scene_manager.change_scene("res://scenes/main_menu.tscn")
