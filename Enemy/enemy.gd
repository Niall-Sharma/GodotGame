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
@export var health = 5
@export var knockbackAmount : Vector2
var JUMP_VELOCITY = -300
var canJump = true
@onready var jumpTimer = $JumpTimer
var coin_scene = preload("res://Coin/coin.tscn")
var raycast
var raycast2
var locked = false
var falling = false


func  _ready():
	animationTree.active = true
	raycast = $RayCast2D
	raycast.enabled = true
	raycast2 = $RayCast2D2
	raycast2.enabled = true


func jump():
	velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	var collision_point = raycast.get_collision_point()
	var collider = raycast.get_collider()
	var collision_point2 = raycast2.get_collision_point()
	var collider2 = raycast2.get_collider()
	
	
	if collider is TileMap :
		
		print("Ray is colliding with: ", collider)
		print("Collision point: ", collision_point)
		locked = false
	elif collider is Area2D:
		print("rah")
		locked = false
	else:
		locked = true
	

	if locked == false:
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			falling == true
		#Flip sprite depending on which way the enemy is moving
		if direction.x > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		#Only move if state boolean canMove returns true	
		if STATE_MACHINE.checkCanMove():
			direction = (global_position - PLAYER.global_position).normalized()
			velocity.x = direction.x*SPEED
#			var yDiff = PLAYER.global_position.y - global_position.y
#			if (yDiff < -1 or yDiff > 1) and is_on_floor() and canJump:
#				jump()
#				jumpTimer.start()
#				canJump = false
		else:
			velocity.x = 0
		
		move_and_slide()
	

		
#	if raycast2.is_colliding():
#		var collision_point = raycast2.get_collision_point()
#		var collider = raycast2.get_collider()
#
#		print("Ray2 is colliding with: ", collider)
#		print("Collision2 point: ", collision_point)
#
#	else:
#		print("rah2")
##		locked = true

func takeDamage(damage):
	health -= damage
	STATE_MACHINE.changeNextState(HURT_STATE)
	if health<=0:
		get_tree().queue_delete(self)
		
		


func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		STATE_MACHINE.changeNextState(ATTTACK_STATE)
		body.take_damage(10, knockbackAmount)



func _on_jump_timer_timeout():
	canJump = true
func die():
	get_tree().queue_delete(self)
	
	
