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
var raycast_right
var raycast_left
var is_locked : bool = false
var is_locked2 : bool = false
var last_valid_position : Vector2
var falling = false
var player
var checkright : bool = false
var checkleft : bool = false
var quickcheck : bool = false
var quickcheck2: bool = false


func  _ready():
	animationTree.active = true
	raycast_right = $RayCastRight
	raycast_right.enabled = true
	raycast_left = $RayCastLeft
	raycast_left.enabled = true
	
	last_valid_position = position
	player = get_node("res://Player/player.tscn")

	


func jump():
	velocity.y = JUMP_VELOCITY



#func _physics_process(delta):
#	# setting variables
#	checkleft = false
#	checkright = false
#	var left_ray_hit = raycast_left.is_colliding()
#	var right_ray_hit = raycast_right.is_colliding()
#	var direction_to_player = (PLAYER.global_position - global_position).normalized()
#	var enemy_forward_direction = -transform.x
#
#	# Check if both raycasts are not hitting the tilemap
#	if not right_ray_hit:
#		is_locked = true
#		quickcheck = true
#	if not left_ray_hit:
#		print("stuck")
#		is_locked = true
#		print("stucks", is_locked)
#		quickcheck2 = true
#		print("y")
#
#	#If player is to the left of enemy when its stuck. Get unstuck
#	if direction_to_player.dot(enemy_forward_direction) > 0 and quickcheck == true:
#		print("Player is to the left of me!")
#		checkleft = true
#	if direction_to_player.dot(enemy_forward_direction) < 0 and quickcheck2 == true:
#		print("Player is to the right of me!")
#		checkright = true
#
#
#	direction = (global_position - PLAYER.global_position).normalized()
#
#	#Checking if it can get unstuck to the left
#	if checkleft == true:
#		is_locked = false
#	#Checking if it can get unstuck to the right
#	if checkright == true:
#		is_locked = false
#
#
#	#Flipping sprite
#	if direction.x > 0:
#			sprite.flip_h = true
#	else:
#			sprite.flip_h = false
#	if not is_locked:
#		# Add the gravity.
#		if not is_on_floor():
#			velocity.y += gravity * delta
#			falling == true
#		#Flip sprite depending on which way the enemy is moving
#		if direction.x > 0:
#			sprite.flip_h = true
#		else:
#			sprite.flip_h = false
#		#Only move if state boolean canMove returns true	
#		if STATE_MACHINE.checkCanMove():
#			velocity.x = direction.x*SPEED
#	#			var yDiff = PLAYER.global_position.y - global_position.y
#	#			if (yDiff < -1 or yDiff > 1) and is_on_floor() and canJump:
#	#				jump()
#	#				jumpTimer.start()
#	#				canJump = false
#		else:
#			velocity.x = 0
#
#		move_and_slide()


func _physics_process(delta):
	var left_ray_hit = raycast_left.is_colliding()
	var right_ray_hit = raycast_right.is_colliding()
	var direction_to_player = (PLAYER.global_position - global_position).normalized()
	var enemy_forward_direction = -transform.x
	# Debug prints for troubleshooting
	print("Left Ray Hit:", left_ray_hit)
	print("Right Ray Hit:", right_ray_hit)

	if left_ray_hit and right_ray_hit:
		is_locked = false
	else:
		is_locked = true


	if direction_to_player.dot(enemy_forward_direction) > 0 and not right_ray_hit:
			print("Player is to the left of me!")
			is_locked = false
	if direction_to_player.dot(enemy_forward_direction) < 0 and not left_ray_hit:
			print("Player is to the left of me!")
			is_locked = false
	# Check if both raycasts are hitting the tilemap
	if is_locked == false:
		
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
		body.take_damage(10, knockbackAmount)



func _on_jump_timer_timeout():
	canJump = true
func die():
	get_tree().queue_delete(self)
	

