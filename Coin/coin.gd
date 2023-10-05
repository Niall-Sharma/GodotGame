extends Node2D


func _leave():
	get_tree().queue_delete(self)
