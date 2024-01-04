extends Node2D
@export var land: PackedScene
var scene = preload("res://Infinite/land.tscn")
var landi = scene.instantiate()
var rx = landi.position.x
var ry = landi.position.y
# load initial platform
func _ready():

	add_child(landi)

	rx = landi.position.x
	ry = landi.position.y

# find player position and generate platforms
# --duplicate each previous platform
func _process(_delta):
	
	var pos = $Player.position

	if rx < pos.x + 1000:
		var land2 = landi.duplicate()

		land2.position.x = rx+270
		land2.position.y = ry + randf()*150-75

		add_child(land2)
		rx = land2.position.x
		ry = land2.position.y
		
		
		
