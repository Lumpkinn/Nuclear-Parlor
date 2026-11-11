extends Node2D
var NanaChance = 1
# For calling scoop
func _ready() -> void:
	if get_tree().paused == true:
		get_tree().paused = false
	
	
	#animation code:
	$Animations.play("Background")
	
	#Timer, and scoop spawn code
	var timer = Timer.new()
	timer.wait_time = 2.5
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_add_Scoop)
	

func _process(_delta: float) -> void:
	pass

func _add_Scoop():
	print("Scoop Spawning")
	$ScoopScore.set_text("Stack Height: " + str(Globals.TOWERHEIGHT))
	if int (randf() * 10) == NanaChance:
		var ScoopInstance = preload("res://Scenes/GameElements/scoop.tscn")
		var scoop = ScoopInstance.instantiate()
		add_child(scoop)
	else:
		print("BANANA")
		var nana = preload("res://Scenes/GameElements/nanner.tscn")
		var radionana = nana.instantiate()
		add_child(radionana)
	#TODO: Make it so nanachance increases over time, and reset it after. Also handle sprites.
	
	
