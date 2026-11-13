extends Control

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$".".show()

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameElements/Main.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuElements/title.tscn")
