extends Node

var winscreen
var defeatscreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_winscreen(screen: Variant):
	winscreen = screen

func set_defeatscreen(screen: Variant):
	defeatscreen = screen

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func player_door_entered():
	pass
	
func complete_level():
	winscreen.show()
	freeze_level()
	await winscreen.pixelate_background()
	
func fail_level():
	freeze_level()
	defeatscreen.show()

func freeze_level():
	get_tree().paused = true
	
func replay_level():
	get_tree().reload_current_scene()
	get_tree().paused = false
