extends Control

@onready var death_overlay = get_node("CanvasLayer/DeathOverlay")
@onready var pause_menu_overlay = get_node("CanvasLayer/PauseMenuOverlay")
var instance
var player
var audio_stream_player

func _ready() -> void:
	var scene = preload("res://scenes/levels/level1.tscn")
	instance = scene.instantiate()
	audio_stream_player = instance.get_node("AudioStreamPlayer")
	player = instance.get_node("Player")
	update_music_volume()
	update_sound_effects_volume()
	add_child(instance)

func display_death_overlay() -> void:
	death_overlay.visible = true
	get_node("CanvasLayer/DeathOverlay/CompletionLabel").text = "You completed " + str(player.position.x)

func display_pause_menu_overlay() -> void:
	pause_menu_overlay.visible = true

func _on_unpause_button_pressed() -> void:
	pause_menu_overlay.visible = false
	get_tree().paused = false

func _on_music_volume_minus_button_pressed() -> void:
	if Global.music_volume > 1:
		Global.music_volume -= 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)
		update_music_volume()
	
func _on_music_volume_plus_button_pressed() -> void:
	if Global.music_volume < 10:
		Global.music_volume += 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/MusicVolumeSettingLabel").text = str(Global.music_volume)
		update_music_volume()

func _on_sound_effects_volume_minus_button_pressed() -> void:
	if Global.sound_effects_volume > 1:
		Global.sound_effects_volume -= 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
		update_sound_effects_volume()

func _on_sound_effects_volume_plus_button_pressed() -> void:
	if Global.sound_effects_volume < 10:
		Global.sound_effects_volume += 1
		get_node("CanvasLayer/PauseMenuOverlay/GridContainer/SoundEffectsVolumeSettingLabel").text = str(Global.sound_effects_volume)
		update_sound_effects_volume()

func update_sound_effects_volume() -> void:
	player.update_sound_effects_volume()
	
func update_music_volume() -> void:
	audio_stream_player.volume_db = -30 + (Global.music_volume * 3)
