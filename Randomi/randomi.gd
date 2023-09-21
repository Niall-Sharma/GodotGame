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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	var size = get_viewport_rect().size

	if rx < size.x - 1000:
		var land2 = landi.duplicate()
		land2.position.x = rx+300
		land2.position.y = ry + randf()*300-150
		'''
		while ry > 700 or ry < 100:
			land2.position.y = ry + randf()*200-100
		'''
		add_child(land2)
		rx = land2.position.x
		ry = land2.position.y
