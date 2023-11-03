extends StaticBody2D

func _on_coin_area_body_entered(body):
	if body.name == "Player":
		$PickupSound.play(0)
		get_tree().queue_delete(self)
		$/root/Master._add_coin()

