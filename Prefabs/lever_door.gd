extends StaticBody2D
@export var enabled: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("CollisionShape2D").set_deferred("disabled", not enabled)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
