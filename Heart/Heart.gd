extends StaticBody2D


func _on_heartarea_body_entered(body):
	if body.name == "Player":
		if body.isHealthMax():
			get_tree().queue_delete(self)
			body.take_health(10)

