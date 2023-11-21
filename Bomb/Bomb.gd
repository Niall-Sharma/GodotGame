extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var STATE_MACHINE : StateMachine = $StateMachine
@export var SPEED = 100
var direction = Vector2.ZERO
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var sprite : AnimatedSprite2D = $Sprite
@export var health = 5
@export var knockbackAmount : Vector2

func _physics_process(delta):
	#Only move if state boolean canMove returns true	

		
	move_and_slide()

func takeDamage(damage):
	health -= damage
	if health<=0:
		get_tree().queue_delete(self)






func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.take_damage(30, knockbackAmount)
		get_tree().queue_delete(self)
		
