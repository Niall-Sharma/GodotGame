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
			

#Player loses health when called
func take_damage(damage):
	health -= damage
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


#Called when body enters Player's area2d
func _on_area_2d_body_entered(body):
	#If enemy enters area2d then call take damage and set the players state to Hurt
	if body.name == "enemy" and PlayerStateMachine.checkIsVulnerable():
		take_damage(10)
		PlayerStateMachine.changeNextState(PlayerStateMachine.states[2])
	#If spikes enters area2d then call die function
	if body.name=="spikes":
		die()
	#If finish flag enters area2d then go back to level select, set level to ocmplete, 
	if body.name=="finishlevel":
		get_tree().change_scene_to_file("res://levelselect/level_select.tscn")
		Globalvars.addlevel(1)
		
	
	#If trampoline enters area2d call highJump function
	if body.name=="Trampoline":
		highJump()
	
		
		
#Called when an area2d enters player's area2d
func _on_area_2d_area_entered(area):
	#If coin_area enters area2d call _leave() function from coin_area parent, play coin pickup sound, run function add_coin() from master
	if area.name == "coin_area":
		get_tree().queue_delete(area.get_parent())
		$PickupSound.play()
		$/root/Master._add_coin()
	#If heart_area enters area2d call _leave() function from coin_area
	if area.name == "heart-area":
		get_tree().queue_delete(area.get_parent())
		$PickupSound.play()
		if(health<100):
			take_health(10)
	if area.name == "InfiniteLand":
		get_tree().queue_delete(area.get_parent())
		$/root/Master._add_coin()
		
#When player encounters trampoline this function is called. Launches the player up in the air when called
func highJump():
	velocity.y = -highJumpVelocity


#If enemy is in the attack area then player state is set to attack state and enemy's takeDamage function is called
func _on_attack_area_body_entered(body):
	if body.name == "enemy":
		PlayerStateMachine.changeNextState(PlayerStateMachine.states[3])
		body.takeDamage(1)
