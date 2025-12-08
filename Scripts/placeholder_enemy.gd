extends CharacterBody2D

@export var copy_movement: bool
@export var mirror_movement: bool
@export var copy_jump: bool
@export var movement_multiplier: float
@export var jump_multiplier: float

var COPY_SPEED = 500.0
var JUMP_VELOCITY = -700.0

func _ready() -> void:
	print(movement_multiplier)
	COPY_SPEED *= movement_multiplier
	print(COPY_SPEED)
	JUMP_VELOCITY *= jump_multiplier

# @onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += Vector2(0,1500) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and copy_jump:
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	
	if mirror_movement:
		direction *= -1
	
	"""
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Walk")
	else:
		animated_sprite.play("Jump")
	"""
	if copy_movement:
		if direction:
			velocity.x = direction * COPY_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, COPY_SPEED)

	move_and_slide()
