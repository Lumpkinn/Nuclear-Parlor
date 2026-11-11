extends Control
#Gets references to the two buttons.
@onready var StartButton = $Panel/ButtonSelection/Start
@onready var ExitButton = $Panel/ButtonSelection/Exit

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


#Moves player to main scene.
func _on_start_pressed() -> void:
	get_tree().root.add_child(preload("res://Scenes/GameElements/Main.tscn").instantiate())
	$".".queue_free()


#Closes out the game
func _on_exit_pressed() -> void:
	get_tree().quit()
