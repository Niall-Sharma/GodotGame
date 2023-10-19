extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var STATE_MACHINE : StateMachine = $StateMachine
@onready var HURT_STATE : State = $StateMachine/Hurt
@onready var ATTTACK_STATE : State = $StateMachine/Attack
@export var SPEED = -100
var direction = Vector2.ZERO
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var animationTree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $Sprite2D
var health = 10

func  _ready():
	animationTree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if direction.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		
	if STATE_MACHINE.checkCanMove():
		direction = (global_position - PLAYER.global_position).normalized()
		velocity.x = direction.x*SPEED
	else:
		velocity.x = 0
		
	move_and_slide()

func takeDamage(damage):
	health -= damage
	STATE_MACHINE.changeNextState(HURT_STATE)
	if health<=0:
		get_tree().queue_delete(self)


func _on_area_2d_area_entered(area):
	if(area.get_parent().name == "Player"):
		STATE_MACHINE.changeNextState(ATTTACK_STATE)

func _on_area_2d_collision_shape_2d_entered(shape):
	if(shape.get_parent().name == "spikes"):
		takeDamage(100)
