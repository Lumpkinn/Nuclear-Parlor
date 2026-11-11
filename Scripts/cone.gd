extends CharacterBody2D
#TODO: collision between scoops and cone.
#TODO: Esc goes back to main menu

@export var speed = 500
var target: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Get the cone to follow the mouse's X coord, y coord stays constant 
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		target = event.relative
	
func _physics_process(_delta: float) -> void:
	#velocity = (target - position).normalized() * speed 
	move_and_collide(target)
	target = Vector2.ZERO

func _on_catch_zone_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		#Removes the falling scoops, replaces them with a sprite, moves the scoopholder node up the size of the sprite.
		#TODO: animation for it landing.
		Globals.TOWERHEIGHT += 1
		body.queue_free()
		var scooptype: Texture2D = load("res://Assets/Sprites/icon.svg")
		var scoop = Sprite2D.new()
		scoop.set_texture(scooptype)
		$CollisionShape2D/ScoopHolder.add_child(scoop)
		scoop.position.y -= 50
