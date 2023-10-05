extends Node2D


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _leave():
	$coin_sprite.visible = false
	for child in get_children():
		if(child.get_child(0) != null):
			child.get_child(0).queue_free()
		child.queue_free()
		print(child)
	queue_free()
