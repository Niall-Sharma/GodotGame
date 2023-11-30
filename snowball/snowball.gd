extends CharacterBody2D
@onready var PLAYER : CharacterBody2D = $"../Player"

var px = PLAYER.position.x
var py = PLAYER.position.y
var x = self.position.x
var y = self.position.y
@onready var vec = Vector2(py-y,px-x)
# Called when the node enters the scene tree for the first time.
func _ready():
	null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if abs(PLAYER.position.x - self.position.x) < 500:
			await get_tree().create_timer(3).timeout
			print("Help me")



func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(self)
		body.take_damage(10)
		
