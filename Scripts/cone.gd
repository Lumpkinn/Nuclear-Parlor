extends CharacterBody2D

#Simple variables for the scoops, like their falling speed, what texture they'll use, and a vector2d to help them fall
@export var speed = 500
var target: Vector2
var tex

#Locks the mouse, so the cone is used.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Get the cone to follow the mouse's X coord, y coord stays constant 
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		target = event.relative

#has the scoops/nana fall, and cuts the stack in half when nana falls
func _physics_process(_delta: float) -> void: 
	move_and_collide(target)
	target = Vector2.ZERO
	var child_num = $CollisionShape2D/ScoopHolder.get_child_count()
	if Globals.IS_NANA == true:
		for child in $CollisionShape2D/ScoopHolder.get_children():
			for i in child_num/2:
				child.queue_free()
				Globals.TOWERHEIGHT/=2

#Code for catching scoops
func _on_catch_zone_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		#Removes the falling scoops, replaces them with a sprite, moves the scoopholder node up the size of the sprite.
		Globals.TOWERHEIGHT += 1
		body.queue_free()
		var scoop = Sprite2D.new()
		if Globals.IS_NANA == true:
			tex = (load("res://Assets/Sprites/Nana.png"))
		else:
			tex = (Globals.SCOOPCOLOR)
		scoop.set_texture(tex)
		$CollisionShape2D/ScoopHolder.add_child(scoop)
		#moves everything up, to make it look nicer
		$CatchZone/CollisionShape2D.position.y += -50
		scoop.position.y += -(Globals.TOWERHEIGHT * 50)
