extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var STATE_MACHINE : StateMachine = $StateMachine
@onready var HURT_STATE : State = $StateMachine/Hurt
@onready var ATTTACK_STATE : State = $StateMachine/Attack
@export var SPEED = -100
var direction = Vector2.ZERO
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var animationTree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $Sprite2D
@export var health = 5
@export var knockbackAmount : Vector2
var JUMP_VELOCITY = -300
var canJump = true
@onready var jumpTimer = $JumpTimer
var coin_scene = preload("res://Coin/coin.tscn")

func  _ready():
	animationTree.active = true



func jump():
	velocity.y = JUMP_VELOCITY





func _physics_process(_delta):
	var direction_to_player = (PLAYER.global_position - global_position).normalized()
	var enemy_forward_direction = -transform.x
	if(!is_on_floor()):
		velocity.y += GRAVITY * _delta

	# Check if both raycasts are hitting the tilemap

		
	# Set the direction for the enemy based on the player's position
	direction = (global_position - PLAYER.global_position).normalized()

	# Flipping sprite
	if direction.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

	# Only move if the state boolean canMove returns true
	if STATE_MACHINE.checkCanMove():
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0

	move_and_slide()





#Taking damage function
func takeDamage(damage):
	health -= damage
	STATE_MACHINE.changeNextState(HURT_STATE)
	if health<=0:
		get_tree().queue_delete(self)
		
		

#Checking if its getting hit by the player
func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		
		STATE_MACHINE.changeNextState(ATTTACK_STATE)
		body.take_damage(10, knockbackAmount, sprite.flip_h)



