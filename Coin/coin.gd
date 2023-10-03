extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$coin_sprite.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _leave():
	$coin_sprite.visible = false
	for child in get_children():
		child.queue_free()
		print(child)
	queue_free()
	$/root/Master._addscore()
	$/root/Master._printscore()
