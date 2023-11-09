extends Node2D
@onready var tilemap3 = $TileMap3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open_door(num):
	$Sprite2D.hide()
	print(tilemap3)
	print("right?")
	if num == 1: 
		tilemap3.clear()
		'''
		tilemap.setcell(245, -2440, -1)
		tilemap.setcell(260, -2430, -1)
		'''
