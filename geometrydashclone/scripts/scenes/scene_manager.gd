class_name SceneManager extends Node

var current_scene	##	Variable to hold the current scene

##	Godot engine _ready() function
##	Sets itself as the global scene manager and sets scene to main menu
func _ready() -> void:
	Global.scene_manager = self
	change_scene("res://scenes/main_menu.tscn")

##	Function to change the scene
##	delete:	whether to delete the current scene (default: true)
##	keep_running:	whether to keep the current scene running (default: false)
func change_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_scene != null:
		if delete:
			current_scene.queue_free()
		elif keep_running:
			current_scene.visible = false
		else:
			self.remove_child(current_scene)
	var new = load(new_scene).instantiate()
	self.add_child(new)
	current_scene = new
