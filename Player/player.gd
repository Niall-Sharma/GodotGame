extends CharacterBody2D 

const SPEED = 300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var health = 100
var level1complete : bool = false
var isHighJumping = false
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
	if(!is_on_floor()):
		velocity.y += GRAVITY * _delta

	
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
			

func take_damage(damage):
	health -= damage
	heatlhBar.value = health
	if health<=60:
		heatlhBar.modulate = Color(1, 1, 0)
	if health<=30:
		heatlhBar.modulate = Color("ff4500")
	if health <=10:
		heatlhBar.modulate = Color(1, 0, 0)
	if health <= 0:
		die()  # If health reaches zero or below, character dies
		
func take_health(damage):
	health += damage
	heatlhBar.value = health

func die():
	get_tree().change_scene_to_file("res://DeathScene/Death.tscn") 



func _on_area_2d_body_entered(body):
	if body.name == "enemy" and PlayerStateMachine.checkIsVulnerable():
		take_damage(10)
		PlayerStateMachine.changeNextState(PlayerStateMachine.states[2])
	if body.name=="spikes":
		die()
	if body.name=="finishlevel":
		get_tree().change_scene_to_file("res://levelselect/level_select.tscn")
		level1complete = true
		print(level1complete)
		Globalvars.poop()
		Globalvars.addlevel(0)
		Globalvars.shit()
	
	if body.name=="Trampoline":
		print("Trampoline collision detected")
		print("isHighJumping: ", isHighJumping)
		print("highJumpVelocity: ", highJumpVelocity)
		highJump()
	
		
		

func _on_area_2d_area_entered(area):
	if area.name == "coin_area":
		area.get_parent()._leave()
		$PickupSound.play()
		$/root/Master._add_coin()
	if area.name == "heart-area":
		area.get_parent()._leave()
		$PickupSound.play()
		if(health<100):
			take_health(10)
		
func highJump():
	isHighJumping = true
	velocity.y = -highJumpVelocity

