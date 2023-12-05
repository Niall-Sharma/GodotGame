extends Node2D
@onready var PLAYER : CharacterBody2D = $"../Player"
var px = PLAYER.position.x
var py = PLAYER.position.y
var x = self.position.x
var y = self.position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	Vector2(px-x,py-y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(self)
		body.take_damage(10)
		
