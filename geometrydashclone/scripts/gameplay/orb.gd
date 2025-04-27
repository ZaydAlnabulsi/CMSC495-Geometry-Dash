extends Area2D

##	Variables that hold the orb properties
@export var type = 0
@onready var sprite = $Sprite2D
var force = 0
var invert = false
var interacted = false

var speed = 600
var angle_speed = PI * 2

##	Rotates the saw
func _process(delta: float) -> void:
	rotation += angle_speed * delta

##	Sets the appropriate force and sprite texture depending on the type
func _ready():
	$Pulse.play("Pulse")
	"""
	0: Yellow
	1: Blue
	2: Green
	3: Red
	4: Purple

	_: Error
	"""
	match type :
		0 :
			force = 800 ## 600
			sprite.texture = load("res://images/disc_yellow.png")
		1 :
			force = 1200
			sprite.texture = load("res://images/disc_blue.png")
		2 :
			force = 1800
			sprite.texture = load("res://images/disc_green.png")
		3 :
			force = -2000
			invert = true
			sprite.texture = load("res://images/disc_orange.png")
		4 :
			force = -1000
			invert = true
			sprite.texture = load("res://images/disc_purple.png")
		5 :
			force = 1900
			sprite.texture = load("res://images/disc_green.png")
		_ :
			force = 0
			sprite.texture = load("res://images/face_h.png")
