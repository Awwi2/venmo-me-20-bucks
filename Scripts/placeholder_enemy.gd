extends CharacterBody2D

@export_group("Copying")
@export var copy_movement: bool
@export var mirror_movement: bool
@export var copy_jump: bool
@export var movement_multiplier: float
@export var jump_multiplier: float

@export_group("independant moving")
@export var horizontal_speed: float
@export var jump_interval: float
@export var avoid_edges: bool

var COPY_SPEED = 500.0
var JUMP_VELOCITY = -700.0

func _ready() -> void:
	print(movement_multiplier)
	COPY_SPEED *= movement_multiplier
	print(COPY_SPEED)
	JUMP_VELOCITY *= jump_multiplier

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

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
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		if velocity.y > 0:
			animated_sprite.play("jump_down")
		else: 
			animated_sprite.play("jump_up")
	if copy_movement:
		if direction:
			velocity.x = lerp(velocity.x, COPY_SPEED*direction, 0.5)
		else:
			velocity.x = move_toward(velocity.x, 0, COPY_SPEED/10)

	move_and_slide()
