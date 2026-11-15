extends RigidBody2D

#Basic setup stuff for the naner's properties.
var speed = 15
const SIZE = 10

# Called when the node enters the scene tree for the first time.
#Lets the rest of the game know that a banana is present, and spawns it on a random x val between 100 and 600
func _ready() -> void:
	Globals.IS_NANA = true
	position.x = randf_range(100, 600)

#Makes it fall
func _process(_delta: float) -> void:
	position.y += speed 
