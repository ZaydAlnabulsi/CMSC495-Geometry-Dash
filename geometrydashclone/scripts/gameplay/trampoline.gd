extends Area2D

##	Variables that hold the orb properties
@export var type = 0
@onready var sprite = $Sprite2D
var force = 0
var invert = false

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
			sprite.texture = load("res://Images/platformPack_tile054.png")
		1 :
			force = 1200
			sprite.texture = load("res://Images/platformPack_tile056.png")
		2 :
			force = 1800
			sprite.texture = load("res://Images/platformPack_tile063.png")
		3 :
			force = -2000
			invert = true
			sprite.texture = load("res://Images/platformPack_tile065.png")
		4 :
			force = 10000
			sprite.texture = load("res://Images/platformPack_tile054.png")
