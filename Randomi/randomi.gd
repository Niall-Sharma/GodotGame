extends Node2D
@export var land_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = load("res://land.tscn")
	var land = scene.instantiate()
	land.initialize(500,500)
	add_child(land)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
