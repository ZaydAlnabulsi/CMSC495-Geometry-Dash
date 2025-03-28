extends CharacterBody2D

const SPEED = 25000.0
const JUMP_VELOCITY = -1200.0

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
	# addition to make jump more responsive to button press and release --- Giana
	#adds shorter and higher jumps
	if Input.is_action_just_released("jump") and velocity.y < ( JUMP_VELOCITY / 5 ):
			velocity.y = JUMP_VELOCITY / 5
	

	velocity.x = delta * SPEED

	move_and_slide()
	
	 
	
	
