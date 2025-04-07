extends Area2D

##	Variables that hold the orb properties
@export var type = 0
@onready var sprite = $Sprite2D
var force

##	Sets the appropriate force and sprite texture depending on the type
func _ready():
	"""
	0: Yellow
	1: Blue
	2: Green
	3: Red
	_: Error
	"""
	match type :
		0 :
			force = 600
			sprite.texture = load("res://Images/platformPack_tile012.png")
		1 :
			force = 1200
			sprite.texture = load("res://Images/platformPack_tile011.png")
		2 :
			force = 1800
			sprite.texture = load("res://Images/platformPack_tile023.png")
		3 :
			force = -2000
			sprite.texture = load("res://Images/platformPack_tile024.png")
		_ :
			force = 0
			sprite.texture = load("res://Images/face_h.png")
