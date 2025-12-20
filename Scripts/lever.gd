extends Node2D
@export var toggle: bool = true
@export var door: Node2D

var changed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if toggle or not changed:
		changed = true
		print(door.visible)
		door.get_node("CollisionShape2D").set_deferred("disabled", door.visible)
		door.visible = not door.visible
		
