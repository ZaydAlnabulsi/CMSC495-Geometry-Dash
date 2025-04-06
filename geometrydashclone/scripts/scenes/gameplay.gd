extends Control

@onready var death_overlay = get_node("CanvasLayer/DeathOverlay")
@onready var pause_menu_overlay = get_node("CanvasLayer/PauseMenuOverlay")

func _ready() -> void:
	var scene = preload("res://scenes/levels/level1.tscn")
	var instance = scene.instantiate()
	instance.get_node("AudioStreamPlayer").volume_db = -30 + (Global.music_volume * 3)
	instance.get_node("Player").get_node("Death").volume_db = -30 + (Global.sound_effects_volume * 3)
	add_child(instance)

func display_death_overlay() -> void:
	death_overlay.visible = true

func display_pause_menu_overlay() -> void:
	pause_menu_overlay.visible = true

func _on_unpause_button_pressed() -> void:
	pause_menu_overlay.visible = false
	get_tree().paused = false
