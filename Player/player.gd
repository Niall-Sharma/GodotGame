extends CharacterBody2D 

const SPEED = 300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var health = 100
var level1complete : bool = false
var highJumpVelocity = 750

@onready var animationTree = $AnimationTree
@onready var heatlhBar = $PlayerGUI/HealthBar
@onready var PlayerStateMachine : StateMachine = $StateMachine



var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	heatlhBar.modulate=Color(0,2,0)
	animationTree.active = true
	
func _physics_process(_delta):
	#Add Gravity
	#if(!is_on_floor() and $StateMachine/Ground/CoyoteTimer.is_stopped()):
		#velocity.y += GRAVITY * _delta

	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction and PlayerStateMachine.checkCanMove():
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	animationTree.set("parameters/Run/blend_position", direction)
	move_and_slide()
	if PlayerStateMachine.checkCanMove():
		if direction < 0:
			$Sprite2D.flip_h = true
			
		if direction > 0:
			$Sprite2D.flip_h = false
	
	if direction>0 and $AttackArea.position.x < $PlayerShape.position.x:
		$AttackArea.position.x+=50
	if direction<0 and $AttackArea.position.x > $PlayerShape.position.x:
		$AttackArea.position.x-=50

#Player loses health when called
func take_damage(damage : float, knockbackAmount : Vector2, direction : bool):
	if PlayerStateMachine.checkIsVulnerable():
		health -= damage
		if(!direction):
			$StateMachine/Hurt.knockbackAmount = knockbackAmount
		else:
			$StateMachine/Hurt.knockbackAmount = Vector2(-knockbackAmount.x, knockbackAmount.y)
		PlayerStateMachine.changeNextState(PlayerStateMachine.states[2])
		#Set healthbar value to health and change healthbar color depending on how much health is left
		heatlhBar.value = health
		if health<=60:
			heatlhBar.modulate = Color(1, 1, 0)
		if health<=30:
			heatlhBar.modulate = Color("ff4500")
		if health <=10:
			heatlhBar.modulate = Color(1, 0, 0)
		if health <= 0:
			die()  # If health reaches zero or below, character dies

#Add player health and change healthbar value to health when called		
func take_health(damage):
	health += damage
	heatlhBar.value = health

#When called change scene to death scene
func die():
	get_tree().change_scene_to_file("res://DeathScene/Death.tscn") 

#When player encounters trampoline this function is called. Launches the player up in the air when called
func highJump():
	velocity.y = -highJumpVelocity

func isHealthMax():
	return health < 100

