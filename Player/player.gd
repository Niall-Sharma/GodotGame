extends CharacterBody2D 


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var hasLanded = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100

func _ready():
	$Camera2D.make_current()
	$PlayerGUI/HealthBar.modulate=Color(0,2,0)
	#connect("enemy_collision", self, "_on_enemy_collision")
	
func _physics_process(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta
		hasLanded = false

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

	move_and_slide()







 # Initialize the character's health





func take_damage(damage):
	health -= damage
	$PlayerGUI/HealthBar.value = health
	if health<=60:
		$PlayerGUI/HealthBar.modulate = Color(1, 1, 0)
	if health<=30:
		$PlayerGUI/HealthBar.modulate = Color("ff4500")
	if health <=10:
		$PlayerGUI/HealthBar.modulate = Color(1, 0, 0)
	if health <= 0:
		die()  # If health reaches zero or below, character dies

func die():
	queue_free()



func _on_area_2d_body_entered(body):
	if body.name == "enemy":
		$AttackSound.play()
		take_damage(10)
		print(health);
		
		


		
		
