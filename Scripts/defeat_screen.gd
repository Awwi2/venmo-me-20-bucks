extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.set_defeatscreen(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func replay_scene():
	LevelManager.replay_level()


func _on_button_pressed() -> void:
	replay_scene()
