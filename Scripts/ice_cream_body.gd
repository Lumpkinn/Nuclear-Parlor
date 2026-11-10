extends RigidBody2D
#Make larger
@export var collision_shape_2d: CollisionShape2D
#Randomize color
@export var ice_cream_scoop: AnimatedSprite2D

var speed = 10
#scale size based off off this, and have it change as more scoops get added on.
var size = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(100, 600)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.y += speed 
