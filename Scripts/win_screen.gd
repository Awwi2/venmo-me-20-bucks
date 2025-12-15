extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.set_winscreen(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func pixelate_background():
	for i in range(1,30):
		$ColorRect.material.set_shader_parameter("pixelation", i*0.001)
		await get_tree().create_timer(0.05).timeout
