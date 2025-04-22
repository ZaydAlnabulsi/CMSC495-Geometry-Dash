extends CharacterBody2D

##	Player constants
var SPEED = 30000.0
var JUMP_VELOCITY = -1300.0


##	Variables needed for gameplay
var is_orb = false
var force_orb = 0
var gravity = 4100
var player_rotation = 270
var canInvert = false



##	This is called at a fixed frame rate by Godot
func _physics_process(delta):
	##	Implements gravity and rotates the player if not on the floor
	var on_ground = is_on_floor() if gravity > 0 else is_on_ceiling()
	if not on_ground:
		velocity.y += gravity * delta
		$PlayerBody.rotation_degrees += player_rotation * delta

	else :
		$PlayerBody.rotation_degrees = round(round($PlayerBody.rotation_degrees/90)*90)

	##	Jump if the jump action input is pressed and the player is on the floor
	if Input.is_action_pressed("jump") and on_ground:
		velocity.y = JUMP_VELOCITY

	## 	Moves the player
	velocity.x = delta * SPEED
	
	##	Applies force to the player depending on the orb type
	if is_orb and (Input.is_action_just_pressed("jump") or Input.is_action_just_released("jump")):
		velocity.y = -force_orb
		if canInvert == true :
			gravity = -gravity
			JUMP_VELOCITY = -JUMP_VELOCITY
			player_rotation = -player_rotation
			is_orb = false


	##	Moves the player
	move_and_slide()
	
	##	Allows the user to pause the game
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		if Global.scene_manager.current_scene.scene_file_path == "res://scenes/gameplay.tscn":
			Global.scene_manager.current_scene.display_pause_menu_overlay()

##	Called upon the player's death
func death():
	SPEED = 0
	$PlayerBody.visible = false
	$Death.play()

##	Sets the force on entering an orb
func _on_external_collsion_area_entered(area):
	if area.is_in_group("orb") :
		is_orb = true
		force_orb = area.force
		canInvert = area.invert
	if area.is_in_group("trampoline") :
		velocity.y = -area.force
		if area.invert == true :
			gravity = -gravity
			JUMP_VELOCITY = -JUMP_VELOCITY
			player_rotation = -player_rotation

##	Resets the force on exiting the orb
func _on_external_collsion_area_exited(area):
	if area.is_in_group("orb") :
		is_orb = false
		force_orb = 0
		canInvert = false
	if area.is_in_group("trampoline") :
		force_orb = 0
		canInvert = false


##	Function to update the sound effects
func update_sound_effects_volume() -> void:
	$Death.volume_db = -30 + (Global.sound_effects_volume * 3)
