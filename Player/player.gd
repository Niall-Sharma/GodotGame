extends CharacterBody2D 
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var hasLanded = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100

@onready var animationTree = $AnimationTree
@onready var heatlhBar = $PlayerGUI/HealthBar

func _ready():
	heatlhBar.modulate=Color(0,2,0)
	animationTree.active = true
	
func _physics_process(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta
		hasLanded = false
		animationTree.set("parameters/conditions/inAir", true)

	if is_on_floor():
		animationTree.set("parameters/conditions/inAir", false)

	if !hasLanded and is_on_floor():
		$FallSound.play()
		hasLanded = true
		

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	animationTree.set("parameters/Run/blend_position", direction)
	move_and_slide()

	if direction < 0:
		$Sprite2D.flip_h = true
		
	if direction > 0:
		$Sprite2D.flip_h = false
		




 # Initialize the character's health





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

func die():
	get_tree().change_scene_to_file("res://DeathScene/Death.tscn") 



func _on_area_2d_body_entered(body):
	if body.name == "enemy":
		$AttackSound.play()
		take_damage(10)
		print(health);

func _on_area_2d_area_entered(area):
	if area.name == "coin_area":
		area.get_parent()._leave()
