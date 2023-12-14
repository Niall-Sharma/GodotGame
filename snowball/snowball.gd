extends CharacterBody2D
@onready var PLAYER : CharacterBody2D = $"../Player"

@onready var px = PLAYER.position.x
@onready var py = PLAYER.position.y
@onready var x = self.position.x
@onready var y = self.position.y
@onready var vec = Vector2(py-y,px-x)
@onready var speed = 96
@onready var moving = false
@onready var target = PLAYER.position
@onready var snoa = self.duplicate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func dupe():
	
	snoa.position.x = x
	snoa.position.y = y
	snoa.get_child(0).hide()
	$"..".add_child(snoa)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if abs(PLAYER.position.x - self.position.x) < 500 and abs(PLAYER.position.y - self.position.y) < 200:
		if (moving == false):
			await get_tree().create_timer(2).timeout
			$Sprite2D.show()
			moving = true
		target = PLAYER.position
		velocity = position.direction_to(target) * speed
		dupe()
			# look_at(target)

		if position.distance_to(target) > 10:
			move_and_slide()
			
				
func _physics_process(delta):

			if position.distance_to(target) > 10:
				move_and_slide()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var neg = 0
		if (self.position.x < body.position.x):
			neg = 1
			
		if (self.position.x > body.position.x) :
			neg = -1
		get_tree().queue_delete(self)
		
		body.take_damage(10, Vector2(neg*1000,0), false)
		
	else:
		get_tree().queue_delete(self)
