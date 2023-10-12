extends CharacterBody2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction = 0

var health = 100

func  _ready():
	$AnimationTree.active = true
	'''
	ouch(100)
	'''

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	$AnimationTree.set("parameters/Move/blend_position", direction)

	move_and_slide()

func ouch(damage):
	health -= damage
	if health<=0:
		get_tree().queue_delete(self)
