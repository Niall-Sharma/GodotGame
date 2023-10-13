extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var STATE_MACHINE : StateMachine = $StateMachine
@export var SPEED = 1
var direction = 1
var PLAYER : CharacterBody2D

func  _ready():
	$AnimationTree.active = true
	PLAYER = $"../Player"
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	$AnimationTree.set("parameters/Move/blend_position", direction)
	
	direction = (global_position - PLAYER.global_position).normalized()
	if STATE_MACHINE.checkCanMove():
		velocity.x = direction*SPEED

	move_and_slide()
