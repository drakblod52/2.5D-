extends CharacterBody3D

@export var speed := 5.0
@export var jump_force := 8.0
@export var gravity := 20.0

@onready var anim = $AnimatedSprite3D

func _physics_process(delta):
	var dir = Input.get_axis("move_left", "move_right")

	velocity.x = dir * speed

	# Gravity
	if not is_on_floor():
		
		if dir != 0:
			anim.play("walk")
		else:
			anim.play("idle")

	# Flip arah
	if dir != 0:
		anim.flip_h = dir < 0

	move_and_slide()
