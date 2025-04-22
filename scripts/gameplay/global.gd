extends Node

##	Global variables needed across screens
var scene_manager : SceneManager
var sound_effects_volume : int = 5
var music_volume : int = 5
## Value that determines what value should be loaded. 1 loads the main level, 2 loads the dev test level
var scene_change_root : int = 0

func set_scene_change_root(root):
	scene_change_root = root

func get_scene_change_root() -> int :
	return scene_change_root
