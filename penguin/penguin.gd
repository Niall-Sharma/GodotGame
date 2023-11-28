extends CharacterBody2D
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var sprite  = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 5
var snow = preload("res://snowball/snowball.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if PLAYER.position.x > self.position.x:
		sprite.flip_h = false
		
	if PLAYER.position.x < self.position.x:
		sprite.flip = true
		
	if abs(PLAYER.position.x - self.position.x) < 500:
			await get_tree().create_timer(3).timeout
			throw()
			
	move_and_slide()
func throw():
	add_child(snow)
	
	
func takeDamage(damage):
	health -= damage
	if health<=0:
		get_tree().queue_delete(self)
