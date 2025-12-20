extends Control

var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = active


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Back"):
		if visible:
			_on_resume_pressed()
		else:
			visible = true
			active = true
			get_tree().paused = true
			

func _on_back_to_menu_pressed() -> void:
	get_tree().paused = false
	active = false
	visible = false
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _on_resume_pressed() -> void:
	get_tree().paused = false
	active = false
	visible = false
	
