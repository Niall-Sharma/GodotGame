extends Area2D

class_name deathObject


func _on_body_entered(body):
	if body.name == "Player":
		body.die()
