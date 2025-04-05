extends Control

func _ready() -> void:
	var scene = preload("res://scenes/levels/level1.tscn") # Load the scene
	var instance = scene.instantiate() # Create an instance
	add_child(instance) # Add the instance as a child
