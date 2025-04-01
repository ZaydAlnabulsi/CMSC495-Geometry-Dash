class_name SceneManager extends Node

var current_scene

func _ready() -> void:
	Global.scene_manager = self
	change_scene("res://scenes/main_menu.tscn")
	
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
