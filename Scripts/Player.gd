extends CharacterBody2D

@export var speed : float = 100.0
@onready var anim_tree : AnimationTree = $AnimationTree
var direction : Vector2 = Vector2.ZERO

func _ready():
	# set up the player animation and send player to the Game singleton
	Game.Player = self
	anim_tree.active = true

func handle_input():
	#handle input by getting the vector of each key press
	direction = Input.get_vector("left","right","up","down").normalized()
	
	if direction:
		velocity = direction * speed
		
	else:
		velocity = Vector2.ZERO
		
func _physics_process(delta):
	#move the player by multiplying velocity, speed and delta
	#this is handeled by move_and_slide
	handle_input()
	move_and_slide()

func _process(delta):
	update_animation()

func update_animation():
	#update the animations depending of the vector
	if velocity == Vector2.ZERO:
		anim_tree["parameters/conditions/idle"] = true
		anim_tree["parameters/conditions/is_moving"] = false
	else:
		anim_tree["parameters/conditions/idle"] = false
		anim_tree["parameters/conditions/is_moving"] = true
		
	if direction != Vector2.ZERO:
		anim_tree["parameters/Idle/blend_position"] = direction
		anim_tree["parameters/Walk/blend_position"] = direction

