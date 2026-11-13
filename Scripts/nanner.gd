extends RigidBody2D
#TODO: Make the banana's split the current tower in half, and add an extra 15 seconds to the clock.

#Basic setup stuff for the naner's properties.
var speed = 15
const SIZE = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.IS_NANA = true
	position.x = randf_range(100, 600)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y += speed 
