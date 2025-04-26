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
			sprite.texture = load("res://images/btn_yellow.png")
		1 :
			force = 1200
			sprite.texture = load("res://images/btn_blue.png")
		2 :
			force = 1800
			sprite.texture = load("res://images/btn_green.png")
		3 :
			force = -2000
			invert = true
			sprite.texture = load("res://images/btn_orange.png")
		4 :
			force = 10000
			sprite.texture = load("res://images/btn_green.png")
		5 :
			force = -15
			invert = true
			sprite.texture = load("res://images/btn_purple.png")
		6 :
			force = -2000
			sprite.texture = load("res://images/btn_green.png")
		7 :
			force = -1300
			sprite.texture = load("res://images/btn_blue.png")
		8:
			force = 2000
			sprite.texture = load("res://images/btn_green.png")
		9:
			force = 1300
			sprite.texture = load("res://images/btn_blue.png")
