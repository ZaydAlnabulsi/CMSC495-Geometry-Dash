extends CharacterBody2D

##	Variable to hold the GamePlay node
@onready var gameplay = get_node("/root/SceneManager/Gameplay")

##	Player constants
var SPEED = 30000.0
const JUMP_VELOCITY = -1300.0

##	Variables needed for gameplay
var is_orb = false
var force_orb = 0
var gravity = 4100

##	This is called at a fixed frame rate by Godot
func _physics_process(delta):
	##	Implements gravity and rotates the player if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta
		$PlayerBody.rotation_degrees += 360 * delta
	else :
		var module = int($PlayerBody.rotation_degrees) % 90;
		if module > 45 :
			$PlayerBody.rotation_degrees += (90 - module)
		else :
			$PlayerBody.rotation_degrees -= module

	##	Jump if the jump action input is pressed and the player is on the floor
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	## 	Moves the player
	velocity.x = delta * SPEED
	
	##	Applies force to the player depending on the orb type
	if is_orb and (Input.is_action_just_pressed("jump") or Input.is_action_just_released("jump")):
		velocity.y = -force_orb

	##	Moves the player
	move_and_slide()
	
	##	Allows the user to pause the game
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		gameplay.display_pause_menu_overlay()

##	Called upon the player's death
func death():
	SPEED = 0
	$PlayerBody.visible = false
	$Death.play()
	$Timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()

##	Sets the force on entering an orb
func _on_external_collsion_area_entered(area):
	if area.is_in_group("orb") :
		is_orb = true
		force_orb = area.force

##	Resets the force on exiting the orb
func _on_external_collsion_area_exited(area):
	if area.is_in_group("orb") :
		is_orb = false
		force_orb = 0

##	Function to update the sound effects
func update_sound_effects_volume() -> void:
	$Death.volume_db = -30 + (Global.sound_effects_volume * 3)
