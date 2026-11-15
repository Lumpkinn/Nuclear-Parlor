extends Control

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".hide()

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#checks if the user had hit escape, and then brings up the pause menu
	_pauseHandler()

#Allows user to pause with esc
func _pauseHandler():
	#shows the menu and makes the mouse active again
	if Input.is_action_just_pressed("Escape") and get_tree().paused == false:
		$".".show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
	#Unpauses the game, and hides the menu
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

#Goes to title screen
func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuElements/title.tscn")
#closes out the game
func _on_exit_pressed() -> void:
	get_tree().quit()
#Resets the game
func _on_reset_pressed() -> void:
	_resume()
	get_tree().reload_current_scene()
