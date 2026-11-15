extends RigidBody2D
#array of all the sprites for the scoops. One is called at random, and stored with each instance for parity across this, and the sprites.
var scoopSprites = [load("res://Assets/Sprites/VanillaCream.png"), load("res://Assets/Sprites/ChocCream.png"), load("res://Assets/Sprites/Strawberry.png")]
var speed = 10

# Spawns the scoops, abd sets their sprite and stores them
func _ready() -> void:
	position.x = randf_range(100, 600)
	Globals.SCOOPCOLOR = (scoopSprites[int(randf_range(0, scoopSprites.size()))])
	$Sprite2D.texture = Globals.SCOOPCOLOR 

# Makes the sprites fall.
func _process(_delta: float) -> void:
	position.y += speed 
