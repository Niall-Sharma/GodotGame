extends CharacterBody2D
@onready var PLAYER : CharacterBody2D = $"../Player"

@onready var px = PLAYER.position.x
@onready var py = PLAYER.position.y
@onready var x = self.position.x
@onready var y = self.position.y
@onready var vec = Vector2(py-y,px-x)
@onready var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if abs(PLAYER.position.x - self.position.x) < 500:
			await get_tree().create_timer(3).timeout
			var target = PLAYER.position
			velocity = position.direction_to(target) * speed
			# look_at(target)
			if position.distance_to(target) > 10:
				move_and_slide()
func _physics_process(_delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(self)
		body.take_damage(10)
	else:
		get_tree().queue_delete(self)
