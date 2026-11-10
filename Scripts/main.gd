extends Node2D

#@onready var ScoopScene = 
var IsNana = false

# For calling scoop
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 2.5
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_add_Scoop)
	
func _process(_delta: float) -> void:
	if Input.is_action_pressed("Escape"):
		print("Pause.")
		get_tree().paused = true
		#Add in pause screen
		


func _add_Scoop():
	print("Scoop Spawning")
	var ScoopInstance = load("res://Scenes/scoop.tscn").instantiate()
	add_child(ScoopInstance)
