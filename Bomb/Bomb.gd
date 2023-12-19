extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var STATE_MACHINE : StateMachine = $StateMachine
var direction = Vector2.ZERO
@onready var PLAYER : CharacterBody2D = $"../Player"
@onready var sprite : AnimatedSprite2D = $Sprite
@export var knockbackAmount : Vector2

var EFFECT = preload("res://Explosion.tscn")


	#Only move if state boolean canMove returns true	

		







func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		body.take_damage(30, knockbackAmount, true)
		var effect = EFFECT.instantiate()
		add_child(effect)
		$Timer.start()
		
		



func _on_timer_timeout():
	get_tree().queue_delete(self)
