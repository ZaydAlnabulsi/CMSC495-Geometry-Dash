extends CharacterBody2D

@onready var gameplay = get_node("/root/SceneManager/Gameplay")

var SPEED = 30000.0
const JUMP_VELOCITY = -1300.0

var is_orb = false
var force_orb = 0
var gravity = 4100

func _physics_process(delta):
	#Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		$PlayerBody.rotation_degrees += 360 * delta
	else :
		var module = int($PlayerBody.rotation_degrees) % 90;
		if module > 45 :
			$PlayerBody.rotation_degrees += (90 - module)
		else :
			$PlayerBody.rotation_degrees -= module

	#Jump
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.x = delta * SPEED
	
	if is_orb and (Input.is_action_just_pressed("jump") or Input.is_action_just_released("jump")):
		velocity.y = -force_orb

	move_and_slide()
	
	if Input.is_action_pressed("pause"):
		get_tree().paused = true
		gameplay.display_pause_menu_overlay()
	
func death():
	SPEED = 0
	$PlayerBody.visible = false
	$Death.play()
	$Timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()

func _on_external_collsion_area_entered(area):
	if area.is_in_group("orb") :
		is_orb = true
		force_orb = area.force

func _on_external_collsion_area_exited(area):
	if area.is_in_group("orb") :
		is_orb = false
		force_orb = 0

func update_sound_effects_volume() -> void:
	$Death.volume_db = -30 + (Global.sound_effects_volume * 3)
