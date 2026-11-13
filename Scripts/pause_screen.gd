extends Control

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".hide()

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_pauseHandler()

#Allows user to pause with esc
func _pauseHandler():
	if Input.is_action_just_pressed("Escape") and get_tree().paused == false:
		$".".show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
	elif Input.is_action_just_pressed("Escape") and get_tree().paused == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		$".".hide()
		_resume()
		

#resumes game, and  handles anim
func _resume():
	get_tree().paused = false

#Signals for buttons
func _on_resume_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".hide()
	_resume()


func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuElements/title.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_reset_pressed() -> void:
	_resume()
	get_tree().reload_current_scene()
