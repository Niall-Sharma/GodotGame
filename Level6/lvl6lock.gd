extends Area2D



var lvl6hehe = preload("res://lvl6hehe/lvl6he.tscn")



func _on_body_entered(body):
	if body.name == "Player":
		await get_tree().create_timer(0.5).timeout
		var newtile = lvl6hehe.instantiate()
		add_child(newtile)
		print("done for")
		await get_tree().create_timer(5).timeout
		remove_child(newtile)

