extends Node2D
var NanaChance = 1
@onready var clock = $GameTime
#TODO: Make it so nanachance increases over time, and reset it after. Also handle sprites.

# For calling scoop
func _ready() -> void:
	#Making sure everything is in order when the scene starts up initially.
	if get_tree().paused == true:
		get_tree().paused = false
	Globals.TOWERHEIGHT = 0
	clock.start(45.0)
	
	#animation code:
	$Animations.play("Background")

	#Timer, and scoop spawn code
	var timer = Timer.new()
	timer.wait_time = 2.5
	timer.autostart = true
	add_child(timer)
	timer.timeout.connect(_add_Scoop)

func _process(delta: float) -> void:
	_on_game_time_timeout()

#Spawns either a banana, or a scoop of ice cream.
func _add_Scoop():
	print("Scoop Spawning")
	$ScoopScore.set_text("Stack Height: " + str(Globals.TOWERHEIGHT))
	var curChance = int (randf()*10)
	if curChance == NanaChance:
		print("BANANA")
		var nana = preload("res://Scenes/GameElements/nanner.tscn")
		var radionana = nana.instantiate()
		add_child(radionana)
	else:
		var ScoopInstance = preload("res://Scenes/GameElements/scoop.tscn")
		var scoop = ScoopInstance.instantiate()
		add_child(scoop)
		scoop.position.y = -(Globals.TOWERHEIGHT*50)
	if Globals.IS_NANA == true:
		Globals.TOWERHEIGHT = Globals.TOWERHEIGHT/2
		#Handle the animations here, and shorten the stack too!

func gameover():
	var gameoverscreen = preload("res://Scenes/MenuElements/game_over.tscn")
	var screen = gameoverscreen.instantiate()
	add_child(screen)

func _on_game_time_timeout() -> void:
	$TimeRemaining.set_text("Time Remaining: " + str( round(clock.get_time_left())))
	if Globals.IS_NANA == true:
		Globals.IS_NANA = false
