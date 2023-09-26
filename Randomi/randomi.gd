extends Node2D
@export var land: PackedScene
var scene = preload("res://land.tscn")
var scener = preload("res://Randomi/randomi.tscn")
var landi = scene.instantiate()
var rx = landi.position.x
var ry = landi.position.y
# Called when the node enters the scene tree for the first time.
func _ready():


	add_child(landi)

	'''
	var land2 = land.duplicate()
	land2.position.x = land.position.x+300
	land2.position.y = land.position.y + randf()*300-150
	add_child(land2)
	'''
	rx = landi.position.x
	ry = landi.position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	var pos = $Player.position

	if rx < pos.x + 1000:
		var land2 = landi.duplicate()
		land2.position.x = rx+50
		land2.position.y = ry + randf()*150-75
		
		while ry > 900 or ry < 400:
			land2.position.y = ry + randf()*150-75
			ry = land2.position.y
		
		add_child(land2)
		rx = land2.position.x
		ry = land2.position.y
