extends CharacterBody2D
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var sprite  = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 5


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	$AnimatedSprite2D.show()
	
	

	"if PLAYER.position.x > self.position.x:
		sprite.flip_h = false
		
	if PLAYER.position.x < self.position.x:
		sprite.flip_h = true"
			
	
	move_and_slide()
	
	
func takeDamage(damage):
	health -= damage
	if health<=0:
		get_tree().queue_delete(self)
