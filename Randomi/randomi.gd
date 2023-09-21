extends Node2D
@export var land: PackedScene
var scene = preload("res://land.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():

	var land = scene.instantiate()
	add_child(land)
	
	var land2 = land.duplicate()
	land2.position.x = land.position.x+500
	land2.position.y = land.position.y
	add_child(land2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
