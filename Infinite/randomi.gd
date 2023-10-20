extends Node2D
@export var land: PackedScene
var scene = preload("res://Infinite/land.tscn")
var scener = preload("res://Infinite/clarice.tscn")
var landi = scene.instantiate()
var rx = landi.position.x
var ry = landi.position.y
# Called when the node enters the scene tree for the first time.
func _ready():

	add_child(landi)

	'''
	var land2 = landi.duplicate()
	land2.position.x = landi.position.x+150
	land2.position.y = landi.position.y + randf()*150-75
	add_child(land2)
	'''

	rx = landi.position.x
	ry = landi.position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	'''
	var pos = $Player.position
	'''
	var pos = 300

	if rx < pos + 1000:
		var land2 = landi.duplicate()
		land2.position.x = rx+270
		land2.position.y = ry + randf()*150-75

		add_child(land2)
		rx = land2.position.x
		ry = land2.position.y
