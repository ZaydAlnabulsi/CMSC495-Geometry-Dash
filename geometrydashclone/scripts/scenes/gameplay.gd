extends Control

func _ready() -> void:
	var scene = preload("res://scenes/levels/level1.tscn")
	var instance = scene.instantiate()
	instance.get_node("AudioStreamPlayer").volume_db = -30 + (Global.music_volume * 3)
	instance.get_node("Player").get_node("Death").volume_db = -30 + (Global.sound_effects_volume * 3)
	add_child(instance)
