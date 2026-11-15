extends Control

#Makes the mouse visible again, shows the game over screen, makes sure its centered, and shows the score.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$".".show()
	position.x=300
	position.y=300
	$Panel2/D2.set_text("Score:" + str(Globals.TOWERHEIGHT))


#restarts game, so user can play again.
func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/GameElements/Main.tscn")

#exits out of game
func _on_exit_pressed() -> void:
	get_tree().quit()

#goes to title
func _on_title_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuElements/title.tscn")
