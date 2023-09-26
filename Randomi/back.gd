extends Sprite2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".position.x = $Player.position.x
	$".".position.y = $Player.position.y
